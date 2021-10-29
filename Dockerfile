FROM golang:1.16 AS base


ENV SWAGGER_VERSION=v0.27.0

ENV download_url=https://github.com/go-swagger/go-swagger/releases/download/${SWAGGER_VERSION}/swagger_linux_amd64
RUN curl -o /usr/local/bin/swagger -L'#' "$download_url"
RUN chmod +x /usr/local/bin/swagger

WORKDIR /go/src/app

COPY ./health ./health
COPY go.mod .
COPY *.go .

#RUN go mod init

RUN go build -o main .

#Build the container to run
FROM alpine:3.13 AS Publish

#Copy compiled app from stage build
COPY --from=base /go/src/app /app

COPY --from=base /usr/local/bin/swagger /usr/local/bin/swagger

#copy ca certs
COPY --from=base /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs


EXPOSE 8080

CMD ["/app/main"]