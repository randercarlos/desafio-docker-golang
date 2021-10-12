# Build executable stage
FROM golang:1.17-alpine AS builder

COPY . /app
WORKDIR /app

RUN go env -w GO111MODULE=off
RUN go build

ENTRYPOINT /app/app

# Build final image
FROM scratch

WORKDIR /root/

COPY --from=builder /app/app .
CMD ["./app"]