#!/usr/bin/env bash
echo "Instalando o Apache e configurando..."
dnf install -y httpd
mkdir -p /var/www/html
cp -r /vagrant/html/. /var/www/html/
systemctl enable httpd
systemctl start httpd
# liberar porta 80 no firewall
systemctl enable firewalld
systemctl start firewalld
firewall-cmd --permanent --add-service=http
firewall-cmd --reload