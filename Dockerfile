FROM alpine:latest

RUN apk add --no-cache ca-certificates curl && \
    curl -L -o /tmp/AdGuardHome.tar.gz https://static.adguard.com/adguardhome/release/AdGuardHome_linux_amd64.tar.gz && \
    tar -xzf /tmp/AdGuardHome.tar.gz -C /tmp && \
    mkdir -p /opt/adguardhome && \
    mv /tmp/AdGuardHome/AdGuardHome /opt/adguardhome/AdGuardHome && \
    chmod +x /opt/adguardhome/AdGuardHome && \
    rm -rf /tmp/*

RUN mkdir -p /opt/adguardhome/conf /opt/adguardhome/work && \
    chmod -R 777 /opt/adguardhome

EXPOSE 10000

# التعديل هنا: استخدام --config بدلاً من --conf
CMD ["/opt/adguardhome/AdGuardHome", \
     "--work-dir", "/opt/adguardhome/work", \
     "--config", "/opt/adguardhome/conf/AdGuardHome.yaml", \
     "--web-addr", "0.0.0.0:10000", \
     "--no-check-update"]
