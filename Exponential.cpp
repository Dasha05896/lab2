#include "Exponential.h"

// FuncA calculates the sum of the first n elements of the Taylor series for e^x.
// The n parameter specifies the number of members to be included in the sum.
double Exponential::FuncA(int n) {
    double sum = 1.0; // Initial member (x^0 / 0!) = 1
    double term = 1.0;
    for (int i = 1; i < n; ++i) { // Calculation of the summation of the first n terms
        term *= 1.0 / i;
        sum += term;
    }
    return sum;
}
