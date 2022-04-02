# FROM golang:1.17.7-alpine
# ENV CGO_ENABLED=0
# WORKDIR /go/src/app
# COPY . .
# RUN go mod init && go mod tidy
# RUN go run sub.go

FROM golang:1.17.7-alpine
ENV CGO_ENABLED=0
WORKDIR /go/src/app
COPY . .
RUN go mod init && go mod tidy
RUN apk update && apk add git && apk --no-cache add curl && go get -u github.com/cosmtrek/air
CMD ["air", "-c", ".air.toml"]