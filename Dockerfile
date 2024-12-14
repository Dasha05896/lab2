# Перший етап: збірка програми
FROM golang:1.20 AS builder

# Робоча директорія для збірки
WORKDIR /app

# Завантаження файлів із публічного GitHub репозиторію
RUN git clone https://github.com/Dasha05896/lab2.git .

# Збірка виконуваного файлу
RUN go build -o server .

# Другий етап: створення фінального образу на основі Alpine
FROM alpine:latest

# Копіюємо виконуваний файл з першого етапу
COPY --from=builder /app/server /server

# Відкриваємо порт для HTTP-сервера
EXPOSE 8080

# Запуск сервера
CMD ["/server"]
