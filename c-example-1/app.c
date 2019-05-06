#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

int main (int argc, char * argv[]) {
    uint32_t a, b;

    FILE * fh = fopen(argv[1], "rb");
    if (fh == NULL) {
        fprintf(stderr, "Failed to open %s\n", argv[1]);
        return -1;
    }

    if (    (fread(&a, 1, 4, fh) != 4)
         || (fread(&b, 1, 4, fh) != 4)) {
        fprintf(stderr, "Not enough data read\n");
        return -1;
    }

    fclose(fh);

    if ((a == 0x41424344) && (b == 0x45464748)) {
        /*
        * Cast to 64-bit number first to get rid of warning about a not being
        * same bit-width as pointer.
        */
        *((uint32_t *) (uint64_t) a) = b;
    }

    return 0;
}
