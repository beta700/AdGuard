FROM alpine:latest

# تحميل الملف التنفيذي مباشرة
RUN apk add --no-cache ca-certificates curl && \
    curl -L -o /tmp/AdGuardHome.tar.gz https://static.adguard.com/adguardhome/release/AdGuardHome_linux_amd64.tar.gz && \
    tar -xzf /tmp/AdGuardHome.tar.gz -C /tmp && \
    mkdir -p /opt/adguardhome && \
    mv /tmp/AdGuardHome/AdGuardHome /opt/adguardhome/AdGuardHome && \
    chmod +x /opt/adguardhome/AdGuardHome && \
    rm -rf /tmp/*

# إعداد المجلدات بصلاحيات مفتوحة
RUN mkdir -p /opt/adguardhome/conf /opt/adguardhome/work && \
    chmod -R 777 /opt/adguardhome

EXPOSE 10000

# تشغيل البرنامج كملف عادي وليس كـ Root
CMD ["/opt/adguardhome/AdGuardHome", \
     "--work-dir", "/opt/adguardhome/work", \
     "--conf", "/opt/adguardhome/conf/AdGuardHome.yaml", \
     "--web-addr", "0.0.0.0:10000", \
     "--no-check-update"]
