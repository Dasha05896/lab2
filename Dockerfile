# Перший етап: збірка програми
FROM golang:1.21 AS builder

# Робоча директорія для коду
WORKDIR /app

# Копіюємо файли go.mod і go.sum для завантаження залежностей
COPY go.mod go.sum ./
RUN go mod download

# Копіюємо весь вихідний код програми
COPY . .

# Будуємо виконуваний файл без використання C-бібліотек
RUN CGO_ENABLED=0 GOARCH=amd64 GOOS=linux go build -o server .

# Другий етап: створення фінального образу на основі Debian
FROM debian:bullseye-slim

# Встановлюємо тільки базові залежності
RUN apt-get update && apt-get install -y \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Копіюємо скомпільований файл із попереднього етапу
COPY --from=builder /app/server /server

# Встановлюємо права доступу для виконання
RUN chmod +x /server

# Відкриваємо порт для роботи сервера
EXPOSE 8080

# Команда для запуску програми
CMD ["/server"]

