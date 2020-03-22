#!/usr/bin/env  expect
# Autor : Tiago Eduardo Zacarias
# Versão: 1.2.1

# Variáveis
set username "[exec echo $::env(USERNAME_EXP_WLC)]"
set password "[exec echo $::env(PASSWORD_EXP_WLC)]"
set hostname "HOST"


spawn ssh -o StrictHostKeyChecking=no $hostname

	  expect "User"
			
			send  "$username\r"
	 
	  expect "Password"

                        send   "$password\r"

          expect "Controller"


        		send    "config paging disable\r"
        		send    "show run-config commands\r"
			send 	"logout\r"
			send 	"no\r"

	   expect "%"
exit
 
	    
