#!/usr/bin/env bash
# Autor : Tiago Eduardo Zacarias
# Versão: 1.2.1
# Data: 22-03-2020

# Variáveis Globais
dia="$(date +%d)"
mes="$(date +%m)"
ano="$(date +%Y)"
version="1.2.1"
msg_arq="INDIQUE O ARQUIVO EXPECT"

# Variáveis de chaves: opcões 0/1 | Desativado/Ativado
chave_all_cisco="1"
chave_cisco_2501="1"
chave_cisco_2520="1"
chave_cisco_nexus="1"
chave_cisco_mc3810="1"
chave_cisco_ie_3000="1"
chave_cisco_grwic="1"
chave_cisco_cgs_2520="1"
chave_cisco_cgs_2010="1"
chave_cisco_asr_903="1"
chave_cisco_asr_1006="1"
chave_cisco_asr_1002="1"
chave_cisco_6513="1"
chave_cisco_6509="1"
chave_cisco_4507="1"
chave_cisco_1760="1"
chave_cisco_4506="1"
chave_cisco_4503="1"
chave_cisco_4331="1"
chave_cisco_4321="1"
chave_cisco_3945="1"
chave_cisco_3850="1"
chave_cisco_3662="1"
chave_cisco_3560="1"
chave_cisco_2950="1"
chave_cisco_2924="1"
chave_cisco_2921="1"
chave_cisco_2821="1"
chave_cisco_2811ve="1"
chave_cisco_2621="1"
chave_cisco_2511="1"
chave_cisco_2960="1"
chave_cisco_1120="1"
chave_cisco_2801="1"
chave_cisco_1941="1"
chave_datacom_dm_1200e="1"
chave_dlink_dgs_1510="1"
chave_cisco_sf300="1"
chave_teste="1"


#TODO
# Pendente reduzir a quantidade de loops.

# Funções

func_exec_all_cisco () {


 if test "${chave_all_cisco}" = "1"

     then

	 echo "$msg_arq"
    	 read file_cisco_all
         for c_all in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_ALL_CISCO/,/END_ALL_CISCO/p' | egrep -v  '^([[:space:]]*$|BEGIN|END)');    
	 do sed s/HOST/${c_all}/ ${file_cisco_all}  > ${c_all}.tcl ; chmod 700 ./${c_all}.tcl ; ./${c_all}.tcl >> strace.txt ; rm -rf ${c_all}.exp
	 done

     else

  	 echo  "BATCH ALL HOSTS ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_teste() {


 if test "${chave_teste}" = "1"

     then

	echo "$msg_arq"
	read file_teste
        for teste in  $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_TESTE/,/END_TESTE/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');    
        do sed s/HOST/${teste}/ ${file_teste}  > ${teste}.tcl ; chmod 700 ./${teste}.tcl ; ./${teste}.tcl >> strace.txt ; rm -rf ${teste}.tcl
	done

     else

	echo  "BATCH TESTE ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"

 fi

}

