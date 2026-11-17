#!/usr/bin/env bash
set -euo pipefail
echo "Instalando Apache e firewalld..."
dnf install -y httpd firewalld
mkdir -p /var/www/html
cp -r /vagrant/html/. /var/www/html/
systemctl enable --now httpd
systemctl enable --now firewalld
firewall-cmd --permanent --add-service=http
firewall-cmd --reload
echo "Provisionamento concluído. Acesse http://localhost:8080"
