FROM alpine:latest
LABEL maintainer "LingMaxDNS <LingMax>"

RUN set -ex \
	&& mkdir /etc/local.d \
	&& apk add openrc \
	&& wget https://gitee.com/zanzhz1101/LingMaxDNS/raw/main/lingmax.start -P /etc/local.d \
	&& wget https://gitee.com/zanzhz1101/LingMaxDNS/raw/main/LingMaxDns_linux_amd64 -P /etc/local.d \
	&& chmod +x /etc/local.d/LingMaxDns_linux_amd64 \
	&& chmod +x /etc/local.d/lingmax.start \
	&& rc-update add local
	
EXPOSE 8287/udp