func_exec_cisco_2501() {


 if test "${chave_cisco_2501}" = "1"

     then

	echo "$msg_arq"
	read file_2501
        for c2501 in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C2501/,/END_C2501/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');    
        do sed s/HOST/${c2501}/ ${file_2501}  > ${c2501}.tcl ; chmod 700 ./${c2501}.tcl ; ./${c2501}.tcl >> strace.txt ; rm -rf ${c2501}.tcl
	done

     else

   	echo  "BATCH CISCO 2501 ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_cisco_2520() {


 if test "${chave_cisco_2520}" = "1"

     then

 	echo "$msg_arq"
     	read file_2520
        for c2520 in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C2520/,/END_C2520/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');   
 	do sed s/HOST/${c2520}/ ${file_2520}  > ${c2520}.tcl ; chmod 700 ./${c2520}.tcl ; ./${c2520}.tcl >> strace.txt ; rm -rf ${c2520}.tcl
	done

     else

 	echo  "BATCH CISCO 2520 ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_cisco_nexus() {


 if test "${chave_cisco_nexus}" = "1"

     then

 	echo "$msg_arq"
     	read file_nexus
        for cnexus in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_CNEXUS/,/END_CNEXUS/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');    
 	do sed s/HOST/${cnexus}/ ${file_nexus}  > ${cnexus}.tcl ; chmod 700 ./${cnexus}.tcl ; ./${cnexus}.tcl >> strace.txt ; rm -rf ${cnexus}.tcl
	done
   
     else

   	echo  "BATCH CISCO NEXUS ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_cisco_MC3810() {


 if test "${chave_cisco_mc3810}" = "1"

     then

 	echo "$msg_arq"
     	read file_mc3810
        for cmc3810 in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_CMC3810/,/END_CMC3810/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');    
 	do sed s/HOST/${cmc3810}/ ${file_mc3810}  > ${cmc3810}.tcl ; chmod 700 ./${cmc3810}.tcl ; ./${cmc3810}.tcl >> strace.txt ; rm -rf ${cmc3810}.tcl
	done
   
     else

   	echo  "BATCH CISCO MC3810 ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_cisco_IE_3000() {


 if test "${chave_cisco_ie_3000}" = "1"

     then

 	echo "$msg_arq"
     	read file_ie_3000
        for cie_3000 in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_CIE3000/,/END_CIE3000/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');    
 	do sed s/HOST/${cie_3000}/ ${file_ie_3000}  > ${cie_3000}.tcl ; chmod 700 ./${cie_3000}.tcl ; ./${cie_3000}.tcl >> strace.txt ; rm -rf ${cie_3000}.tcl
	done
   
     else

   	echo  "BATCH CISCO IE-3000 ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_cisco_grwic() {


 if test "${chave_cisco_grwic}" = "1"

     then

 	echo "$msg_arq"
	read file_grwic
        for cgrwic in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_CGRWIC/,/END_CGRWIC/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');    
        do sed s/HOST/${cgrwic}/ ${file_grwic}  > ${cgrwic}.tcl ; chmod 700 ./${cgrwic}.tcl ; ./${cgrwic}.tcl >> strace.txt ; rm -rf ${cgrwic}.tcl
	done
   
     else

  	echo  "BATCH CISCO GRWIC ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_cisco_cgs_2520() {


 if test "${chave_cisco_cgs_2520}" = "1"

     then
  
 	echo "$msg_arq"
     	read file_cgs-2520
        for ccgs-2520 in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_CCGR2520/,/END_CGR2520/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');    
        do sed s/HOST/${ccgs-2520}/ ${file_cgs-2520}  > ${ccgs-2520}.tcl ; chmod 700 ./${ccgs-2520}.tcl ; ./${ccgs-2520}.tcl >> strace.txt ; rm -rf ${ccgs-2520}.tcl
	done
   
     else

   	echo  "BATCH CISCO CGS 2520 ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_cisco_cgr_2010() {


 if test "${chave_cisco_cgs_2010}" = "1"

     then

 	echo "$msg_arq"
     	read file_cgr-2010
        for ccgr-2010 in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_CCGR2010/,/END_CCGR2010/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');    
 	do sed s/HOST/${ccgr-2010}/ ${file_cgr-2010}  > ${ccgr-2010}.tcl ; chmod 700 ./${ccgr-2010}.tcl ; ./${ccgr-2010}.tcl >> strace.txt ; rm -rf ${ccgr-2010}.tcl
	done
   
     else

   	echo  "BATCH CISCO CGR 2010 ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_cisco_asr_903() {


 if test "${chave_cisco_asr_903}" = "1"

     then

 	echo "$msg_arq"
     	read file_asr-903
        for casr-903 in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_CASR903/,/END_CASR903/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');    
	do sed s/HOST/${casr-903}/ ${file_asr-903}  > ${casr-903}.tcl ; chmod 700 ./${casr-903}.tcl ; ./${casr-903}.tcl >> strace.txt ; rm -rf ${casr-903}.tcl
	done
   
     else

    	echo  "BATCH CISCO ASR 903 ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_cisco_asr_1006() {


 if test "${chave_cisco_asr_1006}" = "1"

     then

 	echo "$msg_arq"
     	read file_asr_1006
        for casr_1006 in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_CASR1006/,/END_CASR1006/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');    
 	do sed s/HOST/${casr_1006}/ ${file_asr_1006}  > ${casr_1006}.tcl ; chmod 700 ./${casr_1006}.tcl ; ./${casr_1006}.tcl >> strace.txt ; rm -rf ${casr_1006}.tcl
	done
   
     else

   	echo  "BATCH CISCO ASR 1006 ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_cisco_asr_1002() {


 if test "${chave_cisco_asr_1002}" = "1"

     then

 	echo "$msg_arq"
     	read file_asr_1002
        for casr_1002 in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_CASR1002/,/END_CASR1002/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');    
 	do sed s/HOST/${casr_1002}/ ${file_asr_1002}  > ${casr_1002}.tcl ; chmod 700 ./${casr_1002}.tcl ; ./${casr_1002}.tcl >> strace.txt ; rm -rf ${casr_1002}.tcl
	done
   
     else

    	echo  "BATCH CISCO ASR 1002 ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_cisco_6513() {


 if test "${chave_cisco_6513}" = "1"

     then

 	echo "$msg_arq"
     	read file_6513
        for c6513 in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C6513/,/END_C6513/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');    
 	do sed s/HOST/${c6513}/ ${file_6513}  > ${c6513}.tcl ; chmod 700 ./${c6513}.tcl ; ./${c6513}.tcl >> strace.txt ; rm -rf ${c6513}.tcl
	done
   
     else

   	echo  "BATCH CISCO 6513 ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_cisco_6509() {


 if test "${chave_cisco_6509}" = "1"

     then

 	echo "$msg_arq"
     	read file_6509
        for c6509 in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C6509/,/END_C6509/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');   
 	do sed s/HOST/${c6509}/ ${file_6509}  > ${c6509}.tcl ; chmod 700 ./${c6509}.tcl ; ./${c6509}.tcl >> strace.txt ; rm -rf ${c6509}.tcl
	done
   
     else

   	echo  "BATCH CISCO 6509 ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_cisco_4507() {


 if test "${chave_cisco_4507}" = "1"

      then
   
 	 echo "$msg_arq"
     	 read file_4507
         for c4507 in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C4507/,/END_C4507/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');                 
 	 do sed s/HOST/${c4507}/ ${file_4507}  > ${c4507}.tcl ; chmod 700 ./${c4507}.tcl ; ./${c4507}.tcl >> strace.txt ; rm -rf ${c4507}.tcl
	 done
   
      else

  	 echo  "BATCH CISCO 4507 ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_cisco_4506() {


 if test "${chave_cisco_4506}" = "1"

     then
     
 	echo "$msg_arq"
	read file_4506
        for c4506 in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C4506/,/END_C4506/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');   
	do sed s/HOST/${c4506}/ ${file_4506}  > ${c4506}.tcl ; chmod 700 ./${c4506}.tcl ; ./${c4506}.tcl >> strace.txt ; rm -rf ${c4506}.tcl
	done
   
     else

  	 echo  "BATCH CISCO 4506 ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_cisco_4503() {


 if test "${chave_cisco_4503}" = "1"

     then

 	echo "$msg_arq"
     	read file_4503
        for c4503 in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C4503/,/END_C4503/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');    
 	do sed s/HOST/${c4503}/ ${file_4503}  > ${c4503}.tcl ; chmod 700 ./${c4503}.tcl ; ./${c4503}.tcl >> strace.txt ; rm -rf ${c4503}.tcl
	done
   
     else

   	echo  "BATCH CISCO 4503 ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_cisco_4331() {


 if test "${chave_cisco_4331}" = "1"

     then

 	echo "$msg_arq"
     	read file_4331
        for c4331 in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C4331/,/END_C4331/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');                   
 	do sed s/HOST/${c4331}/ ${file_4331}  > ${c4331}.tcl ; chmod 700 ./${c4331}.tcl ; ./${c4331}.tcl >> strace.txt ; rm -rf ${c4331}.tcl
	done
   
     else

  	echo  "BATCH CISCO 4331 ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_cisco_4321() {


 if test "${chave_cisco_4321}" = "1"

     then

 	echo "$msg_arq"
     	read file_4321
        for c4321 in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C4331/,/END_C4331/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');
 	do sed s/HOST/${c4321}/ ${file_4321}  > ${c4321}.tcl ; chmod 700 ./${c4321}.tcl ; ./${c4321}.tcl >> strace.txt ; rm -rf ${c4321}.tcl
	done
   
     else

   	echo  "BATCH CISCO 4321 ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_cisco_3945() {


 if test "${chave_cisco_3945}" = "1"

     then

 	echo "$msg_arq"
     	read file_3945
        for c3945 in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C3945/,/END_C3945/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');    
	do sed s/HOST/${c3945}/ ${file_3945}  > ${c3945}.tcl ; chmod 700 ./${c3945}.tcl ; ./${c3945}.tcl >> strace.txt ; rm -rf ${c3945}.tcl
	done
   
     else

   	echo  "BATCH CISCO 3945 ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_cisco_3850() {


 if test "${chave_cisco_3850}" = "1"

     then

 	echo "$msg_arq"
     	read file_3850
        for c3850 in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C3850/,/END_C3850/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');    
 	do sed s/HOST/${c3850}/ ${file_3850}  > ${c3850}.tcl ; chmod 700 ./${c3850}.tcl ; ./${c3850}.tcl >> strace.txt ; rm -rf ${c3850}.tcl
	done
   
     else

   	echo  "BATCH CISCO 3850 ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_cisco_3750() {


 if test "${chave_cisco_3750}" = "1"

     then

 	echo "$msg_arq"
     	read file_3750
        for c3750 in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C3750/,/END_C3750/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');    
	do sed s/HOST/${c3750}/ ${file_3750}  > ${c3750}.tcl ; chmod 700 ./${c3750}.tcl ; ./${c3750}.tcl >> strace.txt ; rm -rf ${c3750}.tcl
	done
   
     else

  	echo  "BATCH CISCO 3750 ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_cisco_3662() {


 if test "${chave_cisco_3662}" = "1"

     then

 	echo "$msg_arq"
     	read file_3662
        for c3662 in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C3662/,/END_C3662/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');    
 	do sed s/HOST/${c3662}/ ${file_3662}  > ${c3662}.tcl ; chmod 700 ./${c3662}.tcl ; ./${c3662}.tcl >> strace.txt ; rm -rf ${c3662}.tcl
	done
   
     else

   	echo  "BATCH CISCO 3662 ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_cisco_3560() {


 if test "${chave_cisco_3560}" = "1"

     then

 	echo "$msg_arq"
     	read file_3560
        for c3560 in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C3560/,/END_C3560/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');    
	do sed s/HOST/${c3560}/ ${file_3560}  > ${c3560}.tcl ; chmod 700 ./${c3560}.tcl ; ./${c3560}.tcl >> strace.txt ; rm -rf ${c3560}.tcl
	done
   
     else

  	 echo  "BATCH CISCO 3560 ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_cisco_2950() {


 if test "${chave_cisco_2950}" = "1"

     then

 	echo "$msg_arq"
     	read file_2950
        for c2950 in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C2950/,/END_C2950/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');    
 	do sed s/HOST/${c2950}/ ${file_2950}  > ${c2950}.tcl ; chmod 700 ./${c2950}.tcl ; ./${c2950}.tcl >> strace.txt ; rm -rf ${c2950}.tcl
	done
   
     else

  	echo  "BATCH CISCO 2950 ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_cisco_2924() {


 if test "${chave_cisco_2924}" = "1"
       
     then

 	echo "$msg_arq"
     	read file_2924
        for c2924 in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C2924/,/END_C2924/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');    
 	do sed s/HOST/${c2924}/ ${file_2924}  > ${c2924}.tcl ; chmod 700 ./${c2924}.tcl ; ./${c2924}.tcl >> strace.txt ; rm -rf ${c2924}.tcl
	done
   
     else

   	echo  "BATCH CISCO 2924 ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_cisco_2921() {


 if test "${chave_cisco_2921}" = "1"

     then
     	
 	echo "$msg_arq"
	read file_2921
        for c2921 in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C2921/,/END_C2921/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');    
 	do sed s/HOST/${c2921}/ ${file_2921}  > ${c2921}.tcl ; chmod 700 ./${c2921}.tcl ; ./${c2921}.tcl >> strace.txt ; rm -rf ${c2921}.tcl
	done
   
     else

  	echo  "BATCH CISCO 2921 ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_cisco_2821() {


 if test "${chave_cisco_2821}" = "1"

     then
   
 	echo "$msg_arq"
   	read file_2821
        for c2821 in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C2821/,/END_C2821/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');    
	do sed s/HOST/${c2821}/ ${file_2821}  > ${c2821}.tcl ; chmod 700 ./${c2821}.tcl ; ./${c2821}.tcl >> strace.txt ; rm -rf ${c2821}.tcl
	done
   
     else

   	echo  "BATCH CISCO 2821 ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_cisco_2811VE() {


 if test "${chave_cisco_2811ve}" = "1"

     then
     
 	echo "$msg_arq"
	read file_2811VE
        for c2811ve in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C2811VE/,/END_C2811VE/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');    
 	do sed s/HOST/${c2811ve}/ ${file_2811VE}  > ${c2811ve}.tcl ; chmod 700 ./${c2811ve}.tcl ; ./${c2811ve}.tcl >> strace.txt ; rm -rf ${c2811ve}.tcl
	done
   
     else

   	echo  "BATCH CISCO 2811VE ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_cisco_2621() {


 if test "${chave_cisco_2621}" = "1"

     then
     	
 	echo "$msg_arq"
	read file_2621
        for c2621 in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C2621/,/END_C2621/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');   
 	do sed s/HOST/${c2621}/ ${file_2621}  > ${c2621}.tcl ; chmod 700 ./${c2621}.tcl ; ./${c2621}.tcl >> strace.txt ; rm -rf ${c2621}.tcl
	done
   
     else

   	echo  "BATCH CISCO 2621 ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_cisco_2511() {


 if test "${chave_cisco_2511}" = "1"

     then

 	echo "$msg_arq"
     	read file_2511
        for c2511 in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C2511/,/END_C2511/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');   
	do sed s/HOST/${c2511}/ ${file_2511}  > ${c2511}.tcl ; chmod 700 ./${c2511}.tcl ; ./${c2511}.tcl >> strace.txt ; rm -rf ${c2511}.tcl
	done
   
     else

   	echo  "BATCH CISCO 2511 ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_cisco_2960() {


 if test "${chave_cisco_2960}" = "1"

    then
     	
 	echo "$msg_arq"
	read file_2960
        for c2960 in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C2911/,/END_C2911/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');   
 	do sed s/HOST/${c2960}/ ${file_2960}  > ${c2960}.tcl ; chmod 700 ./${c2960}.tcl ; ./${c2960}.tcl >> strace.txt ; rm -rf ${c2960}.tcl
	done
   
    else

   	echo  "BATCH CISCO 2960 ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_cisco_1120() {


 if test "${chave_cisco_1120}" = "1"

     then

 	echo "$msg_arq"
     	read file_1120
        for c1120 in  $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C1120/,/END_C1120/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');    
 	do sed s/HOST/${c1120}/ ${file_1120}  > ${c1120}.tcl ; chmod 700 ./${c1120}.tcl ; ./${c1120}.tcl >> strace.txt ; rm -rf ${c1120}.tcl
	done
   
     else

   	echo  "BATCH CISCO 1120 ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_cisco_2801() {


 if test "${chave_cisco_2801}" = "1"

    then

 	echo "$msg_arq"
     	read file_2801
        for c2801 in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C2801/,/END_C2801/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');    
 	do sed s/HOST/${c2801}/ ${file_2801}  > ${c2801}.tcl ; chmod 700 ./${c2801}.tcl ; ./${c2801}.tcl >> strace.txt ; rm -rf ${c2801}.tcl
	done
   
    else

    	echo  "BATCH CISCO 2801 ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_cisco_1760() {


 if test "${chave_cisco_1760}" = "1"

     then

 	echo "$msg_arq"
     	read file_1760
        for c1760 in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C1760/,/END_C1760/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');   
 	do sed s/HOST/${c1760}/ ${file_1760}  > ${c1760}.tcl ; chmod 700 ./${c1760}.tcl ; ./${c1760}.tcl >> strace.txt ; rm -rf ${c1760}.tcl
	done
   
     else

    	echo  "BATCH CISCO 1760 ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_cisco_1941() {


 if test "${chave_cisco_1941}" = "1"

     then
   
 	echo "$msg_arq"
     	read file_1941
        for c1941 in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C1941/,/END_C1941/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');   
 	do sed s/HOST/${c1941}/ ${file_1941}  > ${c1941}.tcl ; chmod 700 ./${c1941}.tcl ; ./${c1941}.tcl >> strace.txt ; rm -rf ${c1941}.tcl
	done
   
     else

   	echo  "BATCH CISCO 1941 ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_datacom_dm1200e() {


 if test "${chave_datacom_dm_1200e}" = "1"

     then
     
 	echo "$msg_arq"
	read file_dm1200e
        for var_dm_1200e in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_DM1200E/,/END_DM1200E/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');    
 	do sed s/HOST/${var_dm_1200e}/ ${file_dm1200e}  > ${var_dm_1200e}.tcl ; 
	chmod 700 ./${var_dm_1200e}.tcl ; ./${var_dm_1200e}.tcl >> strace.txt ; rm -rf ${var_dm_1200e}.tcl
	done
   
     else

   	echo  "BATCH DATACOM ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_dlink_dgs-1510() {

 if test "${chave_dlink_dgs_1510}" = "1"

     then

 	echo "$msg_arq"
     	read file_dgs1510
        for cdgs_1510 in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_DGS1510/,/END_DGS1510/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');     
 	do sed s/HOST/${cdgs_1510}/ ${file_dgs1510}  > ${cdgs_1510}.tcl ; chmod 700 ./${cdgs_1510}.tcl ; ./${cdgs_1510}.tcl >> strace.txt ; rm -rf ${cdgs_1510}.tcl
	done
   
     else

   	 echo  "BATCH DATACOM ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"
 fi

}

