#!/bin/bash

cyan='\e[0;36m' 
green='\e[0;34m' 
okegreen='\033[92m' 
lightgreen='\e[1;32m' 
white='\e[1;37m' 
red='\e[1;31m' 
yellow='\e[1;33m' 
BlueF='\e[1;34m'

array[0]="Apple"
array[1]="Apple ID"
array[2]="iCloud"
array[3]="Apple Security"
array[4]="Service@AppleID"
array[5]="Services@Apple"
array[6]="apple@idapple.com"

subject[0]="Limited access disable #"$(cat /dev/urandom | tr -dc 'a-z-0-9' | fold -w 10 | head -n 1)""
subject[1]="Apple ID Login Activation #"$(cat /dev/urandom | tr -dc 'a-z-0-9' | fold -w 10 | head -n 1)""
subject[2]="Notice : Security Alert From Your Apple ID #"$(cat /dev/urandom | tr -dc 'a-z-0-9' | fold -w 10 | head -n 1)""
subject[3]="Reminder : Apple ID Token "$(cat /dev/urandom | tr -dc 'a-z-0-9' | fold -w 10 | head -n 1)""
subject[4]="Apple ID Notification #"$(cat /dev/urandom | tr -dc 'a-z-0-9' | fold -w 10 | head -n 1)""
subject[5]="Apple ID Security Notice #"$(cat /dev/urandom | tr -dc 'a-z-0-9' | fold -w 10 | head -n 1)""
subject[6]="Apple ID Locked #"$(cat /dev/urandom | tr -dc 'a-z-0-9' | fold -w 10 | head -n 1)""
subject[7]="Your Apple ID Has Be Disabled Notice #"$(cat /dev/urandom | tr -dc 'a-z-0-9' | fold -w 10 | head -n 1)""
subject[8]="Apple ID Disable Temporary Account #"$(cat /dev/urandom | tr -dc 'a-z-0-9' | fold -w 10 | head -n 1)""



 
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


letter="letter/letter.html" 
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
        sleep 3s
	echo ${myArray[i]} > tempfile
	EMAILTRUE=`grep '@' tempfile`
	if [[ "$EMAILTRUE" > "" ]]; then
	echo -e "Sending: $white ${myArray[i]}" $white;
        SENDMAIL_BIN='sendmail'
        SENDER='etc/mailname'
        ADDRESS=$(cat /dev/urandom | tr -dc 'a-z-0-9' | fold -w 10 | head -n 1)"serv@"$(cat /dev/urandom | tr -dc 'a-z-0-9' | fold -w 30 | head -n 1)".bestapps.com"

        #Sender Name Random Use : ${array[$index]}
        name="Apple ID"

        #Random Subject Use : ${subject[$indeex]}
        SUBJECT="Apple ID Security Notice #"$(cat /dev/urandom | tr -dc 'a-z-0-9' | fold -w 10 | head -n 1)""

        MAIL_CMD=("$SENDMAIL_BIN" "${myArray[i]}")
        (echo "From:"$name "<$ADDRESS>";echo "Subject:"$SUBJECT"";echo "To:"$EMAILTRUE"";echo -e "MIME-Version: 1.0\nContent-Transfer-Encoding: 8bit\nContent-Type: text/html \n" && cat $letter) | "${MAIL_CMD[@]}"
        echo -e $red "FROM:"$name"<"$ADDRESS">" 
        echo -e $yellow "SUBJECT:"$SUBJECT"" 
        echo -e $lightgreen "SENT!" 
        echo -e $white
    fi
done
echo -n '';
