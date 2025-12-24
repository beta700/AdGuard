FROM adguard/adguardhome:latest

# إنشاء مجلدات العمل ومنحها صلاحيات كاملة
USER root
RUN mkdir -p /opt/adguardhome/conf /opt/adguardhome/work && \
    chmod -R 777 /opt/adguardhome/conf /opt/adguardhome/work && \
    chmod +x /opt/adguardhome/AdGuardHome

# تعيين منفذ Render الافتراضي
ENV PORT=10000
EXPOSE 10000

# التشغيل بدون استخدام ميزات تحتاج صلاحيات Root
CMD ["/opt/adguardhome/AdGuardHome", \
     "--work-dir", "/opt/adguardhome/work", \
     "--conf", "/opt/adguardhome/conf/AdGuardHome.yaml", \
     "--web-addr", "0.0.0.0:10000", \
     "--no-check-update"]
