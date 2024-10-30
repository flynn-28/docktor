# Docktor

## Overview
Docktor is a TOR proxy running in a docker container. 

## Install

### Docker Compose
1. clone repository
```
git clone https://github.com/flynn-28/docktor/
```
2. open directory
```
cd docktor
```
3. start container
```
docker-compose up -d --build
```

### Dockerfile
1. clone repository
```
git clone https://github.com/flynn-28/docktor/
```
2. open directory
```
cd docktor
```
3. build container
```
docker build -t docktor .
```
4. run container
```
docker run -d --name tor-proxy -p 9050:9050 docktor
```

### docker-cli
1. run the following command
```
docker run -d \
  --name=docktor \
  -p 9050:9050 \
  -p 8080:8080 \
  -e TZ=Etc/UTC \
  --restart unless-stopped \
  alpine:latest \
  /bin/sh -c "apk update && \
              apk add --no-cache tor && \
              echo 'SocksPort 0.0.0.0:9050 \ ControlPort 9051 \ HTTPTunnelPort 8080' > /etc/tor/torrc && \
              tor -f /etc/tor/torrc"
```
