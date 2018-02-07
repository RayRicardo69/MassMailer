#!/bin/bash

cyan='\e[0;36m' 
green='\e[0;34m' 
okegreen='\033[92m' 
lightgreen='\e[1;32m' 
white='\e[1;37m' 
red='\e[1;31m' 
yellow='\e[1;33m' 
BlueF='\e[1;34m'

 
numb=($(cat /dev/urandom | tr -dc 'a-z-0-9' | fold -w 7 | head -n 1))
echo -e $cyan"======================================================"
echo -e $cyan"======================================================"
echo -e $red"      ##############    __________                   "
echo -e $red"      ####       ###  _/          |                   "        
echo -e $red"      ## ##     #### /_ New Email |                   " 
echo -e $red"      ##  ##   ## ##// \__________|                   "
echo -e $red"      ##   ####   ##/                                "
echo -e $red"      ##    ##    ##                                 "
echo -e $red"      ##          ##                                  "
echo -e $red"      ##############                                  "                                  
echo -e $cyan"======================================================"
echo -e $BlueF"                                         Ray Ricardo"
echo -e $cyan"======================================================"

letter="letter/aja.html" 
name="Apple"


echo -e $green'Start Send!!!!!' $white;
myArray=($(cat mailinglist))
total=${#myArray[*]}
touch tempfile
for (( i=0; i<=$(( $total -1 )); i++ ))
do
	echo ${myArray[i]} > tempfile
	EMAILTRUE=`grep '@' tempfile`
	if [[ "$EMAILTRUE" > "" ]]; then
	echo -e "Sending: $white ${myArray[i]}" $white;
        SENDMAIL_BIN='sendmail'
        SENDER='etc/mailname'
        ADDRESS=$(cat /dev/urandom | tr -dc 'a-z-0-9' | fold -w 10 | head -n 1)"serv@"$(cat /dev/urandom | tr -dc 'a-z-0-9' | fold -w 30 | head -n 1)".msn.com"
        #FROM_MAIL_DISLAY='PayPal
        #REPLY="noreply@mail.webapps$numb.hostverIfiIed.$string1.hosted.live.mail.com"
        SUBJECT="[ Sign-in Notification ] : Unauthorize Sign-in Check #"$(cat /dev/urandom | tr -dc 'a-z-0-9' | fold -w 10 | head -n 1)""
        MAIL_CMD=("$SENDMAIL_BIN" "${myArray[i]}")
        (echo "From:"$name "<$ADDRESS>";echo "Subject:"$SUBJECT"";echo "To:"$EMAILTRUE"";echo -e "MIME-Version: 1.0\nContent-Transfer-Encoding: 8bit\nContent-Type: text/html \n" && cat $letter) | perl -MHTML::Entities -pe 'decode_entities($_);' | "${MAIL_CMD[@]}" 
        sleep 3s
        echo -e $red "FROM:"$name "<"$ADDRESS">" $lightgreen "SENT!" 
        echo -e $white
    fi
done
echo -n '';
#| perl -MHTML::Entities -pe 'decode_entities($_);' << decode entities
#|perl -MMIME::Base64 -ne 'printf "%s\n",decode_base64($_)' <<base64 dencode