func_exec_cisco_sf300() {


if test "${chave_cisco_sf300}" = "1"

     then

 	echo "$msg_arq"
     	read file_sf300
        for var_csf300 in $(cat /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_CSF300/,/END_CSF300/p' | egrep -v '^([[:space:]]*$|BEGIN|END)');    
 	do sed s/HOST/${var_csf300}/ ${file_sf300}  > ${var_csf300}.tcl ; chmod 700 ./${var_csf300}.tcl ; ./${var_csf300}.tcl >> strace.txt ; rm -rf ${var_csf300}.tcl
	done
   
     else

 	echo  "BATCH CISCO SF300 ESTÁ DESATIVADO | ${dia}-${mes}-${ano}"

  fi

}
             # Menu de Ajuda
          
	     case "${1}" in 

                        -h  | --help)

cat  <<  EOF

Uso: ${0} [OPÇÃO]

Opções Válidas:


	-V, --version   Exibir Versão da Ferramenta

	-h, --help      Exibir menu de Ajuda 

	exec_c2960      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 2960

	exec_c2520      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 2520

	exec_c1120      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 1120 

	exec_c1760      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 1760 

	exec_c1941      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 1941

	exec_c2501      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 2501

	exec_c2511      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 2511 

	exec_c2621      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 2621  

	exec_c2801      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 2801 

	exec_c2811VE    arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 2811VE  

	exec_c2821      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 2821

	exec_c2921      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 2921 

	exec_c2924      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 2924 
	
	exec_c2950      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 2950 

	exec_c3560      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 3560  

	exec_c3662      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 3662 

	exec_c3750      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 3750 

	exec_c3850      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 3850  

	exec_c3945      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 3945  

	exec_c4321      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 3321  

	exec_c4331      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 4331  

	exec_c4503      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 4503  

	exec_c4506      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 4506 

	exec_c4507      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 4507

	exec_c6509      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 6509 

	exec_c6513      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 6513 

	exec_casr-1002  arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco asr-1002

	exec_casr-1006  arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco asr-1006

	exec_casr-903   arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco asr-903 

	exec_ccgr-2010  arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco cgr-2010 

	exec_ccgs-2520  arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco cgs-2520 

	exec_cgrwic     arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco grwic 

	exec_cie-3000   arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco ie-3000 

	exec_cmc4810    arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco mc4810

	exec_cnexus     arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco nexus

	exec_dm1200e    arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da datacom 1200e 

	exec_dgs-1510   arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da dlink dgs-1510

	exec_csf300     arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco sf300

	exec_teste      arquivo_de_lote.tcl     Executa comandos em teste para todos os equipamentos da rede

	exec_all_cisco  arquivo_de_lote.tcl     Executa comandos em todos os equipamentos cisco

