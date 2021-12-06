FROM golang:1.16 AS base

WORKDIR /go/src/app

COPY ./health ./health
COPY go.mod .
COPY *.go .

RUN go mod init

RUN go build -o main .


#Build the container to run
FROM alpine:3.13 AS Publish

#Copy compiled app from stage build
COPY --from=base /go/src/app /app

EXPOSE 8080

ENTRYPOINT ["/app/main"]