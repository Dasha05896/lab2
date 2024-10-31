#include <iostream>
#include "Exponential.h"

int main() {
    Exponential exp;
    int n = 0;
    std::cout << "Enter the number of terms: ";
    std::cin >> n;
    double result = exp.FuncA(n); // Call FuncA
    std::cout << "Result: " << result << std::endl;
    return 0;
}
