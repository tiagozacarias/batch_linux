#!/usr/bin/env bash
# Autor : Tiago Eduardo Zacarias
# Versão: 1.2.1
# Data: 22-03-2020

# Variáveis
dia="$(date +%d)"
mes="$(date +%m)"
ano="$(date +%Y)"
version="1.2.1"

# Variáveis de chaves: opcões 0/1 | Desativado/Ativado
chave_cisco_bkp="1"
chave_datacom_bkp="1"
chave_dlink_bkp="1"
chave_extreme_bkp="1"
chave_clear_bkp="1"

#TODO
# Pendente reduzir a quantidade de loops.
# Ignorar hosts com cerquilha em /etc/hosts.

# Funções

func_exec_cisco() {

if test "${chave_cisco_bkp}" = "1" 

     then 

     echo "INICIANDO BATCH BKP CISCO | ${dia}-${mes}-${ano}"

     test -d "$HOME"/backups/cisco/wlc-5808 || mkdir -p "$HOME"/backups/cisco/wlc-5808

     for var_cwlc_5808 in $(cat < /etc/hosts | sed -n '/BEGIN_CWLC/,/END_CWLC/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_cwlc_5808}"/ cisco_wlc_bkp.tcl  > "${var_cwlc_5808}".tcl ;
      
     chmod 700 ./"${var_cwlc_5808}".tcl ; ./"${var_cwlc_5808}".tcl  > "$HOME"/backups/cisco/wlc-5808/"${var_cwlc_5808}"-"${dia}"-"${mes}"-"${ano}".txt ;
      
     rm -rf "${var_cwlc_5808}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/cisco/wlc-5808/"${var_cwlc_5808}"-"${dia}"-"${mes}"-"${ano}".txt

done

test -d "$HOME"/backups/cisco/2501 || mkdir -p "$HOME"/backups/cisco/2501


     for var_c2501 in $(cat < /etc/hosts | sed -n '/BEGIN_C2501/,/END_C2501/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_c2501}"/ cisco_bkp.tcl  > "${var_c2501}".tcl ; 
	
     chmod 700 ./"${var_c2501}".tcl ; ./"${var_c2501}".tcl  > "$HOME"/backups/cisco/2501/"${var_c2501}"-"${dia}"-"${mes}"-"${ano}".txt ; 
	
     rm -rf "${var_c2501}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/cisco/2501/"${var_c2501}"-"${dia}"-"${mes}"-"${ano}".txt

done

test -d "$HOME"/backups/cisco/2960 || mkdir -p "$HOME"/backups/cisco/2960

     for var_c2960 in $(cat < /etc/hosts | sed -n '/BEGIN_C2960/,/END_C2960/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_c2960}"/ cisco_bkp.tcl  > "${var_c2960}".tcl ; 

     chmod 700 ./"${var_c2960}".tcl ; ./"${var_c2960}".tcl | tee -a "$HOME"/backups/cisco/2960/"${var_c2960}"-"${dia}"-"${mes}"-"${ano}".txt ; 

     rm -rf "${var_c2960}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/cisco/2960/"${var_c2960}"-"${dia}"-"${mes}"-"${ano}".txt

done

test -d "$HOME"/backups/cisco/2801 || mkdir -p "$HOME"/backups/cisco/2801

     for var_c2801 in $(cat < /etc/hosts | sed -n '/BEGIN_C2801/,/END_C2801/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_c2801}"/ cisco_bkp.tcl  > "${var_c2801}".tcl ; 

     chmod 700 ./"${var_c2801}".tcl ; ./"${var_c2801}".tcl  > "$HOME"/backups/cisco/2801/"${var_c2801}"-"${dia}"-"${mes}"-"${ano}".txt ; 

     rm -rf "${var_c2801}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/cisco/2801/"${var_c2801}"-"${dia}"-"${mes}"-"${ano}".txt

done

test -d "$HOME"/backups/cisco/1120 || mkdir -p "$HOME"/backups/cisco/1120

     for var_c1120 in $(cat < /etc/hosts | sed -n '/BEGIN_C1120/,/END_C1120/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_c1120}"/ cisco_bkp.tcl  > "${var_c1120}".tcl ; 

     chmod 700 ./"${var_c1120}".tcl ; ./"${var_c1120}".tcl  > "$HOME"/backups/cisco/1120/"${var_c1120}"-"${dia}"-"${mes}"-"${ano}".txt ; 

     rm -rf "${var_c1120}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/cisco/1120/"${var_c1120}"-"${dia}"-"${mes}"-"${ano}".txt

done

test -d "$HOME"/backups/cisco/1760 || mkdir -p "$HOME"/backups/cisco/1760

     for var_c1760 in $(cat < /etc/hosts | sed -n '/BEGIN_C1760/,/END_C1760/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_c1760}"/ cisco_bkp.tcl  > "${var_c1760}".tcl ; 

     chmod 700 ./"${var_c1760}".tcl ; ./"${var_c1760}".tcl  > "$HOME"/backups/cisco/1760/"${var_c1760}"-"${dia}"-"${mes}"-"${ano}".txt ; 

     rm -rf "${var_c1760}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/cisco/1760/"${var_c1760}"-"${dia}"-"${mes}"-"${ano}".txt

done

test -d "$HOME"/backups/cisco/1941 || mkdir -p "$HOME"/backups/cisco/1941

     for var_c1941 in $(cat < /etc/hosts | sed -n '/BEGIN_C1941/,/END_C1941/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_c1941}"/ cisco_bkp.tcl  > "${var_c1941}".tcl ; 
	
     chmod 700 ./"${var_c1941}".tcl ; ./"${var_c1941}".tcl  > "$HOME"/backups/cisco/1941/"${var_c1941}"-"${dia}"-"${mes}"-"${ano}".txt ; 
	
     rm -rf "${var_c1941}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/cisco/1941/"${var_c1941}"-"${dia}"-"${mes}"-"${ano}".txt

done
  
test -d "$HOME"/backups/cisco/2511 || mkdir -p "$HOME"/backups/cisco/2511

     for var_c2511 in $(cat < /etc/hosts | sed -n '/BEGIN_C2511/,/END_C2511/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_c2511}"/ cisco_bkp.tcl  > "${var_c2511}".tcl ; 

     chmod 700 ./"${var_c2511}".tcl ; ./"${var_c2511}".tcl  > "$HOME"/backups/cisco/2511/"${var_c2511}"-"${dia}"-"${mes}"-"${ano}".txt ; 

     rm -rf "${var_c2511}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/cisco/2511/"${var_c2511}"-"${dia}"-"${mes}"-"${ano}".txt

done
 
test -d "$HOME"/backups/cisco/2621 || mkdir -p "$HOME"/backups/cisco/2621

     for var_c2621 in $(cat < /etc/hosts | sed -n '/BEGIN_C2621/,/END_C2621/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_c2621}"/ cisco_bkp.tcl  > "${var_c2621}".tcl ; 

     chmod 700 ./"${var_c2621}".tcl ; ./"${var_c2621}".tcl  > "$HOME"/backups/cisco/2621/"${var_c2621}"-"${dia}"-"${mes}"-"${ano}".txt ; 

     rm -rf "${var_c2621}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/cisco/2621/"${var_c2621}"-"${dia}"-"${mes}"-"${ano}".txt

done

test -d "$HOME"/backups/cisco/2811VE || mkdir -p "$HOME"/backups/cisco/2811VE

     for var_c2811VE in $(cat < /etc/hosts | sed -n '/BEGIN_C2811VE/,/END_C2811VE/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_c2811VE}"/ cisco_bkp.tcl  > "${var_c2811VE}".tcl ; 

     chmod 700 ./"${var_c2811VE}".tcl ; ./"${var_c2811VE}".tcl  > "$HOME"/backups/cisco/2811VE/"${var_c2811VE}"-"${dia}"-"${mes}"-"${ano}".txt ; 

     rm -rf "${var_c2811VE}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/cisco/2811VE/"${var_c2811VE}"-"${dia}"-"${mes}"-"${ano}".txt

done


 test -d "$HOME"/backups/cisco/2821 || mkdir -p "$HOME"/backups/cisco/2821

      for var_c2821 in $(cat < /etc/hosts | sed -n '/BEGIN_C2821/,/END_C2821/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

      do sed s/HOST/"${var_c2821}"/ cisco_bkp.tcl  > "${var_c2821}".tcl ; 

      chmod 700 ./"${var_c2821}".tcl ; ./"${var_c2821}".tcl  > "$HOME"/backups/cisco/2821/"${var_c2821}"-"${dia}"-"${mes}"-"${ano}".txt ; 

      rm -rf "${var_c2821}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/cisco/2821/"${var_c2821}"-"${dia}"-"${mes}"-"${ano}".txt

done

test -d "$HOME"/backups/cisco/2921 || mkdir -p "$HOME"/backups/cisco/2921

      for var_c2921 in $(cat < /etc/hosts | sed -n '/BEGIN_C2921/,/END_C2921/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

      do sed s/HOST/"${var_c2921}"/ cisco_bkp.tcl  > "${var_c2921}".tcl ; 

      chmod 700 ./"${var_c2921}".tcl ; ./"${var_c2921}".tcl  > "$HOME"/backups/cisco/2921/"${var_c2921}"-"${dia}"-"${mes}"-"${ano}".txt ; 

      rm -rf "${var_c2921}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/cisco/2921/"${var_c2921}"-"${dia}"-"${mes}"-"${ano}".txt

done
    
test -d "$HOME"/backups/cisco/2924 || mkdir -p "$HOME"/backups/cisco/2924

     for var_c2924 in $(cat < /etc/hosts | sed -n '/BEGIN_C2924/,/END_C2924/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_c2924}"/ cisco_bkp.tcl  > "${var_c2924}".tcl ; 
	
     chmod 700 ./"${var_c2924}".tcl ; ./"${var_c2924}".tcl  > "$HOME"/backups/cisco/2924/"${var_c2924}"-"${dia}"-"${mes}"-"${ano}".txt ; 
	
     rm -rf "${var_c2924}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/cisco/2924/"${var_c2924}"-"${dia}"-"${mes}"-"${ano}".txt

done
    
test -d "$HOME"/backups/cisco/2950 || mkdir -p "$HOME"/backups/cisco/2950

     for var_c2950 in $(cat < /etc/hosts | sed -n '/BEGIN_C2950/,/END_C2950/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_c2950}"/ cisco_bkp.tcl  > "${var_c2950}".tcl ; 

     chmod 700 ./"${var_c2950}".tcl ; ./"${var_c2950}".tcl  > "$HOME"/backups/cisco/2950/"${var_c2950}"-"${dia}"-"${mes}"-"${ano}".txt ; 

     rm -rf "${var_c2950}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/cisco/2950/"${var_c2950}"-"${dia}"-"${mes}"-"${ano}".txt

done

test -d "$HOME"/backups/cisco/3560 || mkdir -p "$HOME"/backups/cisco/3560

     for var_c3560 in $(cat < /etc/hosts | sed -n '/BEGIN_C3560/,/END_C3560/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_c3560}"/ cisco_bkp.tcl  > "${var_c3560}".tcl ; 

     chmod 700 ./"${var_c3560}".tcl ; ./"${var_c3560}".tcl  > "$HOME"/backups/cisco/3560/"${var_c3560}"-"${dia}"-"${mes}"-"${ano}".txt ; 

     rm -rf "${var_c3560}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/cisco/3560/"${var_c3560}"-"${dia}"-"${mes}"-"${ano}".txt

done
    
    
test -d "$HOME"/backups/cisco/3662 || mkdir -p "$HOME"/backups/cisco/3662

     for var_c3662 in $(cat < /etc/hosts | sed -n '/BEGIN_C3662/,/END_C3662/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_c3662}"/ cisco_bkp.tcl  > "${var_c3662}".tcl ; 

     chmod 700 ./"${var_c3662}".tcl ; ./"${var_c3662}".tcl  > "$HOME"/backups/cisco/3662/"${var_c3662}"-"${dia}"-"${mes}"-"${ano}".txt ; 

     rm -rf "${var_c3662}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/cisco/3662/"${var_c3662}"-"${dia}"-"${mes}"-"${ano}".txt

done  
    
 test -d "$HOME"/backups/cisco/3750 || mkdir -p "$HOME"/backups/cisco/3750

     for var_c3750 in $(cat < /etc/hosts | sed -n '/BEGIN_C3750/,/END_C3750/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_c3750}"/ cisco_bkp.tcl  > "${var_c3750}".tcl ; 

     chmod 700 ./"${var_c3750}".tcl ; ./"${var_c3750}".tcl  > "$HOME"/backups/cisco/3750/"${var_c3750}"-"${dia}"-"${mes}"-"${ano}".txt ; 

     rm -rf "${var_c3750}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/cisco/3750/"${var_c3750}"-"${dia}"-"${mes}"-"${ano}".txt

done
        
test -d "$HOME"/backups/cisco/3850 || mkdir -p "$HOME"/backups/cisco/3850

     for var_c3850 in $(cat < /etc/hosts | sed -n '/BEGIN_C3850/,/END_C3850/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_c3850}"/ cisco_bkp.tcl  > "${var_c3850}".tcl ; 

     chmod 700 ./"${var_c3850}".tcl ; ./"${var_c3850}".tcl  > "$HOME"/backups/cisco/3850/"${var_c3850}"-"${dia}"-"${mes}"-"${ano}".txt ; 

     rm -rf "${var_c3850}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/cisco/3850/"${var_c3850}"-"${dia}"-"${mes}"-"${ano}".txt

done
    
test -d "$HOME"/backups/cisco/3945 || mkdir -p "$HOME"/backups/cisco/3945

     for var_c3945 in $(cat < /etc/hosts | sed -n '/BEGIN_C3945/,/END_C3945/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_c3945}"/ cisco_bkp.tcl  > "${var_c3945}".tcl ; 

     chmod 700 ./"${var_c3945}".tcl ; ./"${var_c3945}".tcl  > "$HOME"/backups/cisco/3945/"${var_c3945}"-"${dia}"-"${mes}"-"${ano}".txt ; 

     rm -rf "${var_c3945}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/cisco/3945/"${var_c3945}"-"${dia}"-"${mes}"-"${ano}".txt

done
    
test -d "$HOME"/backups/cisco/4321 || mkdir -p "$HOME"/backups/cisco/4321

     for var_c4321 in $(cat < /etc/hosts | sed -n '/BEGIN_C4321/,/END_C4321/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_c4321}"/ cisco_bkp.tcl  > "${var_c4321}".tcl ; 

     chmod 700 ./"${var_c4321}".tcl ; ./"${var_c4321}".tcl  > "$HOME"/backups/cisco/4321/"${var_c4321}"-"${dia}"-"${mes}"-"${ano}".txt ; 

     rm -rf "${var_c4321}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/cisco/4321/"${var_c4321}"-"${dia}"-"${mes}"-"${ano}".txt

done
    
test -d "$HOME"/backups/cisco/4331 || mkdir -p "$HOME"/backups/cisco/4331

     for var_c4331 in $(cat < /etc/hosts | sed -n '/BEGIN_C4331/,/END_C4331/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_c4331}"/ cisco_bkp.tcl  > "${var_c4331}".tcl ; 

     chmod 700 ./"${var_c4331}".tcl ; ./"${var_c4331}".tcl  > "$HOME"/backups/cisco/4331/"${var_c4331}"-"${dia}"-"${mes}"-"${ano}".txt ; 

     rm -rf "${var_c4331}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/cisco/4331/"${var_c4331}"-"${dia}"-"${mes}"-"${ano}".txt

done
    
test -d "$HOME"/backups/cisco/4503 || mkdir -p "$HOME"/backups/cisco/4503

     for var_c4503 in $(cat < /etc/hosts | sed -n '/BEGIN_C4503/,/END_C4503/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_c4503}"/ cisco_bkp.tcl  > "${var_c4503}".tcl ; 

     chmod 700 ./"${var_c4503}".tcl ; ./"${var_c4503}".tcl  > "$HOME"/backups/cisco/4503/"${var_c4503}"-"${dia}"-"${mes}"-"${ano}".txt ; 

     rm -rf "${var_c4503}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/cisco/4503/"${var_c4503}"-"${dia}"-"${mes}"-"${ano}".txt

done
    
test -d "$HOME"/backups/cisco/4506 || mkdir -p "$HOME"/backups/cisco/4506

     for var_c4506 in $(cat < /etc/hosts | sed -n '/BEGIN_C4506/,/END_C4506/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_c4506}"/ cisco_bkp.tcl  > "${var_c4506}".tcl ; 

     chmod 700 ./"${var_c4506}".tcl ; ./"${var_c4506}".tcl  > "$HOME"/backups/cisco/4506/"${var_c4506}"-"${dia}"-"${mes}"-"${ano}".txt ; 

     rm -rf "${var_c4506}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/cisco/4506/"${var_c4506}"-"${dia}"-"${mes}"-"${ano}".txt

done
    
test -d "$HOME"/backups/cisco/4507 || mkdir -p "$HOME"/backups/cisco/4507

     for var_c4507 in $(cat < /etc/hosts | sed -n '/BEGIN_C4507/,/END_C4507/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_c4507}"/ cisco_bkp.tcl  > "${var_c4507}".tcl ; 

     chmod 700 ./"${var_c4507}".tcl ; ./"${var_c4507}".tcl  > "$HOME"/backups/cisco/4507/"${var_c4507}"-"${dia}"-"${mes}"-"${ano}".txt ; 

     rm -rf "${var_c4507}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/cisco/4507/"${var_c4507}"-"${dia}"-"${mes}"-"${ano}".txt

done
    
test -d "$HOME"/backups/cisco/6509 || mkdir -p "$HOME"/backups/cisco/6509

     for var_c6509 in $(cat < /etc/hosts | sed -n '/BEGIN_C6509/,/END_C6509/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_c6509}"/ cisco_bkp.tcl  > "${var_c6509}".tcl ; 
	
     chmod 700 ./"${var_c6509}".tcl ; ./"${var_c6509}".tcl  > "$HOME"/backups/cisco/6509/"${var_c6509}"-"${dia}"-"${mes}"-"${ano}".txt ; 
	
     rm -rf "${var_c6509}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/cisco/6509/"${var_c6509}"-"${dia}"-"${mes}"-"${ano}".txt

done
    
test -d "$HOME"/backups/cisco/6513 || mkdir -p "$HOME"/backups/cisco/6513

     for var_c6513 in $(cat < /etc/hosts | sed -n '/BEGIN_C6513/,/END_C6513/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_c6513}"/ cisco_bkp.tcl  > "${var_c6513}".tcl ; 

     chmod 700 ./"${var_c6513}".tcl ; ./"${var_c6513}".tcl  > "$HOME"/backups/cisco/6513/"${var_c6513}"-"${dia}"-"${mes}"-"${ano}".txt ; 

     rm -rf "${var_c6513}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/cisco/6513/"${var_c6513}"-"${dia}"-"${mes}"-"${ano}".txt

done
    
    
test -d "$HOME"/backups/cisco/asr-1002 || mkdir -p "$HOME"/backups/cisco/asr-1002

     for var_casr1002 in $(cat < /etc/hosts | sed -n '/BEGIN_CASR1002/,/END_CASR1002/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_casr1002}"/ cisco_bkp.tcl  > "${var_casr1002}".tcl ; 

     chmod 700 ./"${var_casr1002}".tcl ; ./"${var_casr1002}".tcl  > "$HOME"/backups/cisco/asr-1002/"${var_casr1002}"-"${dia}"-"${mes}"-"${ano}".txt ; 

     rm -rf "${var_casr1002}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/cisco/asr-1002/"${var_casr1002}"-"${dia}"-"${mes}"-"${ano}".txt

done
    
    
test -d "$HOME"/backups/cisco/asr-1006 || mkdir -p "$HOME"/backups/cisco/asr-1006

     for var_casr1006 in $(cat < /etc/hosts | sed -n '/BEGIN_CASR1006/,/END_CASR1006/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_casr1006}"/ cisco_bkp.tcl  > "${var_casr1006}".tcl ; 

     chmod 700 ./"${var_casr1006}".tcl ; ./"${var_casr1006}".tcl  > "$HOME"/backups/cisco/asr-1006/"${var_casr1006}"-"${dia}"-"${mes}"-"${ano}".txt ; 

     rm -rf "${var_casr1006}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/cisco/asr-1006/"${var_casr1006}"-"${dia}"-"${mes}"-"${ano}".txt

done
      
    
test -d "$HOME"/backups/cisco/asr-903 || mkdir -p "$HOME"/backups/cisco/asr-903

     for var_casr903 in $(cat < /etc/hosts | sed -n '/BEGIN_CASR903/,/END_CASR903/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_casr903}"/ cisco_bkp.tcl  > "${var_casr903}".tcl ; 

     chmod 700 ./"${var_casr903}".tcl ; ./"${var_casr903}".tcl  > "$HOME"/backups/cisco/asr-903/"${var_casr903}"-"${dia}"-"${mes}"-"${ano}".txt ; 

     rm -rf "${var_casr903}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/cisco/asr-903/"${var_casr903}"-"${dia}"-"${mes}"-"${ano}".txt

done
        
test -d "$HOME"/backups/cisco/cgr-2010 || mkdir -p "$HOME"/backups/cisco/cgr-2010

     for var_ccgr2010 in $(cat < /etc/hosts | sed -n '/BEGIN_CCGR2010/,/END_CCGR2010/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_ccgr2010}"/ cisco_bkp.tcl  > "${var_ccgr2010}".tcl ; 
	
     chmod 700 ./"${var_ccgr2010}".tcl ; ./"${var_ccgr2010}".tcl  > "$HOME"/backups/cisco/cgr-2010/"${var_ccgr2010}"-"${dia}"-"${mes}"-"${ano}".txt ; 

     rm -rf "${var_ccgr2010}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/cisco/cgr-2010/"${var_ccgr2010}"-"${dia}"-"${mes}"-"${ano}".txt

done
    
    
test -d "$HOME"/backups/cisco/cgs-2520 || mkdir -p "$HOME"/backups/cisco/cgs-2520

     for var_ccgs2520 in $(cat < /etc/hosts | sed -n '/BEGIN_CCGR2520/,/END_CCGR2520/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_ccgs2520}"/ cisco_bkp.tcl  > "${var_ccgs2520}".tcl ; 

     chmod 700 ./"${var_ccgs2520}".tcl ; ./"${var_ccgs2520}".tcl  > "$HOME"/backups/cisco/cgs-2520/"${var_ccgs2520}"-"${dia}"-"${mes}"-"${ano}".txt ; 

     rm -rf "${var_ccgs2520}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/cisco/cgs-2520/"${var_ccgs2520}"-"${dia}"-"${mes}"-"${ano}".txt

done

test -d "$HOME"/backups/cisco/grwic || mkdir -p "$HOME"/backups/cisco/grwic

     for var_cgrwic in $(cat < /etc/hosts | sed -n '/BEGIN_CGRWIC/,/END_CGRWIC/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_cgrwic}"/ cisco_bkp.tcl  > "${var_cgrwic}".tcl ; 

     chmod 700 ./"${var_cgrwic}".tcl ; ./"${var_cgrwic}".tcl  > "$HOME"/backups/cisco/grwic/"${var_cgrwic}"-"${dia}"-"${mes}"-"${ano}".txt ; 

     rm -rf "${var_cgrwic}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/cisco/grwic/"${var_cgrwic}"-"${dia}"-"${mes}"-"${ano}".txt

done

test -d "$HOME"/backups/cisco/IE-3000 || mkdir -p "$HOME"/backups/cisco/IE-3000

     for var_cIE3000 in $(cat < /etc/hosts | sed -n '/BEGIN_CIE3000/,/END_CIE3000/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_cIE3000}"/ cisco_bkp.tcl  > "${var_cIE3000}".tcl ; 

     chmod 700 ./"${var_cIE3000}".tcl ; ./"${var_cIE3000}".tcl  > "$HOME"/backups/cisco/IE-3000/"${var_cIE3000}"-"${dia}"-"${mes}"-"${ano}".txt ; 

     rm -rf "${var_cIE3000}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/cisco/IE-3000/"${var_cIE3000}"-"${dia}"-"${mes}"-"${ano}".txt

done


test -d "$HOME"/backups/cisco/MC3810 || mkdir -p "$HOME"/backups/cisco/MC3810

     for var_cMC3810 in $(cat < /etc/hosts | sed -n '/BEGIN_CMC3810/,/END_CMC3810/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_cMC3810}"/ cisco_bkp.tcl  > "${var_cMC3810}".tcl ; 

     chmod 700 ./"${var_cMC3810}".tcl ; ./"${var_cMC3810}".tcl  > "$HOME"/backups/cisco/MC3810/"${var_cMC3810}"-"${dia}"-"${mes}"-"${ano}".txt ; 

     rm -rf "${var_cMC3810}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/cisco/MC3810/"${var_cMC3810}"-"${dia}"-"${mes}"-"${ano}".txt

done



test -d "$HOME"/backups/cisco/nexus || mkdir -p "$HOME"/backups/cisco/nexus

     for var_cnexus in $(cat < /etc/hosts | sed -n '/BEGIN_CNEXUS/,/END_CNEXUS/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_cnexus}"/ cisco_bkp.tcl  > "${var_cnexus}".tcl ; 
	
     chmod 700 ./"${var_cnexus}".tcl ; ./"${var_cnexus}".tcl  > "$HOME"/backups/cisco/nexus/"${var_cnexus}"-"${dia}"-"${mes}"-"${ano}".txt ; 

     rm -rf "${var_cnexus}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/cisco/nexus/"${var_cnexus}"-"${dia}"-"${mes}"-"${ano}".txt

done


test -d "$HOME"/backups/cisco/sf300 || mkdir -p "$HOME"/backups/cisco/sf300

     for var_csf300 in $(cat < /etc/hosts | sed -n '/BEGIN_CSF300/,/END_CSF300/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_csf300}"/ cisco_bkp.tcl  > "${var_csf300}".tcl ;

     chmod 700 ./"${var_csf300}".tcl ; ./"${var_csf300}".tcl  > "$HOME"/backups/cisco/sf300/"${var_csf300}"-"${dia}"-"${mes}"-"${ano}".txt ; 

     rm -rf "${var_csf300}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/cisco/nexus/"${var_csf300}"-"${dia}"-"${mes}"-"${ano}".txt

done

	else

echo  "BATCH CISCO BKP ESTA DESATIVADO | ${dia}-${mes}-${ano}" 

fi 

} 

func_exec_datacom() {


if test "${chave_datacom_bkp}" = "1"

        then

                echo "INICIANDO BATCH BKP DATACOM | ${dia}-${mes}-${ano}"
                
test -d "$HOME"/backups/datacom/dm1200e || mkdir -p "$HOME"/backups/datacom/dm1200e

     for var_dm1200e in $(cat < /etc/hosts | sed -n '/BEGIN_DM1200E/,/END_DM1200E/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_dm1200e}"/ dm-bkp.tcl  > "${var_dm1200e}".tcl ; 
 
     chmod 700 ./"${var_dm1200e}".tcl ; ./"${var_dm1200e}".tcl  > "$HOME"/backups/datacom/dm1200e/"${var_dm1200e}"-"${dia}"-"${mes}"-"${ano}".txt ; 

     rm -rf "${var_dm1200e}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/datacom/dm1200e/"${var_dm1200e}"-"${dia}"-"${mes}"-"${ano}".txt

done


        else

echo  "BATCH DATACOM BKP ESTA DESATIVADO | ${dia}-${mes}-${ano}"

fi

}

func_exec_dlink() {


if test "${chave_dlink_bkp}" = "1"

        then
	
                echo "INICIANDO BATCH BKP DLINK | ${dia}-${mes}-${ano}"
                
test -d "$HOME"/backups/dlink/dgs1510 || mkdir -p "$HOME"/backups/dlink/dgs1510

     for var_dgs1510 in $(cat < /etc/hosts | sed -n '/BEGIN_DGS1510/,/END_DGS1510/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_dgs1510}"/ dlink-bkp.tcl  > "${var_dgs1510}".tcl ; 

     chmod 700 ./"${var_dgs1510}".tcl ; ./"${var_dgs1510}".tcl  > "$HOME"/backups/dlink/dgs1510/"${var_dgs1510}"-"${dia}"-"${mes}"-"${ano}".txt ; 

     rm -rf "${var_dgs1510}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/dlink/dgs1510/"${var_dgs1510}"-"${dia}"-"${mes}"-"${ano}".txt

done


        else

echo  "BATCH DLINK BKP ESTA DESATIVADO | ${dia}-${mes}-${ano}"

fi

}

func_exec_extreme() {


if test "${chave_extreme_bkp}" = "1"

        then

                echo "INICIANDO BATCH BKP EXTREME | ${dia}-${mes}-${ano}"

test -d "$HOME"/backups/extreme/summit-x440 || mkdir -p "$HOME"/backups/extreme/summit-x440

     for var_summit_x440 in $(cat < /etc/hosts | sed -n '/BEGIN_SUMMIT-X440/,/END_SUMMIT-X440/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');

     do sed s/HOST/"${var_summit_x440}"/ extreme-bkp.tcl  > "${var_summit_x440}".tcl ;

     chmod 700 ./"${var_summit_x440}".tcl ; ./"${var_summit_x440}".tcl  > "$HOME"/backups/extreme/dgs1510/"${var_summit_x440}"-"${dia}"-"${mes}"-"${ano}".txt ;

     rm -rf "${var_summit_x440}".tcl ; sed -i -e 's/\r//g' "$HOME"/backups/extreme/summit-x440/"${var_summit_x440}"-"${dia}"-"${mes}"-"${ano}".txt

done

	else

echo  "BATCH EXTREME BKP ESTA DESATIVADO | ${dia}-${mes}-${ano}"

fi

}

func_exec_clear_bkp () {


if test "${chave_clear_bkp}" = "1"

        then

                echo "INICIANDO BATCH DE LIMPEZA BKP | ${dia}-${mes}-${ano}"
                

find "$HOME"/backups/ -name "*.txt" -type f -mtime +30 -exec rm -rf {} \;

        else

echo  "BATCH DE LIMPEZA BKP ESTA DESATIVADO | ${dia}-${mes}-${ano}"

fi

}
 
# Menu Ajuda

		case "${1}" in 

	-h | --help) 

cat  << EOF

Uso: ${0} [OPÇÂO]

Opções Válidas:


	-V, --version		    Exibir Versão da Ferramenta

	-h, --help	            Exibir menu de Ajuda

	backup_dlink                Executa backup de todos os equipamentos da Dlink 

	backup_cisco                Executa backup de todos os equipamentos da Cisco

	backup_datacom              Executa backup de todos os equipamentos da Datacom

	backup_extreme		    Executa backup de todos os equipamentos da Extreme

	backup_all                  Executa backup de todos os equipamentos da planta 

	clear_backup                Limpa arquivos de backup com mais de 30 dias

EOF

;;

# Versão

	-V | --version)


echo "Versão:${version}"

;;

	backup_all)
		func_exec_cisco
		func_exec_extreme
		func_exec_datacom
		func_exec_dlink ;;

	backup_datacom) func_exec_datacom ;;
	backup_dlink) func_exec_dlink ;;
	backup_cisco) func_exec_cisco ;;
	backup_extreme) func_exec_extreme ;;
	clear_backup) func_exec_clear_bkp ;;

*)

echo "Você precisa passar uma opção válida"

;;

esac


