#!/usr/bin/env python3
# coding=UTF-8
# Author: Tiago Eduardo Zacarias
# Version: 1.4.0
# Date: 08-04-2025
# License: GPLv3

# Imports
from mod_hosts import mod_hosts as hosts
from mod_netmiko import mod_netmiko as mod_netmiko
import datetime
import sys
from pathlib import Path


# Python Version
# print(sys.version_info)

# TODO
# Pending to develop backup module, inventory module and programmability module.

# Date

now = datetime.datetime.now()
day = now.strftime("%d")
month = now.strftime("%m")
year = now.strftime("%Y")

# Functions


def version():

    print("\033[0;36m[ Batch_Linux 1.4.0 - Language: Python3 ]\033[0m")


class process_netmiko():

    def __init__(self) -> None:
        pass

    def loop_netmiko(hosts_model, cmd):

        # Test Connection
        for ip in hosts_model:

            mod_netmiko.process_connection.test_connection(ip)

        print(
            f"Validating Connection: \033[0;33m[ Finished ]\033[0m")

        print(
            f"Sending configuration to devices: \033[0;36m[ Initialized ]\033[0m ")

        # Fetch config
        mod_netmiko.process_fetch.multithread(cmd)

        print(
            f"Process configuration to devices: \033[0;33m[ Finished ]\033[0m")


def menu_help():

    print(f"""
Usage: python3 {(sys.argv[0])} [OPTION]

[Valid Options]:


    -V, --version  -->  Show tool version

    -h, --help     -->  Display help menu

    --exec_automation lot_file.tcl -->   Performs commands on lot.

    --exec_backup  -->  Performs backup on lot.


[Examples]:
        
    python3 batch_linux.py --exec_automation lot.file.tcl

    python3 batch_linux.py --exec_backup

  """)


def switch():

    if sys.argv[1] == "-h":

        menu_help()

    elif sys.argv[1] == "--help":

        menu_help()

    elif sys.argv[1] == "-V":

        version()

    elif sys.argv[1] == "--version":

        version()

    elif sys.argv[1] == "--exec_automation":

        cmd = sys.argv[2]

        # Check file for automation
        if Path(f"{cmd}").exists():

            hosts_model = hosts.automation
            process_netmiko.loop_netmiko(hosts_model, cmd)

        else:
            print(
                f"\033[0;31m[ File {cmd} not found | {day}-{month}-{year} ]\033[0m")

    elif sys.argv[1] == "--exec_backup":

        cmd = "show run"
        hosts_model = hosts.automation
        process_netmiko.loop_netmiko(hosts_model, cmd)

    else:

        print(
            f"\033[0;31m[ You must pass a valid argument | {day}-{month}-{year} ]\033[0m")


# Exec Switch
if __name__ == "__main__":

    try:

        if len(sys.argv) == 1:
            menu_help()

        elif len(sys.argv) > 3:
            print(
                f"\033[0;31m[ Invalid number of arguments | {day}-{month}-{year} ]\033[0m")

        else:
            switch()

    except IndexError:

        print(
            f"\033[0;31m[ Point the expect file | {day}-{month}-{year} ]\033[0m")

    except KeyboardInterrupt:

        print(
            f"\033[0;31m[ Interruped  | {day}-{month}-{year} ]\033[0m")
