FROM golang:1.16-alpine

LABEL maintainer="cedille"

WORKDIR /app

COPY go.mod go.sum api/ ./
COPY api/ api/

ENV GOPATH ""
ENV DATABASE=$DATABASE
ENV HOST=$HOST
ENV USER=$USER
ENV PASSWORD=$PASSWORD
ENV ORIGINS=$ORIGINS
ENV SECRET_KEY=$SECRET_KEY

EXPOSE $PORT

RUN go mod download && go build -o /main

CMD ["/main"]