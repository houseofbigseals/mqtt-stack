# Проект: Docker Compose для Mosquitto, Postgres, Telegraf, Grafana, Node-RED, WB Vue Dashboard, Dozzle и Portainer

Этот проект представляет собой набор сервисов, развернутых с помощью Docker Compose, для создания полноценной платформы мониторинга и управления данными. Включает в себя MQTT-брокер (Mosquitto), базу данных (Postgres/TimescaleDB), сбор метрик (Telegraf), визуализацию данных (Grafana), автоматизацию (Node-RED), веб-интерфейс (WB Vue Dashboard), а также инструменты для мониторинга контейнеров (Dozzle и Portainer).

### Содержание

1. Требования
2. Установка и запуск
3. Сервисы
4. Настройка переменных окружения
5. Пример файла .env
6. Доступ к сервисам

### Требования

- Установленный Docker и Docker Compose.
- Базовые знания работы с Docker и командной строкой.

### Установка и запуск

1. Склонируйте репозиторий:

```bash
git clone https://github.com/ValentinAlekhin/mqtt-stack
cd mqtt-stack
```

2. Создайте файл `.env` на основе примера `example.env`:

```bash
cp example.env .env
```

1. Отредактируйте файл .env, указав необходимые значения переменных окружения.

2. Запустите сервисы с помощью Docker Compose:

```bash
docker-compose up -d
```

5. После запуска все сервисы будут доступны по указанным портам (см. раздел Доступ к сервисам).

### Сервисы

#### Mosquitto (MQTT Broker)

- Порт: `${MOSQUITTO_PORT:-1883}`
- Описание: MQTT-брокер для обмена сообщениями между устройствами и сервисами.

#### Postgres (TimescaleDB)

- Порт: `${POSTGRES_PORT:-5432}`
- Описание: База данных с поддержкой временных рядов (TimescaleDB) для хранения метрик и других данных.

#### Telegraf

- Описание: Сборщик метрик, который отправляет данные в Postgres и другие системы.

#### Grafana

- Порт: `${GRAFANA_PORT:-3001}`
- Описание: Инструмент для визуализации данных и создания дашбордов.

#### Node-RED

- Порт: `${NODERED_PORT:-1880}`
- Описание: Платформа для автоматизации и создания потоков данных.

#### WB Vue Dashboard

- Порт: `${WB_VUE_DASHBOARD_PORT:-3000}`
- Описание: Веб-интерфейс для отображения данных и управления системой.

#### Dozzle

- Порт: `${DOZZLE_PORT:-8080}`
- Описание: Инструмент для мониторинга логов контейнеров в реальном времени.

#### Portainer

- Порт: `${PORTAINER_PORT:-9000}`
- Описание: Веб-интерфейс для управления Docker-контейнерами.

### Настройка переменных окружения

Все внешние порты и чувствительные данные (например, пароли) вынесены в переменные окружения. Для настройки создайте файл `.env` на основе примера `example.env`:

```bash
cp example.env .env
```

Отредактируйте файл `.env`, указав необходимые значения.

Пример файла `.env`

```env
# Mosquitto
MOSQUITTO_PORT=1883

# PostgreSQL
POSTGRES_PORT=5433
POSTGRES_USER=admin
POSTGRES_PASSWORD=admin
POSTGRES_DB=mqtt

# Grafana
GRAFANA_PORT=3001
GRAFANA_ADMIN_USER=admin
GRAFANA_ADMIN_PASSWORD=admin

# Node red
NODERED_PORT=1880

# WB Vue Dashboard
WB_VUE_DASHBOARD_PORT=3000
NUXT_PUBLIC_MQTT_BROKER=ws://192.168.1.150/mqtt

# Dozzle
DOZZLE_PORT=8080

# Portainer
PORTAINER_PORT=9000
```

### Доступ к сервисам

После запуска сервисы будут доступны по следующим адресам:

- Mosquitto: `mqtt://localhost:${MOSQUITTO_PORT:-1883}`
- Postgres: `postgresql://${POSTGRES_USER}:${POSTGRES_PASSWORD}@localhost:${POSTGRES_PORT:-5432}/${POSTGRES_DB}`
- Grafana: `http://localhost:${GRAFANA_PORT:-3001}`
- Node-RED: `http://localhost:${NODERED_PORT:-1880}`
- WB Vue Dashboard: `http://localhost:${WB_VUE_DASHBOARD_PORT:-3000}`
- Dozzle: `http://localhost:${DOZZLE_PORT:-8080}`
- Portainer: `http://localhost:${PORTAINER_PORT:-9000}`
