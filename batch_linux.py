#!/usr/bin/env python3
# coding=UTF-8
# Author: Tiago Eduardo Zacarias
# Version: 1.4.0
# Date: 29-04-2025
# License: GPLv3

# EXTERNAL LIBS
import datetime
import sys
from pathlib import Path

# CUSTOM LIBS
from mod_hosts import mod_hosts as hosts
from mod_netmiko import mod_netmiko as mod_netmiko

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


def menu_help():

    print(f"""
Usage: python3 {(sys.argv[0])} [OPTION]

[Valid Options]:


    -V, --version  -->  Show tool version

    -h, --help     -->  Display help menu

    --exec_automation  -->   Performs commands on lot.

    --exec_backup  -->  Performs backup on lot.

    --exec_send_cmd  --> Send command to device.



[Examples]:
        
    python3 batch_linux.py --exec_automation lot.file.tcl cisco|huawei

    python3 batch_linux.py --exec_backup cisco|huawei

    python3 batch_linux.py --exec_send_cmd cisco|huawei "command"
    


[Device Type]

    cisco_ios_telnet --> Cisco Telnet
    
    cisco_ios_ssh --> Cisco SSH
    
    huawei --> Huawei


  """)


class ProcessNetmiko():

    def __init__(self) -> None:
        pass

    def loop_netmiko(hosts_model, cmd, send_cmd, device_type_telnet, device_type_ssh):

        # Test Connection
        for ip in hosts_model:

            mod_netmiko.ProcessConnection.test_connection(
                ip, device_type_telnet, device_type_ssh)

        print(
            f"Validating Connection: \033[0;33m[ Finished ]\033[0m")

        # Fetch config
        mod_netmiko.ProcessFetch.multithread(cmd, send_cmd)

        print(
            f"Process configuration to devices: \033[0;33m[ Finished ]\033[0m")


def switch():

    if sys.argv[1] == "-h":

        menu_help()

    elif sys.argv[1] == "--help":

        menu_help()

    elif sys.argv[1] == "-V":

        version()

    elif sys.argv[1] == "--version":

        version()

    # Automation with file on Device
    elif sys.argv[1] == "--exec_automation":

        cmd = sys.argv[3]

        # Check file for automation
        if Path(f"{cmd}").exists():

            if sys.argv[2] == "cisco":

                hosts_model = hosts.CISCO
                send_cmd = None
                device_telnet = "cisco_ios_telnet"
                device_ssh = "cisco_ios_ssh"

            elif sys.argv[2] == "huawei":

                hosts_model = hosts.HUAWEI
                send_cmd = None
                device_telnet = "huawei"
                device_ssh = "huawei"

            try:

                ProcessNetmiko.loop_netmiko(
                    hosts_model, cmd, send_cmd, device_telnet, device_ssh)

            except UnboundLocalError:
                print(
                    f"\033[0;31m[Invalid argument | {day}-{month}-{year} ]\033[0m")

        else:

            print(
                f"\033[0;31m[ File {cmd} not found | {day}-{month}-{year} ]\033[0m")

    # Device Backup
    elif sys.argv[1] == "--exec_backup":

        if sys.argv[2] == "cisco":

            hosts_model = hosts.CISCO
            cmd = "show run"
            send_cmd = None
            device_telnet = "cisco_ios_telnet"
            device_ssh = "cisco_ios_ssh"

        elif sys.argv[2] == "huawei":

            hosts_model = hosts.HUAWEI
            cmd = "display cur"
            send_cmd = None
            device_telnet = "huawei"
            device_ssh = "huawei"

        try:

            ProcessNetmiko.loop_netmiko(
                hosts_model, cmd, send_cmd, device_telnet, device_ssh)

        except UnboundLocalError:

            print(
                f"\033[0;31m[Invalid argument | {day}-{month}-{year} ]\033[0m")

    # Send CMD to Device from prompt
    elif sys.argv[1] == "--exec_send_cmd":

        if sys.argv[2] == "cisco":

            hosts_model = hosts.CISCO
            send_cmd = sys.argv[3]
            cmd = None
            device_telnet = "cisco_ios_telnet"
            device_ssh = "cisco_ios_ssh"

        elif sys.argv[2] == "huawei":

            hosts_model = hosts.HUAWEI
            send_cmd = sys.argv[3]
            cmd = None
            device_telnet = "huawei"
            device_ssh = "huawei"

        try:

            ProcessNetmiko.loop_netmiko(
                hosts_model, cmd, send_cmd, device_telnet, device_ssh)

        except UnboundLocalError:

            print(
                f"\033[0;31m[Invalid argument | {day}-{month}-{year} ]\033[0m")

    else:

        print(
            f"\033[0;31m[ You must pass a valid argument | {day}-{month}-{year} ]\033[0m")


# Exec Switch
if __name__ == "__main__":

    try:

        if len(sys.argv) == 1:
            menu_help()

        elif len(sys.argv) > 5:
            print(
                f"\033[0;31m[ Invalid number of arguments | {day}-{month}-{year} ]\033[0m")

        else:
            switch()

    except IndexError:

        print(
            f"\033[0;31m[ Point the expect file or argument | {day}-{month}-{year} ]\033[0m")

    except KeyboardInterrupt:

        print(
            f"\033[0;31m[ Interruped  | {day}-{month}-{year} ]\033[0m")
