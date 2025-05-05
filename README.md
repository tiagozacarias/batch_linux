# Tools for Automation and Programmability in Network Operations


* These tools aim to automate the execution of commands in a parallel and massive way in network operations, based on the python3.

* The idea of developing these tools is in the style of Ansible and HPIMC operations.



# TODO

* In the process of developing three more modules in python as follows:

			 
			 - mod_backup.py  ==> Module for backup
			 - mod_inventory.py ==> Module for Inventory
			 - mod_programmability.py ==> Module for Programmability
		


# Getting Started


* The batch_linux.py tool can be used to perform interactive inserts on groups of hosts defined in module mod_hosts.py.


		      $ python3 batch_linux.py --exec_automation lot.file.tcl cisco|huawei

    		      $	python3 batch_linux.py --exec_backup cisco|huawei

    		      $	python3 batch_linux.py --exec_send_cmd cisco|huawei "command"



To check the options for each equipment use the tool help with -h, --help

In the tcl file we must declare the commands that will be executed on the hosts, following the example model cisco_bkp.tcl as it is in the repository.


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


		
			  - export USERNAME_NETMIKO = "username"
			  - export PASSWORD_NETMIKO = "password"



* All operations will initially be performed preferably via telnet, if you are not able to use TELNET, you will try SSH.


* This behavior of attempting to perform operations primarily by Telnet aims to guarantee compatibility with legacy devices, but it can be customized in expect to always give preference to SSH.




		
			 
# Requeriments base

			 - Requer --> Python <4.0, >=3.9
			 
			 

# Python3 packages requeriments

			- netmiko==4.4.0
			- paramiko==3.4.0


 
# Comment

* Before executing these tools make sure that the desired impact on the network infrastructure has been mapped, perform with caution.
