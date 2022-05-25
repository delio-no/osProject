#!/bin/bash
read -p 'Enter your login: ' myLogin
myEmail=${myLogin}@mail
curDate=`date`
cd $HOME/usr
v2=`find $myEmail 2>/dev/null`


if [ "$myEmail" = "$v2" ]; then

	echo "1. Send mail"
	echo "2. Read mail"
	echo "3. Exit"
	read variable
	case "$variable" in
		1) sendEmail ;;
		2) cat $HOME/usr/$myEmail ;;
		3) break ;;
		*) echo "нет такой команды" ;;
	esac

else 
	echo "This user already exists"	

fi		

sendEmail() {
	read send_Login
	send_Email=${send_Login}@mail
	v3=`find $send_Email 2>/dev/null`
	if [ "$send_Email" = "$v3" ]; then
		echo "Your message: "
		read myMsg
		echo $curDate >> $send_Email
		echo "Mailer:" $myEmail >> $send_Email
		echo "Addressee:" $send_Email >> $send_Email
		echo "\n${myMsg} \n \n" >> $send_Email
	else 
		echo "This user already exists"	
	fi	
}