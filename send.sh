#!/bin/bash

cyan='\e[0;36m' 
green='\e[0;34m' 
okegreen='\033[92m' 
lightgreen='\e[1;32m' 
white='\e[1;37m' 
red='\e[1;31m' 
yellow='\e[1;33m' 
BlueF='\e[1;34m'

clear
systemctl stop postfix
touch /etc/postfix/sasl_passwd
sleep 5s
echo "Start Postfix"
sleep 2s
systemctl start postfix
echo "Set Up Postfix"

#SMTP
rm /etc/postfix/sasl_passwd
cp smtp.txt /etc/postfix/
mv /etc/postfix/smtp.txt /etc/postfix/sasl_passwd
chmod 400 /etc/postfix/sasl_passwd
postmap /etc/postfix/sasl_passwd


#Config
rm /etc/postfix/main.cf
cp config.txt /etc/postfix/
mv /etc/postfix/config.txt /etc/postfix/main.cf

#ADDHeader
rm /etc/postfix/addheader
cp addheader.txt /etc/postfix/
mv /etc/postfix/addheader.txt /etc/postfix/addheader

#Open New Terminal To View Log
gnome-terminal -e "tail -f /var/log/mail.log" 

array[0]="Apple "
array[1]="Apple ID"


subject[1]="[ Summary Account Report ] Limited access disable #"$(cat /dev/urandom | tr -dc 'a-z-0-9' | fold -w 10 | head -n 1)""
subject[2]="[ Summary Account Report ] [ Security Check Notice ] Limited access disable #"$(cat /dev/urandom | tr -dc 'a-z-0-9-A-Z' | fold -w 10 | head -n 1)""


OS[0]="Linux"
OS[1]="Windows"
OS[2]="Android"

BROWSER[0]="Chrome"
BROWSER[1]="Mozilla"
BROWSER[2]="Opera"

Color[0]='\e[0;36m'
Color[1]='\e[0;34m'
Color[2]='\033[92m'
Color[3]='\e[1;31m'
Color[4]='\e[1;33m'

IP[0]="141.211.154.220"
IP[1]="31.45.98.190"
IP[2]="245.45.29.129"
IP[3]="168.114.174.90"
IP[4]="41.157.107.51"
IP[5]="146.186.248.153"
IP[6]="227.43.127.246"
IP[7]="158.233.26.107"

clear

numb=($(cat /dev/urandom | tr -dc 'a-z-0-9' | fold -w 7 | head -n 1))
sze=${#Color[@]}
idx=$(($RANDOM % $sze))

systemctl restart postfix

echo -e $cyan' Author : Ray Ricardo'
echo -e $cyan'  __________         _____           '
echo -e $cyan'  \______   \       /     \          '
echo -e $cyan'   |    |  _/      /  \ /  \         '
echo -e $cyan'   |    |   \     /    Y    \        '
echo -e $cyan'   |______  /ash  \____|__  /ailer   '
echo -e $cyan'          \/              \/         '
echo -e $white'====================================='
echo -e ${Color[idx]}'         [ Lulzsec ] [ Spammer ID ]            '
echo -e ${Color[idx]}' [ PunkRockCitayem ] [ indoXploit ]                '
echo -e $white'====================================='

echo -e $cyan $baner

letter="letter/aol.html" 

echo -e $green'Start Send!!!!!' $white;
myArray=($(cat mailinglist))
total=${#myArray[*]}
touch tempfile

for (( i=0; i<=$(( $total -1 )); i++ ))
do
        #Name
        size=${#array[@]}
        index=$(($RANDOM % $size))
        
        #Subject
        sizee=${#subject[@]}
        indeex=$(($RANDOM % $sizee))

        #OS
        soom=${#OS[@]}
        indxB=$(($RANDOM % $soom))

        #IP
        sooom=${#IP[@]}
        indxC=$(($RANDOM % $sooom))

        #Browser
        som=${#BROWSER[@]}
        indxD=$(($RANDOM % $som))

        sleep 3s
	    echo ${myArray[i]} > tempfile
	    EMAILTRUE=`grep '@' tempfile`
	    if [[ "$EMAILTRUE" > "" ]]; then
	       echo -e "Sending: $white ${myArray[i]}" $white;
           SENDMAIL_BIN='sendmail'

        #Replace Tag ##email## ##OS## With List In Mailinglist
           sed -Ei 's/##email##/'${myArray[i]}'/g' $letter
           sed -Ei 's/##OS##/'${OS[indxB]}'/g' $letter
           sed -Ei 's/##BROWSER##/'${BROWSER[indxD]}'/g' $letter

        ADDRESS="$(cat /dev/urandom | tr -dc 'a-z-0-9' | fold -w 20 | head -n 1)""hilih@domain.com"

         
        #Send Using Random Name : ${array[$index]}
        #Send Using Single Name : "Apple"
        name="TEST"

        #Send Using Random Subject
        #Example SUBJECT=${subject[$indeex]}

        #Send Using Single Subject
        #Example SUBJECT="Security Notice !!"
        SUBJECT="Limited access disable #"$(cat /dev/urandom | tr -dc 'a-z-0-9' | fold -w 10 | head -n 1)""

        MAIL_CMD=("$SENDMAIL_BIN" "${myArray[i]}")
        (echo "From:"$name "<$ADDRESS>";echo "Subject:"$SUBJECT"";echo "To:"$EMAILTRUE"";echo -e "MIME-Version: 1.0\nContent-Transfer-Encoding: 8bit\nContent-Type: text/html \n" && cat $letter) | "${MAIL_CMD[@]}"
        #echo -e $red "FROM:"$name"<"$ADDRESS">" 
        #echo -e $yellow "SUBJECT:"$SUBJECT""
        echo -e $lightgreen "SENT!" 
        echo -e $white
        sed -Ei 's/'${myArray[i]}'/##email##/g' $letter
        sed -Ei 's/'${OS[indxB]}'/##OS##/g' $letter
        sed -Ei 's/'${BROWSER[indxD]}'/##BROWSER##/g' $letter
        sleep 3s
    fi
done
echo -n '';

