#!/usr/bin/env python
# coding=UTF-8
# Author : Tiago Eduardo Zacarias
# Version: 1.0.0
# Date: 03-05-2020
# License: GPLv3
import mod_read_file as iterate_file
import mod_vars_keys as keys
import datetime
import re
import sys
version = "1.0.0"

# TODO
# Pending to finish programming the host reading module.

# Date
now = datetime.datetime.now()
day = now.strftime("%d")
month = now.strftime("%m")
year = now.strftime("%Y")

# Functions

def func_exec_all(key, model):

    if key == bool(True):

        iterate_file.func_iterate_read_hosts(file_in="/etc/hosts")

    else:

        print("\033[0;32m[This function is disabled | {}-{}-{}]\033[0m"
              .format(day, month, year))


def menu_help():

    print("""

Usage: {} [OPTION]

Valid Options:


	-V, --version     Show tool version

	-h, --help        Display help menu

	--exec_casr-1002  lot_file.tcl     Performs commands on all equipment in the cisco asr-1002

	--exec_casr-1006  lot_file.tcl     Performs commands on all equipment in the cisco asr-1006

	--exec_casr-903   lot_file.tcl     Performs commands on all equipment in the cisco asr-903

	--exec_ccgr-2010  lot_file.tcl     Performs commands on all equipment in the cisco cgr-2010

	--exec_ccgs-2520  lot_file.tcl     Performs commands on all equipment in the cisco cgs-2520

	--exec_cgrwic     lot_file.tcl     Performs commands on all equipment in the cisco grwic

	--exec_all_cisco  lot_file.tcl     Performs commands on all equipments cisco

            [*** Consult the options_exec.txt file to check the supported equipment***]

""").format(sys.argv[0])

def func_switch():

    if sys.argv[1] == "-h":
        menu_help()

    elif sys.argv[1] == "--help":
        menu_help()

    elif sys.argv[1] == "-V":
        print("Version: {}").format(version)

    elif sys.argv[1] == "--version":
        print("Version: {}").format(version)

    elif sys.argv[1] == "--exec_c2960":
        key = keys.chave_cisco_2960
        model = "C2960"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_c1120":
        key = keys.chave_cisco_1120
        model = "C1120"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_c1760":
        key = keys.chave_cisco_1760
        model = "C1760"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_c1941":
        key = keys.chave_cisco_1941
        model = "C1941"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_c2501":
        key = keys.chave_cisco_2501
        model = "C2501"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_c2621":
        key = keys.chave_cisco_2621
        model = "C2621"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_c2801":
        key = keys.chave_cisco_2801
        model = "C2801"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_c2811VE":
        key = keys.chave_cisco_2811ve
        model = "C2801VE"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_c2821":
        key = keys.chave_cisco_2821
        model = "C2821"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_c2921":
        key = keys.chave_cisco_2921
        model = "C2921"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_c2924":
        key = keys.chave_cisco_2924
        model = "C2924"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_c2950":
        key = keys.chave_cisco_2950
        model = "C2950"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_c3560":
        key = keys.chave_cisco_3560
        model = "C3560"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_c3662":
        key = keys.chave_cisco_3662
        model = "C3662"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_c3750":
        key = keys.chave_cisco_3750
        model = "C3750"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_c3850":
        key = keys.chave_cisco_3850
        model = "C3850"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_c3945":
        key = keys.chave_cisco_3945
        model = "C3950"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_c4321":
        key = keys.chave_cisco_4321
        model = "C4321"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_c4331":
        key = keys.chave_cisco_4331
        model = "C4331"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_c4503":
        key = keys.chave_cisco_4503
        model = "C4503"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_c4506":
        key = keys.chave_cisco_4506
        model = "C4506"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_c4507":
        key = keys.chave_cisco_4507
        model = "C4507"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_c6509":
        key = keys.chave_cisco_6509
        model = "C6509"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_c6513":
        key = keys.chave_cisco_6513
        model = "C6513"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_casr-1002":
        key = keys.chave_cisco_asr_1002
        model = "CASR1002"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_casr-1006":
        key = keys.chave_cisco_asr_1006
        model = "CASR1006"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_casr-903":
        key = keys.chave_cisco_asr_903
        model = "CASR903"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_ccgr-2010":
        key = keys.chave_cisco_cgr_2010
        model = "CCGR2010"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_ccgs-2520":
        key = keys.chave_cisco_cgs_2520
        model = "CCGS2520"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_cgrwic":
        key = keys.chave_cisco_grwic
        model = "CGRWIC"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_cie-3000":
        key = keys.chave_cisco_ie_3000
        model = "CIE3000"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_cmc4810":
        key = keys.chave_cisco_mc3810
        model = "CMC3810"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_cnexus":
        key = keys.chave_cisco_nexus
        model = "CNEXUS"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_dm1200e":
        key = keys.chave_datacom_dm_1200e
        model = "DM1200E"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_dgs-1510":
        key = keys.chave_dlink_dgs_1510
        model = "DGS1510"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_csf300":
        key = keys.chave_cisco_sf300
        model = "CSF300"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_teste":
        key = keys.chave_teste
        model = "TESTE"
        func_exec_all(key, model)

    elif sys.argv[1] == "--exec_all":
        key = keys.chave_all_cisco
        model = "ALL_CISCO"
        func_exec_all(key, model)
    else:
        print("\033[0;31m[You must pass a valid argument | {}-{}-{}]\033[0m"
              .format(day, month, year))

# Exec Switch
if __name__ == "__main__":

    if len(sys.argv) == 1:
        menu_help()

    elif len(sys.argv) > 3:
        print(
            "\033[0;31m[Invalid number of arguments | {}-{}-{} ]\033[0m".format(day, month, year))

    else:
        func_switch()
