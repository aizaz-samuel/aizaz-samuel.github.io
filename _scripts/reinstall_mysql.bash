#/bin/bash
# Script to fully remove and reinstall mysql server
sudo su
systemctl stop mysql
apt-get remove --purge mysql*
apt-get purge mysql*
apt-get autoremove
apt-get autoclean
apt-get remove dbconfig-mysql
apt-get dist-upgrade
apt-get install mysql-server
systemctl start mysql

# usually the root user has blank password on most mysql implementations
# create user called user with password = password
# below command takes you to the mysql command line
mysql
CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *. * TO 'user'@'localhost';
exit

exit # exit su
