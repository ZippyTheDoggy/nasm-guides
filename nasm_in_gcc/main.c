#include <stdio.h>
#include <inttypes.h>

int64_t add(int64_t, int64_t);

int main() {
    
    printf("%ld\n", add(1, 1));
    printf("%ld\n", add(10, 50));

    return 0;
}