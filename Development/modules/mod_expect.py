#!/usr/bin/env python3
# coding:UTF-8
import pexpect
import sys
import os
import subprocess

# TODO

username = os.environ["USERNAME_EXP"]
password = os.environ["PASSWORD_EXP"]


def run_expect(hosts, file_cmd):
    try:

        with open(file_cmd, "r", encoding="utf-8") as file_in:
            cmd = file_in.readlines()

        create_dir_tmp = ["test -d tmp || mkdir tmp"]
        subprocess.run(create_dir_tmp, shell=True)
        sys.stdout = open(f"tmp/strace.txt", "a", encoding="utf-8")

        child = pexpect.spawn(f"ping -c4 {hosts}")
        child.logfile = sys.stdout.buffer
        expect = child.expect(["icmp_seq=2", "icmp_seq=4"])

        if expect == 0 or expect == 1:

            child = pexpect.spawn(f"telnet {hosts}")
            child.logfile = sys.stdout.buffer

        expect = child.expect(
            ["No route to host", "Connection refused", "Username|username|user|User"])

        if expect == 0:

            child.kill(0)

        elif expect == 1:

            child = pexpect.spawn(
                f'ssh -o StrictHostKeyChecking=no {username}@{hosts}')
            child.logfile = sys.stdout.buffer

        elif expect == 2:

            child.sendline(f"{username}\r")
            child.logfile = sys.stdout.buffer

        expect = child.expect(["Password|password"])

        if expect == 0:

            child.sendline(f"{password}\r")
            child.logfile = sys.stdout.buffer

        expect = child.expect(["Permission denied on host|invalid", "#"])

        if expect == 0:

            child.kill(0)
            child.logfile = sys.stdout.buffer

        elif expect == 1:

            child.logfile = sys.stdout.buffer

        for cmd_ite in cmd:
            child.send(f"{cmd_ite}\r")
            child.expect("([a-z]|[A-Z]|[0-9])#$", timeout=1000)

    except:
        pass
