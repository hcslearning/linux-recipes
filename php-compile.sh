#phpVersion=7.2.10
phpVersion=7.2.21

echo "Descargando PHP"
#wget "http://us1.php.net/distributions/php-${phpVersion}.tar.bz2"
rm -rf php-${phpVersion}
tar -xvjf php-${phpVersion}.tar.bz2

echo "Compilando PHP"
cd php-$phpVersion
# fileinfo se desactiva por error de memoria (necesita 1GB para ser compilado y openshift gratis tiene 512mb)
./configure  \
    --prefix=$phpInstallDir \
    --enable-fpm \
    --with-mysqli \
    --with-pdo-mysql \
    --with-pgsql \
    --with-pdo-pgsql \
    --with-zlib \
    --with-gd \
    --with-jpeg-dir \
    --with-curl \
    --enable-mbstring \
    --with-openssl \
    --disable-fileinfo \
    --enable-zip \
    --enable-intl \
    --enable-soap \

make
make install

echo "Terminando el proceso con PHP"
cd ..
