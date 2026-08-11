#include <stdio.h>
#include <stdlib.h>
#include <sys/statvfs.h>

#define GIBI (1024*1024*1024)

int main() {
    const char* LABEL = getenv("LABEL");
    if (LABEL == NULL) LABEL = "storage:";
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

    printf("%s \"%s\" %.1fG/%.1fG\n", LABEL, MOUNTPOINT, usedf, totalf);
}
