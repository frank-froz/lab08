#!/bin/bash
# Actualizar e instalar dependencias
apt update -y
apt upgrade -y
apt install apache2 git -y

# Clonar el repositorio con tu página
cd /var/www/html
git clone https://github.com/frank-froz/lab08

# Mover contenido del repositorio a la raíz de Apache
cp -r website/* .
rm -rf website

# Dar permisos adecuados
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

# Habilitar Apache al inicio
systemctl enable apache2
systemctl restart apache2