EOF

;;

	# Versão

	-V | --version) echo "Versão:$version"

;; 
	exec_teste) func_exec_teste ;;
	exec_c2501) func_exec_cisco_2501 ;;
	exec_c2520) func_exec_cisco_2520 ;;
	exec_c2960) func_exec_cisco_2960 ;;
	exec_dm1200e) func_exec_datacom_dm1200e ;;
	exec_dgs-1510) func_exec_dlink_dgs_1510 ;;
	exec_c1120) func_exec_cisco_1120 ;;
	exec_c1760) func_exec_cisco_1760 ;;
	exec_c1941) func_exec_cisco_1941 ;;
	exec_c2511) func_exec_cisco_2511 ;;
	exec_c2621) func_exec_cisco_2621 ;;
	exec_c2801) func_exec_cisco_2801 ;;
	exec_c2811VE) func_exec_cisco_2811VE ;;
	exec_c2821) func_exec_cisco_2821 ;;
	exec_c2921) func_exec_cisco_2921 ;;
	exec_c2924) func_exec_cisco_2924 ;;
	exec_c2950) func_exec_cisco_2950 ;;
	exec_c3560) func_exec_cisco_3560 ;;
	exec_c3662) func_exec_cisco_3662 ;;
	exec_c3750) func_exec_cisco_3750 ;;
	exec_c3850) func_exec_cisco_3850 ;;
	exec_c3945) func_exec_cisco_3945 ;;
	exec_c4321) func_exec_cisco_4321 ;;
	exec_c4331) func_exec_cisco_4331 ;;
	exec_c4503) func_exec_cisco_4503 ;;
	exec_c4506) func_exec_cisco_4506 ;;
	exec_c4507) func_exec_cisco_4507 ;;
	exec_c6509) func_exec_cisco_6509 ;;
	exec_c6513) func_exec_cisco_6513 ;;
	exec_casr-1002) func_exec_cisco_asr_1002 ;;
	exec_casr-1006) func_exec_cisco_asr_1006 ;;
	exec_casr-903) func_exec_cisco_asr_903 ;;
	exec_ccgr-2010) func_exec_cisco_cgr_2010 ;;
	exec_ccgs-2520) func_exec_cisco_cgs_2520 ;;
	exec_cgrwic) func_exec_cisco_grwic ;;
	exec_cie-3000) func_exec_cisco_ie_3000 ;;
	exec_cmc4810) func_exec_cisco_cmc4810 ;;
	exec_cnexus) func_exec_cisco_nexus ;;
	exec_csf300) func_exec_cisco_sf300 ;;
	exec_all_cisco) func_exec_all_cisco ;;

	*)

	echo "Você precisa passar uma opção válida"

;; 

esac
