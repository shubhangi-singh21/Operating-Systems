#include <iostream>

int sum_of_two_numbers(int first, int second) {
    return first + second;
}

int main() {
    int a = 0;
    int b = 0;
    std::cin >> a;
    std::cin >> b;
    std::cout << sum_of_two_numbers(a, b);
    return 0;
}
