#include <iostream>
#include "./memoryError/MemoryError.h"


int main(){
    int arr_size = 10;
    memoryLost(arr_size);
    extraIndex(arr_size);

    return 0;
}