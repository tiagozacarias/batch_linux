#!/usr/bin/env python3
# coding=UTF-8
# Author: Tiago Eduardo Zacarias
# Version: 1.4.0
# Date: 17-04-2025
# License: GPLv3

import threading
from netmiko import ConnectHandler
import socket
import os
from netmiko.exceptions import NetMikoTimeoutException
from netmiko.exceptions import AuthenticationException
from netmiko.exceptions import SSHException

# Vars
# Get Login
username = os.environ["USERNAME_NETMIKO"]
password = os.environ["PASSWORD_NETMIKO"]
enable_password = os.environ["PASSWORD_ENABLE_NETMIKO"]

# Devices
device_list = []

# Multithreads
threads = []

# Device Type
device_telnet = "cisco_ios_telnet"
device_ssh = "cisco_ios_ssh"


class process_connection:

    def __init__(self) -> None:
        pass

    def test_connection(ip):

        print(
            f"Validating Connection in: {ip}: \033[0;36m[ Initialized ]\033[0m  ")

        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        # Timeout Socket
        s.settimeout(6)

        # Result Telnet
        result_telnet = s.connect_ex((ip, 23))
        s.close()

        if result_telnet == 0:

            device_list.append({"device_type": device_telnet, "ip": ip,
                                "username": username, "password": password,
                                "timeout": 50, "fast_cli": False, "global_delay_factor": 2,
                                "session_log": "log.txt", "session_log_file_mode": "append"})
        else:

            s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            # Timeout Socket
            s.settimeout(6)

            # Result SSH
            result_ssh = s.connect_ex((ip, 22))
            s.close()

            if result_ssh == 0:

                device_list.append({"device_type": device_ssh, "ip": ip,
                                    "username": username, "password": password,
                                    "timeout": 50, "fast_cli": False, "global_delay_factor": 2,
                                    "session_log": "log.txt", "session_log_file_mode": "append"})

            else:

                with open(f"tmp/{ip}.error", "w") as f:

                    print(
                        f"Unable to establish SSH or Telnet connection on: {ip}", file=f)
                    f.close()


class process_fetch:

    def __init__(self) -> None:
        pass

    def connect_and_fetch(cmd, router):
        try:

            connection = ConnectHandler(**router)

            if cmd == "show run":

                # Method for Backup
                output = connection.send_command("show run", read_timeout=6000)

            elif cmd == cmd:

                # Method for automation
                output = connection.send_config_from_file(
                    cmd, read_timeout=6000)


            # Open File
            with open(f"tmp/{router['ip']}.txt", "w") as f:

                print(
                    f"Configuration output for {router['ip']}:\n{output}", file=f)
                f.close()

            connection.disconnect()
     

        except AuthenticationException:

            with open(f"tmp/{router['ip']}.error", "w") as f:

                print(
                    f"Authentication failed, please verify your credentials on: {router['ip']}", file=f)
                f.close()


        except NetMikoTimeoutException:

            with open(f"tmp/{router['ip']}.error", "w") as f:

                print(
                    f"Timeout on: {router['ip']}", file=f)
                f.close()

        except ValueError:

            with open(f"tmp/{router['ip']}.error", "w") as f:

                print(
                    f"Value Erro", file=f)
                f.close()

    def multithread(file_cmd):

        for router in device_list:
            th = threading.Thread(
                target=process_fetch.connect_and_fetch, args=(file_cmd, router,))
            th.start()
            threads.append(th)

        for th in threads:
            th.join()

