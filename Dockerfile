FROM golang:alpine AS builder
RUN mkdir /src
ADD *.go /src/
WORKDIR /src
RUN go mod init main.codeeducation
RUN go build -a -o main .

FROM scratch
COPY --from=builder /src/main .
CMD ["./main"]

