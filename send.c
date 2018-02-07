#include <stdio.h>
#include <stdlib.h>
#include <string.h>


static FILE  *foo,*bar,*setting,*config;

void SMTP(){
 foo = fopen("/etc/postfix/sasl/sasl_passwd","r");
 system("clear");
 printf("Start Postfix\n");
 system("systemctl start postfix");
 //setting smtp
 setting = fopen("smtp.txt","r");
 system("rm /etc/postfix/sasl/sasl_passwd");
 printf("Setup SMTP....\n");
 system("sleep 2s");
 system("cp smtp.txt /etc/postfix/sasl/");
 setting = fopen("/etc/postfix/sasl/smtp.txt","r");
 system("mv /etc/postfix/sasl/smtp.txt /etc/postfix/sasl/sasl_passwd");
 system("sudo chmod 400 /etc/postfix/sasl/sasl_passwd");
 system("sudo postmap /etc/postfix/sasl/sasl_passwd");
}
void Config(){
    bar = fopen("/etc/postfix/main.cf","r");
    config = fopen("config.txt","r");
    system("rm /etc/postfix/main.cf");
    printf("Setup Config....\n");
    system("sleep 2s");
    system("cp config.txt /etc/postfix/");
    config = fopen("/etc/postfix/config.txt","r");
    system("mv /etc/postfix/config.txt /etc/postfix/main.cf");
}

int main(){
 SMTP();
 Config();
 printf("Restart Postfix\n");
 system("systemctl restart postfix");
 system("sleep 2s");
 printf("Setup Complited!!!\n");
 printf("Running Sender\n");
 system("sleep 5s");
 printf("Sender Ready!!\n");
 system("sleep 2s");
 system("clear");
 system("./function.sh");
return 0;
}
