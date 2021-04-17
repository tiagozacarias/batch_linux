#!/usr/bin/expect
# Autor: Tiago Eduardo Zacarias
# Versão 2.0.0

# Variaveis
set username "[exec echo $::env(USERNAME_EXP)]"
set password "[exec echo $::env(PASSWORD_EXP)]"
set hostname "HOST"
set timeout 100
set ::env(TERM) vt100

spawn ping -c 4 $hostname

 	    expect {
		    -re "icmp_seq=2|icmp_seq=4" {spawn telnet $hostname}
	
		    }

            expect {

                    -re "Connection refused" { spawn ssh -o StrictHostKeyChecking=no $hostname -l $username }
                    -re "Username|username|Login|login|User|user"       { send "$username\r"; }

                    }


            expect { 
		    -re "Password|password|Senha|senha"   { send "$password\r" ; }
		    -re "timeout"   	    { puts "timed out during login"; exit 1 }
                    -re "failed|invalid"    { puts "login failed";  exit 1 }

		}

            expect -re "#"
			
			set timeout 1000
			send  --  "terminal length 0\r"
                        send  --  "show startup-config\r"
                        send  --  "exit\r"
	    expect "%"

exit
