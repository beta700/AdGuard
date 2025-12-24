FROM adguard/adguardhome:latest
EXPOSE 10000
CMD ["/opt/adguardhome/AdGuardHome", "--web-addr", "0.0.0.0:10000", "--no-check-update", "--force-install"]
