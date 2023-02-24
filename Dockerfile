FROM golang:1.19-alpine AS builder

WORKDIR /src/app

COPY go.mod .

RUN go mod download

COPY . .

RUN go build -o /go/src/app

FROM scratch

WORKDIR /src

COPY --from=builder /go/src/app .

CMD [ "/src/app" ]