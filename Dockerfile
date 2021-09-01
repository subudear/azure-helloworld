FROM golang:1.16 AS base

WORKDIR /go/src/app

COPY ./health ./health
COPY go.mod .
COPY *.go .

#RUN go mod init

RUN go build -o main .

#Build the container to run
FROM scratch AS Publish

#Copy compiled app from stage build
COPY --from=base /go/src/app /app

#copy ca certs
COPY --from=base /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs


EXPOSE 8080

CMD ["/go/src/app/main"]