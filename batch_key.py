#!/usr/bin/env python3
# coding=UTF-8
# Author: Tiago Eduardo Zacarias
# Version: 1.1.0
# Date: 09-01-2021
# License: GPLv3

# Imports
from var import mod_vars_keys as keys
from hosts import mod_hosts as hosts
from expect import mod_expect as expect
from configs import mod_config as conf
import datetime
import sys
from pathlib import Path
from multiprocessing import Process
import threading
import psutil
import pdb



# Python Version
# print(sys.version_info)

# TODO
# Pending to develop backup module and inventory module.
# Pending to develop module scan network on automation.

# Date

now = datetime.datetime.now()
day = now.strftime("%d")
month = now.strftime("%m")
year = now.strftime("%Y")

# Functions


def version():

  print("Batch_Linux 1.1.0")


def loop_expect(hosts_model, file_cmd):

  expect.run_expect(hosts_model, file_cmd)


def main(key_model, hosts_model, file_cmd):

  # Test if file cmd exist
  if Path(f"{file_cmd}").exists():

      key_model = keys.models[key_model]

      if key_model == bool(True):

          # Class MultiProcessing
          class TaskProxy(threading.Thread):
           
              def __init__(self):
                  super(TaskProxy, self).__init__()

              def run(self):

                  p = Process(target=loop_expect,
                              args=(hosts_model, file_cmd))

                  ps = psutil.Process()
                  ps.cpu_affinity((conf.cpu_affinity()))

                  p.start()
                  pid = p.pid
                  print(
                      f"\033[0;32m[ Process child to {hosts_model} Initialized | Pid: {pid} ]\033[0m")
                  p.join()

          def task_handler(hosts_model, file_cmd):
              t = TaskProxy()
              # t.daemon = True
              t.start()
              return

          for hosts_model in hosts_model:
              task_handler(hosts_model, file_cmd)

        
          #for hosts in hosts_model:
            #expect.concatenation_logs(hosts)

      else:

          print(
              f"\033[0;32m[ This function is disabled | {day}-{month}-{year} ]\033[0m")

  else:

      print(
          f"\033[0;31m[ File {file_cmd} not found | {day}-{month}-{year} ]\033[0m")
      


