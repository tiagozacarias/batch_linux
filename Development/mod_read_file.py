#!/usr/bin/env python
# coding=UTF-8
# Author : Tiago Eduardo Zacarias
# Version: 1.0.0
# Date: 03-05-2020
# License: GPLv3
import sys
import time

def func_iterate_read_hosts(file_in):

    with open((file_in), "r") as file_i:
        data = file_i.readlines()
            
        for lines in data:
            lines = lines.strip()
            print(lines) 
            #time.sleep(True)   


def func_iterate_redirect_file(file_in,file_out):

    with open((file_in), "r") as file_in:
        data = file_in.readlines()

        for i in data:
            line_strip = i.strip()
            
            with open(file_out, "a") as file_ou:
                sys.stdout = file_ou
                print("{}".format(line_strip))
