#!/usr/bin/python3.7


import socket, signal


	
print("IP grabber for websites (programmed by Ryuzaki)")
print("Which website do you wan't to attack?")
getIP = input()
IP = (socket.gethostbyname(getIP))
print("The IP address of your target = " + IP + " ,copy the IP to proceed!!")

