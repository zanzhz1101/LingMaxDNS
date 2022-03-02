FROM alpine:latest
LABEL maintainer "LingMaxDNS <LingMax>"

WORKDIR /root
COPY LingMaxDns_linux_amd64 /root/LingMaxDns_linux_amd64

RUN set -ex \
	&& chmod +x /root/LingMaxDns_linux_amd64
	
CMD /root/LingMaxDns_linux_amd64
EXPOSE 8287
