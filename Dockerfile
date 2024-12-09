# Вибір базового образу
FROM python:3.9-slim

# Встановлення залежностей
RUN pip install flask

# Копіюємо ваш код у контейнер
COPY . /app
WORKDIR /app

# Відкриваємо порт
EXPOSE 5000

# Команда для запуску сервера
CMD ["python", "http_server.py"]
