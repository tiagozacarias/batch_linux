# Tools for Automation in Network Operations


* These tools aim to automate the execution of commands in a sequential and massive way in network operations, based on the shell script and expect (Tcl).

* The idea of developing these tools is in the style of Ansible and HPIMC operations.


# Getting Started


* The batch_key.sh tool can be used to perform interactive inserts on groups of hosts defined in /etc/hosts.


			$ ./batch_key.sh exec_hosts_all


You will be asked for the name of the expect batch file that should be present in the scripts directory.




* The batch_key_bkp.sh tool can be used to back up settings for groups of hosts defined in /etc/hosts.


			$ ./batch_key_bkp.sh backup_cisco
	      	 
	

The default backup directory and ~/backups



* You must include the host groups in the /etc/hosts file, following the examples below:


			# BEGIN_ALL_CISCO
			# BEGIN_C2950
			10.15.124.134 BHZ-SW-01
			10.15.124.136 BHZ-SW-02
			# END_C2950

			# BEGIN_C2960
			10.15.124.137 BHZ-SW-03
			10.15.124.138 BHZ-SW-04
			# END_C2960
			# END_ALL_CISCO

The structure of the hosts file is defined in a way that allows the tool to limit the search by creating groups of hosts.


* Each expect file contains the user and password environment variables that must be included in the ~/.bashrc of the user who will run the tools, it is in these variables that the expect script will use to authenticate into the host groups to perform the operations.


		
			export USERNAME_EXP = "username"
			export PASSWORD_EXP = "password"



* All operations will initially be performed preferably via telnet, if you are not able to use TELNET, you will try SSH.


* This behavior of attempting to perform operations primarily by Telnet aims to guarantee compatibility with legacy devices, but it can be customized in expect to always give preference to SSH.



# Dependency

* For the execution of the tools, we have expect as a dependency and installation is necessary in most cases.


		Installation via Snap:


			# snap install expect
	
		Installation on RedHat and derivative systems:

		
			# dnf install expect
			# yum install expect
		
		Installation on Debian and derivative systems:

		
			# apt install expect
		
		Installation on FreeBSD systems:

		
			# pkg install expect

 
# Comments


* Before executing these tools make sure that the desired impact on the network infrastructure has been mapped, perform with caution.
