#!/usr/bin/env python3
# coding=UTF-8
# Author: Tiago Eduardo Zacarias
# Version: 1.1.1
# Date: 18-03-2025
# License: GPLv3

import threading
from netmiko import ConnectHandler
import socket
import sys
from hosts import mod_hosts as hosts
from netmiko.exceptions import NetMikoTimeoutException
from netmiko.exceptions import AuthenticationException
from netmiko.exceptions import SSHException


# Vars
device_list = []
threads = []

commands = [
    "exit",
    "show ip int b"
    # "ip access-list standard 60",
    # "no permit 192.168.22.101",
    # "no permit 10.32.152.5",
    # "510 permit 192.168.22.101",
    # "520 permit 10.32.152.5",
    # "exit",
    # "exit",
    # "write memory"
]


class process_connection:

    def __init__(self) -> None:
        pass

    def test_connection():

        try:
            device_list.clear()

            for ip in hosts.EXEC:

                s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                s.settimeout(6)
                # print(s.gettimeout())
                print(
                    f"\033[0;33m[ Validating Connection in: {ip}  - Initialized ]\033[0m")

                # Result Telnet
                result_telnet = s.connect_ex((ip, 23))
                s.close()

                if result_telnet == 0:

                    device_list.append({"device_type": "cisco_ios_telnet", "ip": ip,
                                        "username": "batch_linux", "password": "CitKr&tX8tM@m&@", "timeout": 50})
                else:
                    # Result SSH
                    result_ssh = s.connect_ex((ip, 22))
                    s.close()
                    if result_ssh == 9:

                        device_list.append({"device_type": "cisco_ios_ssh", "ip": ip,
                                            "username": "batch_linux", "password": "CitKr&tX8tM@m&@", "timeout": 50})
        except:

            pass


class process_fetch:

    def __init__(self) -> None:
        pass

    def connect_and_fetch(router):
        try:

            connection = ConnectHandler(**router)

            # Method for automation
            # output = connection.send_config_from_file(
            #    "commands_ios.txt", read_timeout=6000)

            # Method for automation Send Mutiples Commands on list
            # output = connection.send_config_set(commands, read_timeout=6000)

            # Method for Backup
            output = connection.send_command("show run", read_timeout=6000)

            # Open File
            with open(f"tmp/{router['ip']}.txt", "w") as f:

                print(
                    f"Configuration output for {router['ip']}:\n{output}", file=f)
                f.close()

            connection.disconnect()
            sys.stdout.close

        except AuthenticationException:
            sys.stdout = open(
                f"tmp/{router['ip']}.error", "w", encoding="utf-8")
            print(
                f"Authentication failed, please verify your credentials on: {router['ip']}")
            sys.stdout.close

        except SSHException:

            sys.stdout = open(
                f"tmp/{router['ip']}.error", "w", encoding="utf-8")
            print(
                f"Unable to establish SSH or Telnet connection on: {router['ip']}")
            sys.stdout.close

        except ConnectionRefusedError:
            sys.stdout = open(
                f"tmp/{router['ip']}.error", "w", encoding="utf-8")
            print(
                f"Connection refused on: {router['ip']}")
            sys.stdout.close

        except NetMikoTimeoutException:
            sys.stdout = open(
                f"tmp/{router['ip']}.error", "w", encoding="utf-8")
            print("Timeout")
            sys.stdout.close

        except ValueError:

            sys.stdout = open(
                f"tmp/{router['ip']}.error", "w", encoding="utf-8")
            print("Value Error: ")
            sys.stdout.close

    def multithread():

        for router in device_list:
            th = threading.Thread(
                target=process_fetch.connect_and_fetch, args=(router,))
            th.start()
            threads.append(th)

        for th in threads:
            th.join()


if __name__ == "__main__":
    process_connection.test_connection()
    process_fetch.multithread()
    # print(device_list)
