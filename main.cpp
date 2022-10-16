#include <iostream>
#include "./memoryError/MemoryError.h"


int main(){
    int arr_size = 10;
    std :: cout << " 1 hello from main" << std :: endl ;
    memoryLost(arr_size);
    std :: cout << " 2 hello from main" << std :: endl ;
    extraIndex(arr_size);
    std :: cout << " 3 hello from main" << std :: endl ;

    return 0;
}