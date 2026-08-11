#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define LINE_LEN 128

#define KIBI_IN_GIBI (1024*1024)

int main() {
    const char* LABEL = getenv("LABEL");
    if (LABEL == NULL) {
        LABEL = "ram:";
    }

    FILE* f = fopen("/proc/meminfo", "r");
    if (f == NULL) {
        fprintf(stderr, "could not open /proc/meminfo");
        return 1;
    }

    unsigned long total = 0, avail = 0, used = 0;

    while (!total || !avail) {
        char line[LINE_LEN];
        if (fgets(line, LINE_LEN, f) == NULL) break;

        const char* word = strtok(line, " ");
        if (word != NULL) {
            if (strcmp("MemTotal:", word) == 0) {
                word = strtok(NULL, " ");
                total = strtoul(word, NULL, 10);
            } else if (strcmp("MemAvailable:", word) == 0) {
                word = strtok(NULL, " ");
                avail = strtoul(word, NULL, 10);
            }
        }
    }

    // it actually does shave off around 3us
    // fclose(f);

    used = total - avail;

    float totalf = (float)total / KIBI_IN_GIBI;
    // float availf = (float)avail / KIBI_IN_GIBI;
    float usedf = (float)used / KIBI_IN_GIBI;

    printf("%s %.1fG/%.1fG\n", LABEL, usedf, totalf);
}
