#include "Exponential.h"
#include <cmath>

double Exponential::FuncA(int n) {
    double sum = 1.0; // Initial member (x^0 / 0!) = 1
    double term = 1.0;
    for (int i = 1; i < n; ++i) {
        term *= 1.0 / i; // Let's count (x^i / i!)
        sum += term;
    }
    return sum;
}
