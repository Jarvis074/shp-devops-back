FROM golang:latest as builder

WORKDIR /app

COPY . .

# установка зависимостей и сборка
RUN go build .

FROM scratch as runner

WORKDIR /app

COPY --from=builder /app/shp-devops-back /app/shp-devops-back

CMD "./shp-devops-back"