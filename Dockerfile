FROM adguard/adguardhome:latest

# إنشاء مجلدات العمل ومنح الصلاحيات اللازمة
RUN mkdir -p /opt/adguardhome/conf /opt/adguardhome/work && \
    chmod -R 777 /opt/adguardhome/conf /opt/adguardhome/work

# تشغيل البرنامج باستخدام مستخدم بصلاحيات محدودة لتجنب خطأ Permission
USER 1000

EXPOSE 10000

# الأمر النهائي للتشغيل مع تحديد مسارات العمل
CMD ["/opt/adguardhome/AdGuardHome", \
     "--work-dir", "/opt/adguardhome/work", \
     "--conf", "/opt/adguardhome/conf/AdGuardHome.yaml", \
     "--web-addr", "0.0.0.0:10000", \
     "--no-check-update"]