def menu_help():

  print(f"""
Usage: python3 {(sys.argv[0])} [OPTION]

[Valid Options]:


  -V, --version     Show tool version

  -h, --help        Display help menu
  
  --exec_casr-1002  [backup|inventory|lot_file.tcl]    Performs commands on lot cisco asr-1002
  --exec_casr-1006  [backup|inventory|lot_file.tcl]    Performs commands on lot cisco asr-1006
  --exec_casr-903   [backup|inventory|lot_file.tcl]    Performs commands on lot cisco asr-903
  --exec_ccgr-2010  [backup|inventory|lot_file.tcl]    Performs commands on lot cisco cgr-2010
  --exec_ccgs-2520  [backup|inventory|lot_file.tcl]    Performs commands on lot cisco cgs-2520
  --exec_cgrwic     [backup|inventory|lot_file.tcl]    Performs commands on lot cisco grwic
  --exec_all_cisco  [backup|inventory|lot_file.tcl]    Performs commands on all equipments cisco

        [*** Consult the options_exec.txt file to check the supported equipment***]  
        
[Examples]:
        python3 batch_key.py --exec_c2960 lot.file.tcl 
        python3 batch_key.py --exec_c2801 backup   
        python3 batch_key.py --exec_c2921 inventory
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

  elif sys.argv[1] == "--exec_c2960":
      key_model = "key_cisco_2960"
      hosts_model = hosts.C2960
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_c1120":
      key_model = "key_cisco_1120"
      hosts_model = hosts.C1120
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_c1760":
      key_model = "key_cisco_1760"
      hosts_model = hosts.C1760
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_c1941":
      key_model = "key_cisco_1941"
      hosts_model = hosts.C1941
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_c2501":
      key_model = "key_cisco_2501"
      hosts_model = hosts.C2501
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_c2621":
      key_model = "key_cisco_2621"
      hosts_model = hosts.C2621
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_c2801":
      key_model = "key_cisco_2801"
      hosts_model = hosts.C2801
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_c2811VE":
      key_model = "key_cisco_2811ve"
      hosts_model = hosts.C2811VE
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_c2821":
      key_model = "key_cisco_2821"
      hosts_model = hosts.C2821
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_c2921":
      key_model = "key_cisco_2921"
      hosts_model = hosts.C2921
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_c2924":
      key_model = "key_cisco_2924"
      hosts_model = hosts.C2924
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_c2950":
      key_model = "key_cisco_2950"
      hosts_model = hosts.C2950
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_c3560":
      key_model = "key_cisco_3560"
      hosts_model = hosts.C3560
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_c3662":
      key_model = "key_cisco_3662"
      hosts_model = hosts.C3662
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_c3750":
      key_model = "key_cisco_3750"
      hosts_model = hosts.C3750
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_c3850":
      key_model = "key_cisco_3850"
      hosts_model = hosts.C3850
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_c3945":
      key_model = "key_cisco_3945"
      hosts_model = hosts.C3945
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_c4321":
      key_model = "key_cisco_4321"
      hosts_model = hosts.C4321
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_c4331":
      key_model = "key_cisco_4331"
      hosts_model = hosts.C4331
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_c4503":
      key_model = "key_cisco_4503"
      hosts_model = hosts.C4503
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_c4506":
      key_model = "key_cisco_4506"
      hosts_model = hosts.C4506
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_c4507":
      key_model = "key_cisco_4507"
      hosts_model = hosts.C4507
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_c6509":
      key_model = "key_cisco_6509"
      hosts_model = hosts.C6509
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_c6513":
      key_model = "key_cisco_6513"
      hosts_model = hosts.C6513
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_c9407":
      key_model = "key_cisco_9407"
      hosts_model = hosts.C9407
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)


  elif sys.argv[1] == "--exec_casr-1002":
      key_model = "key_cisco_asr_1002"
      hosts_model = hosts.CASR1002
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_casr-1006":
      key_model = "key_cisco_asr_1006"
      hosts_model = hosts.CASR1006
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_casr-903":
      key_model = "key_cisco_asr_903"
      hosts_model = hosts.CASR903
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)
    
  elif sys.argv[1] == "--exec_casr1001":
      key_model = "key_cisco_asr_1001"
      hosts_model = hosts.CASR1001
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)
        
  elif sys.argv[1] == "--exec_casr9901":
      key_model = "key_cisco_asr_9901"
      hosts_model = hosts.CASR9901
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_ccgr-2010":
      key_model = "key_cisco_cgr_2010"
      hosts_model = hosts.CCGR2010
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_ccgs-2520":
      key_model = "key_cisco_cgs_2520"
      hosts_model = hosts.CCGS2520
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_cgrwic":
      key_model = "key_cisco_grwic"
      hosts_model = hosts.CGRWIC
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_cie-3000":
      key_model = "key_cisco_ie_3000"
      hosts_model = hosts.CIE3000
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_cie-2000":
      key_model = "key_cisco_ie_2000"
      hosts_model = hosts.CIE2000
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_cmc4810":
      key_model = "key_cisco_mc3810"
      hosts_model = hosts.CMC3810
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_cnexus":
      key_model = "key_cisco_nexus"
      hosts_model = hosts.CNEXUS
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_dm1200e":
      key_model = "key_datacom_dm_1200e"
      hosts_model = hosts.DM1200E
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_dgs-1510":
      key_model = "key_dlink_dgs_1510"
      hosts_model = hosts.DGS1510
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_csf300":
      key_model = "key_cisco_sf300"
      file_cmd = sys.argv[2]
      hosts_model = hosts.CSF300
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_teste":
      key_model = "key_teste"
      file_cmd = sys.argv[2]
      hosts_model = hosts.TESTE
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_c1841":
      key_model = "key_cisco_1841"
      hosts_model = hosts.C1841
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_cncs5501":
      key_model = "key_cisco_ncs5501"
      hosts_model = hosts.CNCS5501
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

  elif sys.argv[1] == "--exec_all_cisco":
      key_model = "key_all_cisco"
      hosts_model = hosts.ALL_CISCO
      file_cmd = sys.argv[2]
      main(key_model, hosts_model, file_cmd)

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
