FROM alpine:latest

RUN apk update && apk add --no-cache tor

RUN echo "SocksPort 0.0.0.0:9050\nControlPort 9051\nHTTPTunnelPort 8080" > /etc/tor/torrc

EXPOSE 9050 8080

# Run Tor
CMD ["tor", "-f", "/etc/tor/torrc"]
