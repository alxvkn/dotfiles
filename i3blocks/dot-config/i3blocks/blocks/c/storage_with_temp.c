#include <linux/limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <sys/statvfs.h>
#include <sys/stat.h>
#include <sys/sysmacros.h>
#include <unistd.h>
#include <dirent.h>

#define GIBI (1024*1024*1024)

bool get_dev(const char* mountpoint, char* path_out) {
    struct stat st;
    char link[PATH_MAX], link_content[PATH_MAX];

    if (stat(mountpoint, &st))
        return false;

    snprintf(link, sizeof(link), "/sys/dev/block/%u:%u", major(st.st_dev), minor(st.st_dev));

    if (readlink(link, link_content, sizeof(link_content) - 1) < 0) {
        perror("readlink");
        return false;
    }

    link_content[sizeof(link_content) - 1] = '\0';

    chdir("/sys/dev/block");
    if (!realpath(link_content, path_out)) {
        perror("realpath");
        return false;
    }

    return true;
}

bool find_closest_hwmon(const char* dev_path, char* hwmon_path_out) {
    char _dev_path[PATH_MAX];
    strncpy(_dev_path, dev_path, PATH_MAX); // local copy so we can append /..

    bool found = false;

    while (!found) {
        DIR* dir = opendir(_dev_path);
        if (!dir) {
            perror("opendir");
            return -1;
        }

        struct dirent* dir_entry;

        while ((dir_entry = readdir(dir))) {
            if (strncmp(dir_entry->d_name, "hwmon", 5) == 0) {
                snprintf(hwmon_path_out, PATH_MAX, "%s/%s", _dev_path, dir_entry->d_name);
                puts(hwmon_path_out);
                found = true;
                break;
            }
        }
        closedir(dir);

        strncat(_dev_path, "/..", PATH_MAX - strnlen(_dev_path, PATH_MAX));
    }

    return true;
}

int temperature(const char* mountpoint) {
    char dev_path[PATH_MAX];

    if (!get_dev(mountpoint, dev_path)) return -1;

    char hwmon_path[PATH_MAX];

    if (!find_closest_hwmon(dev_path, hwmon_path)) return -1;

    strncat(hwmon_path, "/temp1_input", PATH_MAX - strnlen(hwmon_path, PATH_MAX));

    FILE* f = fopen(hwmon_path, "r");
    if (!f) {
        perror("fopen");
        return -1;
    }

    char buf[32];
    fread(buf, 32, 32, f);

    fclose(f);

    return atoi(buf);
}

int main() {
    const char* LABEL = getenv("LABEL");
    if (LABEL == NULL) LABEL = "storage:";
    const char* LABEL_TEMP = getenv("LABEL_TEMP");
    if (LABEL_TEMP == NULL) LABEL_TEMP = "temp:";
    const char* MOUNTPOINT = getenv("MOUNTPOINT");
    if (MOUNTPOINT == NULL) MOUNTPOINT = "/";

    struct statvfs st;
    if (statvfs(MOUNTPOINT, &st) != 0) {
        fprintf(stderr, "statvfs() failed");
        return 1;
    }

    unsigned long long avail = (unsigned long long)st.f_bavail * st.f_frsize;
    unsigned long long total = (unsigned long long)st.f_blocks * st.f_frsize;
    unsigned long long used = total - avail;

    // float availf = (float)avail / GIBI;
    float totalf = (float)total / GIBI;
    float usedf = (float)used / GIBI;

    printf(
        "%s \"%s\" %.1fG/%.1fG %s %.2f °C\n",
        LABEL,
        MOUNTPOINT,
        usedf,
        totalf,
        LABEL_TEMP,
        temperature(MOUNTPOINT) / 1000.0
    );
}
