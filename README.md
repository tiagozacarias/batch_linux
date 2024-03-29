# Tools for Automation and Programmability in Network Operations


* These tools aim to automate the execution of commands in a parallel/sequential and massive way in network operations, based on the python3, shell script and expect (Tcl).

* The idea of developing these tools is in the style of Ansible and HPIMC operations.



# TODO

* In the process of developing three more modules in python as follows:

			 
			 - mod_backup.py  ==> Module for backup
			 - mod_inventory.py ==> Module for Inventory
			 - mod_programmability.py ==> Module for Programmability
		


# Getting Started


* The batch_key.py tool can be used to perform interactive inserts on groups of hosts defined in module mod_hosts.py


		- $ python3 batch_key.py --exec_hosts_all file_lote.tcl


To check the options for each equipment use the tool help with -h, --help

In the expect file we must declare the commands that will be executed on the hosts, following the example model cisco_bkp.tcl as it is in the repository.


* You must include the host groups in the mod_hosts.py file, following the examples below:

			EXAMPLE = [
				"10.20.20.87",
				"10.2.20.50",
				"10.2.20.51",
				"10.217.20.34",
				"10.217.0.20"
				]

The structure of the hosts file is defined in a way that allows the tool to limit the search by creating groups of hosts.


* Each expect file contains the user and password environment variables that must be included in the ~/.bashrc of the user who will run the tools, it is in these variables that the expect script will use to authenticate into the host groups to perform the operations.


		
			  - export USERNAME_EXP = "username"
			  - export PASSWORD_EXP = "password"



* All operations will initially be performed preferably via telnet, if you are not able to use TELNET, you will try SSH.


* This behavior of attempting to perform operations primarily by Telnet aims to guarantee compatibility with legacy devices, but it can be customized in expect to always give preference to SSH.




		
			 
# Requeriments base
			 - For the execution of the tools, we have python3.6 as a requeriments and installation is necessary in most cases. 
			 - Minimal python3.6
			 
			 

# Python3 packages requeriments

			- pexpect==4.8.0
			- psutil==5.8.0


 
# Comment

* Before executing these tools make sure that the desired impact on the network infrastructure has been mapped, perform with caution.
