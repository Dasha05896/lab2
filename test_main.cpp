#include <gtest/gtest.h>

// Функція для тестування
int add(int a, int b) {
    return a + b;
}

// Тест
TEST(AdditionTest, HandlesPositiveInput) {
    EXPECT_EQ(add(1, 2), 3);
    EXPECT_EQ(add(5, 5), 10);
}

TEST(AdditionTest, HandlesNegativeInput) {
    EXPECT_EQ(add(-1, -1), -2);
    EXPECT_EQ(add(-5, 5), 0);
}

// Основна функція для запуску тестів
int main(int argc, char** argv) {
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
