#!/usr/bin/env python3
# coding=UTF-8
import sys
import time
import os
import subprocess


def func_iterate_read_hosts(file_out):

    with open((file_out), "w") as file_o:
        data = file_o.readlines()

        for lines in data:
            lines = lines.strip()
            print(lines)
             #time.sleep(1)


def func_iterate_read_hostss(file_in):

    with open((file_in), "r") as file_i:
        data = file_i.readlines()

        for lines in data:
            lines = lines.strip()
            print(lines)
            # time.sleep(1)


def func_iterate_redirect_file(file_in, file_out):

    with open((file_in), "r") as file_in:
        data = file_in.readlines()

        for i in data:
            line_strip = i.strip()

        with open(file_out, "a") as file_ou:
            sys.stdout = file_ou
            print("{}".format(line_strip))
