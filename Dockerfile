FROM alpine:latest
LABEL maintainer "LingMaxDNS <LingMax>"

WORKDIR /root
COPY LingMaxDns_linux_amd64 /root/LingMaxDns_linux_amd64 && lingmax.start /etc/local.d/lingmax.start

RUN set -ex \
	&& chmod +x /root/LingMaxDns_linux_amd64 \
	&& apk add openrc \
	&& chmod +x /etc/local.d/lingmax.start \
	&& rc-update add local
	
CMD /root/LingMaxDns_linux_amd64
EXPOSE 8287
