FROM alpine:latest
LABEL maintainer "LingMaxDNS <LingMax>"


RUN set -ex \
	&& mkdir /etc/loacl.d \
	&& apk add openrc \
	&& wget https://gitee.com/zanzhz1101/LingMaxDNS/raw/main/lingmax.start -P /root \
	&& wget https://gitee.com/zanzhz1101/LingMaxDNS/raw/main/LingMaxDns_linux_amd64 -P /etc/local.d \
	&& chmod +x /root/LingMaxDns_linux_amd64 \
	&& chmod +x /etc/local.d/lingmax.start \
	&& apk add openrc \
	&& rc-update add local
	
CMD /root/LingMaxDns_linux_amd64
EXPOSE 8287
