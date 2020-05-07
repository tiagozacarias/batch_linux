#!/usr/bin/env  expect
# Autor: Tiago Eduardo Zacarias
# Versão 1.2.1

# Variaveis
set username "[exec echo $::env(USERNAME_EXP)]"
set password "[exec echo $::env(PASSWORD_EXP)]"
set hostname "HOST"
set timeout 1000

spawn telnet $hostname

            expect {
                    -re "Connection refused" { spawn ssh -o StrictHostKeyChecking=no $hostname -l $username }
                    "username"       { send "$username\r"; }
                    }
        
            expect "password"       { send "$password\r" ; }    
        
            #expect "$hostname"
                     
		        send    "terminal length 0\r"
                        send    "show ver\r"
                        send    "dir\r"
			send 	"show run | include hostname\r"
                        send    "exit\r"

            expect "%"
exit
