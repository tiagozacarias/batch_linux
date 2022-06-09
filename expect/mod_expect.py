#!/usr/bin/env python3
# coding=UTF-8
# Author: Tiago Eduardo Zacarias
# Version: 1.1.0
# Date: 26-05-2022
# License: GPLv3

# Imports
import pexpect
import sys
import os
import re
import subprocess

# Lista Username and password
user = []
passwd = []
pass_enable = [] 

# TODO
# Log concatenation_logs function is missing.

class login:

    def __init__(self) -> None:
        pass

    # 0 Desabilitado/1 Habilitado enable password
    def auth(username=1, password=1, enable_password=0):

        if enable_password == 0:

            username = os.environ["USERNAME_EXP"]
            password = os.environ["PASSWORD_EXP"]

            user.append(username)
            passwd.append(password)

        else:

            username = os.environ["USERNAME_EXP"]
            password = os.environ["PASSWORD_EXP"]
            enable_password = os.environ["PASSWORD_ENABLE_EXP"]


            user.append(username)
            passwd.append(password)
            pass_enable.append(enable_password)

class logs:

    def __init__(self) -> None:
        pass

    def concatenation_logs(hosts):

        # try:

        with open(f"tmp/{hosts}.txt", "r", encoding="utf-8") as file_in:
            data = file_in.readlines()

        for lines in data:

            with open(f"tmp/strace.txt", "a", encoding="utf-8") as file_out:

                sys.stdout = file_out
                print(lines.rstrip("\n"))

        os.remove(f"tmp/{hosts}.txt")

        # except FileNotFoundError:
        #       pass


class Pexpect:

    # Get Login
    login.auth()

    def __init__(self) -> None:
        pass

    def run_expect(hosts, file_cmd):

        try:

           # Test if directory tmp exist
            create_dir_tmp = ["test -d tmp || mkdir tmp"]
            subprocess.run(create_dir_tmp, shell=True)
            sys.stdout = open(f"tmp/{hosts}.txt", "w", encoding="utf-8")

            child = pexpect.spawn(f"ping -c3 {hosts}")
            child.logfile = sys.stdout.buffer
            expect = child.expect(["ttl="])

            if expect == 0:

                child = pexpect.spawn(
                    f"telnet {hosts}", echo=True, timeout=1000, maxread=800000)
                child.logfile = sys.stdout.buffer

                expect = child.expect(
                    ["No route to host", "Connection refused", "Name:|Username:|username:|user:|User:|Login:|login:"])

            if expect == 0:

                print("No route to host")
            
            elif expect == 1:


                child.logfile = sys.stdout.buffer
                child = pexpect.spawn(
                    f'ssh -o StrictHostKeyChecking=no {(user[0])}@{hosts}', echo=True, timeout=1000, maxread=800000)
                child.logfile = sys.stdout.buffer

            elif expect == 2:

                child.send(f"{(user[0])}\r")
                child.logfile = sys.stdout.buffer

            expect = child.expect(["Password:|password:"])

            if expect == 0:

                child.send(f"{(passwd[0])}\r")
                child.logfile = sys.stdout.buffer

            expect = child.expect(
                ["Permission denied|invalid|failed", ">", "#| "])

            if expect == 0:

                print("Permission denied")
                child.logfile = sys.stdout.buffer

            # Conditional With enable password
            elif expect == 1:

                child.send("enable\r")

                expect = child.expect(["Password:|password:"])

                if expect == 0:

                    child.send(f"{(pass_enable[0])}\r")

                    child.logfile = sys.stdout.buffer

                with open(file_cmd, "r", encoding="utf-8") as file_in:
                    cmd = file_in.readlines()

                for cmd_iterate in cmd:
                    #cmd_strip = cmd_iterate.strip("M")
                    child.send(f"{cmd_iterate}")

                child.expect("%", timeout=1000)
                # child.expect(pexpect.EOF, timeout=None)
                # child.sendline(f"{cmd_ite}")
                # child.expect("(^[A-Z]|[a-z]).*#", timeout=1000)
                sys.stdout.close()

            # Conditional for no enable password
            elif expect == 2:

                child.logfile = sys.stdout.buffer

                with open(file_cmd, "r", encoding="utf-8") as file_in:
                    cmd = file_in.readlines()

                for cmd_iterate in cmd:
                    #cmd_strip = cmd_iterate.strip("M")
                    child.send(f"{cmd_iterate}")

                child.expect("%", timeout=1000)
                # child.expect(pexpect.EOF, timeout=None)
                # child.sendline(f"{cmd_ite}")
                # child.expect("(^[A-Z]|[a-z]).*#", timeout=1000)
                sys.stdout.close()

        except pexpect.exceptions.EOF:

            pass

        except pexpect.exceptions.TIMEOUT:

            pass

    # concatenation_logs(hosts)
