FROM golang:alpine AS go-builder
WORKDIR /src/app/
COPY chalenger-docker.go .
RUN go build chalenger-docker.go

FROM scratch
COPY --from=go-builder /src/app/chalenger-docker .
ENTRYPOINT [ "./chalenger-docker" ]
