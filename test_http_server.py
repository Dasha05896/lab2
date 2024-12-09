import unittest
import time
from http_server import trig_function  # Імпортуємо вашу функцію для тестування

class TestTrigFunction(unittest.TestCase):
    def test_time(self):
        # Записуємо час до виконання функції
        start_time = time.time()

        # Викликаємо функцію trig_function
        trig_function()

        # Додатково додаємо штучну затримку в тесті (якщо потрібно)
        time.sleep(5)  # Наприклад, додаємо затримку на 1 секунду

        # Записуємо час після виконання
        end_time = time.time()

        # Розраховуємо час виконання
        elapsed_time = end_time - start_time
        print(f"Elapsed time: {elapsed_time} seconds")

        # Перевіряємо, чи час виконання між 5 і 20 секундами
        self.assertGreaterEqual(elapsed_time, 5)  # Тестуємо, чи час >= 5 секунд
        self.assertLessEqual(elapsed_time, 20)   # Тестуємо, чи час <= 20 секунд

# Запускаємо тест, якщо скрипт виконується безпосередньо
if __name__ == '__main__':
    unittest.main()

