#!/bin/bash

init_user() {
	useradd -m $FTP_USER
	echo  $FTP_USER:$FTP_PASS | /usr/sbin/chpasswd
	mv /vsftpd/* /home/$FTP_USER
	rm -r /vsftpd
	chown $FTP_USER:$FTP_USER -R /home/$FTP_USER/
	echo  $FTP_USER | tee -a /etc/vsftpd.userlist
}

service vsftpd start
init_user
service vsftpd stop

exec vsftpd /etc/vsftpd.conf