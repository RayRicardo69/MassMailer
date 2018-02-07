# BashMailer

# Instalation

# Debian
#sudo apt-get -y install postfix mailutils libsasl2-2 ca-certificates libsasl2-modules

# CentOS
#sudo yum -y install postfix mailutils libsasl2-2 ca-certificates libsasl2-modules

# How To Use?
This Mailer Auto Setup Config For Postfix.You Can Setup Your Manual Config In config.txt.And Set SMTP in smtp.txt

You need compile send.c for auto setup mailer before you sending email

#gcc send.c -o send

#./send
