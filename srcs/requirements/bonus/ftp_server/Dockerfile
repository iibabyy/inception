FROM debian:bullseye

RUN apt update \
	&& apt install -y vsftpd \
	&& apt clean

RUN mkdir -p /var/ftp/uploads \
	&& chown -R ftp:ftp /var/ftp \
	&& chmod -R 777 /var/ftp \
	&& mkdir -p /var/run/vsftpd/empty

# RUN useradd -m $FTP_USER
# RUN echo "$FTP_USER:$FTP_PASS" | chpasswd
# RUN chown -R $FTP_USER:$FTP_USER /var/ftp

COPY ./conf/vsftpd.conf /etc/vsftpd.conf
COPY ./tools/init_ftp.sh /init_ftp.sh
RUN chmod +x /init_ftp.sh

ENTRYPOINT [ "/init_ftp.sh" ]
# CMD [ "vsftpd", "/etc/vsftpd.conf" ]