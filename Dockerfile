FROM golang:1.16 AS base

WORKDIR /go/src/app

COPY ./health ./health
COPY go.mod .
COPY *.go .

#RUN go mod init

RUN go build -o main .

EXPOSE 8080

CMD ["/go/src/app/main"]