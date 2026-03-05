FROM golang:1.26-alpine AS build

WORKDIR /app

COPY go.mod ./
COPY go.sum ./

RUN go mod download

COPY . .

RUN go build -o analytics .

FROM alpine:latest AS runtime

WORKDIR /app

COPY --from=build /app/analytics .

CMD ["./analytics"]
