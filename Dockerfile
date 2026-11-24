cat << 'EOF' > Dockerfile
FROM php:8.3-cli-alpine

RUN apk add --no-cache \
    curl \
    libcurl \
    ca-certificates \
    poppler-utils \
    tzdata

ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN docker-php-ext-install curl

WORKDIR /app

COPY . /app

RUN mkdir -p /app/data && chmod -R 777 /app/data

CMD ["php", "/app/bot.php"]
EOF
docker build -t bot-runner .


