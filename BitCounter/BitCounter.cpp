#include "BitCounter.h"

int CountBits(unsigned number) {
  int count;
  while (number > 0) {
    if (number & 1) {  // проверка на то, что последний бит единичный
      count++;
    }
    number >>= 2;  // сдвигаем число на 2 бита вправо
  }
  return count;
}

void run(std::istream &input, std::ostream &output) {
    unsigned number;
    input >> number;
    output << CountBits(number) << std::endl;
}