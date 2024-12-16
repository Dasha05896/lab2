#!/bin/bash

# Запускаємо srv1 на ядрі 0
taskset -c 0 docker run -d --name srv1 dasha05896/lab2-http-server


# Перевірка чи srv1 залишається зайнятим більше 2 хвилин
while true; do
    if ! docker stats srv1 --no-stream | grep -q "0.00%"; then
        # Запускаємо srv2 на ядрі 1
        taskset -c 1 docker run -d --name srv2 dasha05896/lab2-http-server

        break
    fi
    sleep 60
done

# Перевірка чи srv2 залишається зайнятим більше 2 хвилин
while true; do
    if ! docker stats srv2 --no-stream | grep -q "0.00%"; then
        # Запускаємо srv3 на ядрі 2
        taskset -c 2 docker run -d --name srv3 dasha05896/lab2-http-server

        break
    fi
    sleep 60
done

# Логіка для моніторингу srv3 та завершення бездіяльного контейнера
while true; do
    if docker stats srv3 --no-stream | grep -q "0.00%"; then
        echo "srv3 is idle, stopping the container."
        docker stop srv3
        docker rm srv3
        break
    fi
    sleep 60
done

# Логіка для оновлення контейнерів, якщо є нова версія з Docker Hub
while true; do
    # Перевірка на нову версію контейнера в Docker Hub (потрібно налаштувати відповідно до вашої політики оновлень)
    docker pull dasha05896/lab2-http-server
    
    # Оновлення контейнерів srv1, srv2, srv3, якщо вони запущені
    if docker ps --filter "name=srv1" --filter "status=running" | grep -q "srv1"; then
        docker stop srv1
        docker rm srv1
        taskset -c 0 docker run -d --name srv1 dasha05896/lab2-http-server

    fi

    if docker ps --filter "name=srv2" --filter "status=running" | grep -q "srv2"; then
        docker stop srv2
        docker rm srv2
        taskset -c 1 docker run -d --name srv2 dasha05896/lab2-http-server

    fi

    if docker ps --filter "name=srv3" --filter "status=running" | grep -q "srv3"; then
        docker stop srv3
        docker rm srv3
        taskset -c 2 docker run -d --name srv3 dasha05896/lab2-http-server

    fi

    # Затримка між перевірками на оновлення
    sleep 3600
done
