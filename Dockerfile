FROM golang:1.20 as awg
COPY . /awg
WORKDIR /awg
RUN go mod download && \
    go mod verify && \
    go build -ldflags '-linkmode external -extldflags "-fno-PIC -static"' -v -o /usr/bin

FROM alpine:3.19
ARG AWGTOOLS_RELEASE="1.0.20240202"
RUN apk --no-cache add iproute2 bash && \
    wget https://github.com/amnezia-vpn/amneziawg-tools/releases/download/v${AWGTOOLS_RELEASE}/alpine-3.19-amneziawg-tools.zip && \
    unzip alpine-3.19-amneziawg-tools.zip -d /usr/bin/ && \
    chmod +x /usr/bin/wg /usr/bin/wg-quick
COPY --from=awg /usr/bin/amneziawg-go /usr/bin/amneziawg-go
