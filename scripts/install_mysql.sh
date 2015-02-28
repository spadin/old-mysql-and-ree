pushd .

apt-get update

cd /tmp

wget http://downloads.mysql.com/archives/mysql-5.1/mysql-5.1.65.tar.gz

tar -zxf mysql-5.1.65.tar.gz

apt-get install -y build-essential libncurses5-dev libssl-dev libedit-dev readline-common libedit2

cd mysql-5.1.65

./configure\
   --datadir=/usr/share\
   --enable-assembler\
   --enable-local-infile\
   --enable-shared\
   --enable-static\
   --enable-thread-safe-client\
   --exec-prefix=/usr\
   --includedir=/usr/include\
   --infodir=/usr/share/info\
   --libexecdir=/usr/sbin\
   --localstatedir=/var/lib/mysql\
   --mandir=/usr/share/man\
   --prefix=/usr\
   --with-big-tables\
   --with-embedded-privilege-control\
   --with-embedded-server\
   --with-extra-charsets=all\
   --with-fast-mutexes\
   --with-libwrap\
   --with-mysqld-user=mysql\
   --with-plugins=max\
   --with-readline\
   --with-ssl\
   --with-system-type=debian-linux-gnu\
   --with-unix-socket-path=/var/run/mysqld/mysqld.sock\
   --without-docs

make
make install

rm mysql-5.1.65.tar.gz

mkdir /var/lib/mysql
useradd mysql
chown -R mysql:mysql /var/lib/mysql

sudo -u mysql mysql_install_db --user=mysql

mv /tmp/mysql-5.1.65/support-files/mysql.server /etc/init.d/
chmod +x /etc/init.d/mysql.server
service mysql.server start

/usr/bin/mysqladmin -u root password 'password'

popd
