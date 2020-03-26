#!/usr/bin/env bash
# Autor : Tiago Eduardo Zacarias
# Versão: 1.2.2
# Data: 25-03-2020

# Variáveis
dia="$(date +%d)"
mes="$(date +%m)"
ano="$(date +%Y)"
version="1.2.2"

# Variáveis de chaves: opcões 0/1 | Desativado/Ativado
chave_all_cisco="1"
chave_cisco_2501="1"
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
chave_cisco_3750="1"
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

 if [[ "${chave_all_cisco}" = "1" ]] ; then
     
   if [[ "$1" != "" ]]; then
  	
  	for c_all in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_ALL_CISCO/,/END_ALL_CISCO/p' | grep -E -v  '^([[:space:]]*$|BEGIN|END)');    
	do sed s/HOST/"${c_all}"/ "${1}"  > "${c_all}".tcl ; chmod 700 ./"${c_all}".tcl ; ./"${c_all}".tcl >> strace.txt ; rm -rf "${c_all}".exp
	done
   
    else 

	echo "[Aponte o arquivo expect.]" 
	exit 1
fi 
    else
    	
    	echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
	exit 0
 fi

}

func_exec_teste() {

 if [[ "${chave_teste}" = "1" ]] ; then

   if [[ "$1" != "" ]] ; then     

        for teste in  $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_TESTE/,/END_TESTE/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');    
        do sed s/HOST/"${teste}"/ "${1}"  > "${teste}".tcl ; chmod 700 ./"${teste}".tcl ; ./"${teste}".tcl >> strace.txt ; rm -rf "${teste}".tcl
	done
    else 
	
	echo "[Aponte o arquivo expect.]" 
	exit 1
fi 

    else

	echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
	exit 0
 fi

}

func_exec_cisco_2501() {

 if [[ "${chave_cisco_2501}" = "1" ]]; then
     
   if [[ "$1" != "" ]]; then

        for c2501 in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C2501/,/END_C2501/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');    
        do sed s/HOST/"${c2501}"/ "${1}"  > "${c2501}".tcl ; chmod 700 ./"${c2501}".tcl ; ./"${c2501}".tcl >> strace.txt ; rm -rf "${c2501}".tcl
	done
   else 
 
	echo "[Aponte o arquivo expect.]" 
        exit 1
fi 
	
   else

   	echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
   	exit 0
 fi

}

func_exec_cisco_nexus() {

 if [[ "${chave_cisco_nexus}" = "1" ]]; then
     
    if [[ "$1" != "" ]]; then 
     
        for cnexus in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_CNEXUS/,/END_CNEXUS/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');    
 	do sed s/HOST/"${cnexus}"/ "${1}"  > "${cnexus}".tcl ; chmod 700 ./"${cnexus}".tcl ; ./"${cnexus}".tcl >> strace.txt ; rm -rf "${cnexus}".tcl
	done
   else 
   
	echo "[Aponte o arquivo expect.]" 
        exit 1

fi 
   else
   	
   	echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
	exit 0
 fi

}

func_exec_cisco_MC3810() {

 if [[ "${chave_cisco_mc3810}" = "1" ]]; then
     
    if [[ "$1" != "" ]]; then

        for cmc3810 in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_CMC3810/,/END_CMC3810/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');    
 	do sed s/HOST/"${cmc3810}"/ "${1}"  > "${cmc3810}".tcl ; chmod 700 ./"${cmc3810}".tcl ; ./"${cmc3810}".tcl >> strace.txt ; rm -rf "${cmc3810}".tcl
	done
   else 
   
	echo "[Aponte o arquivo expect.]"
	exit 1

fi    
   else

   	echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
   	exit 0
 fi

}

func_exec_cisco_IE_3000() {

 if [[ "${chave_cisco_ie_3000}" = "1" ]]; then
    
    if [[ "$1" != "" ]]; then 
     
        for cie_3000 in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_CIE3000/,/END_CIE3000/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');    
 	do sed s/HOST/"${cie_3000}"/ "${1}"  > "${cie_3000}".tcl ; chmod 700 ./"${cie_3000}".tcl ; ./"${cie_3000}".tcl >> strace.txt ; rm -rf "${cie_3000}".tcl
	done
   else 
   
	echo "[Aponte o arquivo expect.]" 
	exit 1
fi 
   
   else

   	echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
	exit 0 
 fi

}

func_exec_cisco_grwic() {

 if [[ "${chave_cisco_grwic}" = "1" ]]; then
     
    if [[ "$1" != "" ]]; then

        for cgrwic in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_CGRWIC/,/END_CGRWIC/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');    
        do sed s/HOST/"${cgrwic}"/ "${1}"  > "${cgrwic}".tcl ; chmod 700 ./"${cgrwic}".tcl ; ./"${cgrwic}".tcl >> strace.txt ; rm -rf "${cgrwic}".tcl
	done
  else 
	echo "[Aponte o arquivo expect.]" 
	exit 1

fi    
     else

  	echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
  	exit 0
 fi

}

func_exec_cisco_cgs_2520() {

 if [[ "${chave_cisco_cgs_2520}" = "1" ]]; then
     
    if [[ "$1" != "" ]]; then
  
        for ccgs_2520 in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_CCGR2520/,/END_CGR2520/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');    
        do sed s/HOST/"${ccgs_2520}"/ "${1}"  > "${ccgs_2520}".tcl ; chmod 700 ./"${ccgs_2520}".tcl ; ./"${ccgs_2520}".tcl >> strace.txt ; rm -rf "${ccgs_2520}".tcl
	done
   else 
   
	echo "[Aponte o arquivo expect.]" 
	exit 1

fi    
   else

   	echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
   	exit 0
 fi

}

func_exec_cisco_cgr_2010() {

 if [[ "${chave_cisco_cgs_2010}" = "1" ]]; then
      
    if [[ "$1" != "" ]]; then

        for ccgr_2010 in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_CCGR2010/,/END_CCGR2010/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');    
 	do sed s/HOST/"${ccgr_2010}"/ "${1}"  > "${ccgr_2010}".tcl ; chmod 700 ./"${ccgr_2010}".tcl ; ./"${ccgr_2010}".tcl >> strace.txt ; rm -rf "${ccgr_2010}".tcl
	done
   else 
   
	echo "[Aponte o arquivo expect.]" 
	exit 1

fi    
    else

   	echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
   	exit 0 
 fi

}

func_exec_cisco_asr_903() {

 if [[ "${chave_cisco_asr_903}" = "1" ]]; then
     
    if [[ "$1" != "" ]]; then
 
        for casr_903 in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_CASR903/,/END_CASR903/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');    
	do sed s/HOST/"${casr_903}"/ "${1}"  > "${casr_903}".tcl ; chmod 700 ./"${casr_903}".tcl ; ./"${casr_903}".tcl >> strace.txt ; rm -rf "${casr_903}".tcl
	done
   else 
   
	echo "[Aponte o arquivo expect.]" 
	exit 0 
fi    
     else

    	echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
    	exit 1
 fi

}

func_exec_cisco_asr_1006() {

 if [[ "${chave_cisco_asr_1006}" = "1" ]]; then
    
    if [[ "$1" != "" ]];  then
 	
        for casr_1006 in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_CASR1006/,/END_CASR1006/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');    
 	do sed s/HOST/"${casr_1006}"/ "${1}"  > "${casr_1006}".tcl ; chmod 700 ./"${casr_1006}".tcl ; ./"${casr_1006}".tcl >> strace.txt ; rm -rf "${casr_1006}".tcl
	done
  
  else 
   
	echo "[Aponte o arquivo expect.]" 
	exit 1 

fi    
     else

   	echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
   	exit 0 
 fi

}

func_exec_cisco_asr_1002() {

 if [[ "${chave_cisco_asr_1002}" = "1" ]];  then
     
    if [[ "$1" != "" ]];  then

        for casr_1002 in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_CASR1002/,/END_CASR1002/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');    
 	do sed s/HOST/"${casr_1002}"/ "${1}"  > "${casr_1002}".tcl ; chmod 700 ./"${casr_1002}".tcl ; ./"${casr_1002}".tcl >> strace.txt ; rm -rf "${casr_1002}".tcl
	done

    else 
   
	echo "[Aponte o arquivo expect.]" 
	exit 1

fi    
    else

    	echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
	exit 0
 fi

}

func_exec_cisco_6513() {

 if [[ "${chave_cisco_6513}" = "1" ]];  then
     
    if [[ "$1" != "" ]];  then

        for c6513 in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C6513/,/END_C6513/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');    
 	do sed s/HOST/"${c6513}"/ "${1}"  > "${c6513}".tcl ; chmod 700 ./"${c6513}".tcl ; ./"${c6513}".tcl >> strace.txt ; rm -rf "${c6513}".tcl
	done
   else 
   
	echo "[Aponte o arquivo expect.]" 
	exit 1

fi    
   else

   	echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
   	exit 0
 fi

}

func_exec_cisco_6509() {

 if [[ "${chave_cisco_6509}" = "1" ]] ; then
     
    if [[ "$1" != "" ]];  then

        for c6509 in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C6509/,/END_C6509/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');   
 	do sed s/HOST/"${c6509}"/ "${1}"  > "${c6509}".tcl ; chmod 700 ./"${c6509}".tcl ; ./"${c6509}".tcl >> strace.txt ; rm -rf "${c6509}".tcl
	done
   else 
   
	echo "[Aponte o arquivo expect.]" 
	exit 1

fi       
   else

   	echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
   	exit 0 
 fi

}

func_exec_cisco_4507() {

 if [[ "${chave_cisco_4507}" = "1" ]];  then
	
    if [[ "$1" != "" ]];   then   

         for c4507 in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C4507/,/END_C4507/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');                 
 	 do sed s/HOST/"${c4507}"/ "${1}"  > "${c4507}".tcl ; chmod 700 ./"${c4507}".tcl ; ./"${c4507}".tcl >> strace.txt ; rm -rf "${c4507}".tcl
	 done
   else 
   
	 echo "[Aponte o arquivo expect.]" 
	 exit 1 

fi       
   else

  	 echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
   	 exit 0 
 fi

}

func_exec_cisco_4506() {

 if [[ "${chave_cisco_4506}" = "1" ]];  then
     
    if [[ "$1" != "" ]];  then     

        for c4506 in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C4506/,/END_C4506/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');   
	do sed s/HOST/"${c4506}"/ "${1}"  > "${c4506}".tcl ; chmod 700 ./"${c4506}".tcl ; ./"${c4506}".tcl >> strace.txt ; rm -rf "${c4506}".tcl
	done
   else 
   
	echo "[Aponte o arquivo expect.]" 
	exit 1

fi          
   else

	echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
  	exit 0 
 fi

}

func_exec_cisco_4503() {

 if [[ "${chave_cisco_4503}" = "1" ]];   then
     
    if [[ "$1" != "" ]];  then     

        for c4503 in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C4503/,/END_C4503/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');    
 	do sed s/HOST/"${c4503}"/ "${1}"  > "${c4503}".tcl ; chmod 700 ./"${c4503}".tcl ; ./"${c4503}".tcl >> strace.txt ; rm -rf "${c4503}".tcl
	done
  else 
   
	echo "[Aponte o arquivo expect.]" 
	exit 1

fi       
   
  else

   	echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
   	exit 0 
 fi

}

func_exec_cisco_4331() {

 if [[ "${chave_cisco_4331}" = "1" ]];  then
     
    if [[ "$1" != "" ]];   then     

        for c4331 in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C4331/,/END_C4331/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');                   
 	do sed s/HOST/"${c4331}"/ "${1}"  > "${c4331}".tcl ; chmod 700 ./"${c4331}".tcl ; ./"${c4331}".tcl >> strace.txt ; rm -rf "${c4331}".tcl
	done
  else 
   
	echo "[Aponte o arquivo expect.]" 
	exit 1

fi
     else

  	echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
	exit 0 
 fi

}

func_exec_cisco_4321() {

 if [[ "${chave_cisco_4321}" = "1" ]];   then
     
    if [[ "$1" != "" ]];  then     

        for c4321 in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C4331/,/END_C4331/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');
 	do sed s/HOST/"${c4321}"/ "${1}"  > "${c4321}".tcl ; chmod 700 ./"${c4321}".tcl ; ./"${c4321}".tcl >> strace.txt ; rm -rf "${c4321}".tcl
	done
  else 
   
	echo "[Aponte o arquivo expect.]" 
	exit 1

fi
   else

   	echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
   	exit 0 
 fi

}

func_exec_cisco_3945() {

 if [[ "${chave_cisco_3945}" = "1" ]];  then
     
    if [[ "$1" != "" ]];   then     
     
        for c3945 in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C3945/,/END_C3945/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');    
	do sed s/HOST/"${c3945}"/ "${1}"  > "${c3945}".tcl ; chmod 700 ./"${c3945}".tcl ; ./"${c3945}".tcl >> strace.txt ; rm -rf "${c3945}".tcl
	done
   else 
   
	echo "[Aponte o arquivo expect.]" 
	exit 1

fi
   else

   	echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
	exit 0 
 fi

}

func_exec_cisco_3850() {

 if [[ "${chave_cisco_3850}" = "1" ]]; 	  then
     
    if [[ "$1" != "" ]];  then     

        for c3850 in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C3850/,/END_C3850/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');    
 	do sed s/HOST/"${c3850}"/ "${1}"  > "${c3850}".tcl ; chmod 700 ./"${c3850}".tcl ; ./"${c3850}".tcl >> strace.txt ; rm -rf "${c3850}".tcl
	done
   else 
   
	echo "[Aponte o arquivo expect.]" 
	exit 1

fi
   else

   	echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
   	exit 0 
 fi

}

func_exec_cisco_3750() {

 if [[ "${chave_cisco_3750}" = "1" ]];  then
     
    if [[ "$1" != "" ]];   then     

        for c3750 in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C3750/,/END_C3750/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');    
	do sed s/HOST/"${c3750}"/ "${1}"  > "${c3750}".tcl ; chmod 700 ./"${c3750}".tcl ; ./"${c3750}".tcl >> strace.txt ; rm -rf "${c3750}".tcl
	done
   else 
   
	echo "[Aponte o arquivo expect.]" 
	exit 1

fi
   else

  	echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
  	exit 0 
 fi

}

func_exec_cisco_3662() {

 if [[ "${chave_cisco_3662}" = "1" ]];  then
     
    if [[ "$1" != "" ]];  then     

        for c3662 in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C3662/,/END_C3662/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');    
 	do sed s/HOST/"${c3662}"/ "${1}"  > "${c3662}".tcl ; chmod 700 ./"${c3662}".tcl ; ./"${c3662}".tcl >> strace.txt ; rm -rf "${c3662}".tcl
	done
   else 
   
	echo "[Aponte o arquivo expect.]" 
	exit 1

fi
   else

   	echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
   	exit 0
 fi

}

func_exec_cisco_3560() {

 if [[ "${chave_cisco_3560}" = "1" ]];   then
     
    if [[ "$1" != "" ]];   then     

        for c3560 in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C3560/,/END_C3560/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');    
	do sed s/HOST/"${c3560}"/ "${1}"  > "${c3560}".tcl ; chmod 700 ./"${c3560}".tcl ; ./"${c3560}".tcl >> strace.txt ; rm -rf "${c3560}".tcl
	done
  else 
   
	echo "[Aponte o arquivo expect.]" 
	exit 1

fi
   else

  	echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
	exit 0
 fi

}

func_exec_cisco_2950() {

 if [[ "${chave_cisco_2950}" = "1" ]];  then
     
    if [[ "$1" != "" ]];  then

        for c2950 in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C2950/,/END_C2950/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');    
 	do sed s/HOST/"${c2950}"/ "${1}"  > "${c2950}".tcl ; chmod 700 ./"${c2950}".tcl ; ./"${c2950}".tcl >> strace.txt ; rm -rf "${c2950}".tcl
	done
  else 
   
	echo "[Aponte o arquivo expect.]" 
	exit 1

fi
   else

  	echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
  	exit 0
 fi

}

func_exec_cisco_2924() {

 if [[ "${chave_cisco_2924}" = "1" ]];   then
     
    if [[ "$1" != "" ]];   then

        for c2924 in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C2924/,/END_C2924/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');    
 	do sed s/HOST/"${c2924}"/ "${1}"  > "${c2924}".tcl ; chmod 700 ./"${c2924}".tcl ; ./"${c2924}".tcl >> strace.txt ; rm -rf "${c2924}".tcl
	done
   else 
   
	echo "[Aponte o arquivo expect.]" 
	exit 1

fi
   else

   	echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
	exit 0
 fi

}

func_exec_cisco_2921() {

 if [[ "${chave_cisco_2921}" = "1" ]];   then
     
    if [[ "$1" != "" ]];  then     	

        for c2921 in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C2921/,/END_C2921/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');    
 	do sed s/HOST/"${c2921}"/ "${1}"  > "${c2921}".tcl ; chmod 700 ./"${c2921}".tcl ; ./"${c2921}".tcl >> strace.txt ; rm -rf "${c2921}".tcl
	done
   else 
   
	echo "[Aponte o arquivo expect.]" 
        exit 1

fi
   else

  	echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
	exit 0 
 fi

}

func_exec_cisco_2821() {

 if [[ "${chave_cisco_2821}" = "1" ]];   then
     
    if [[ "$1" != "" ]];   then     	   

        for c2821 in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C2821/,/END_C2821/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');    
	do sed s/HOST/"${c2821}"/ "${1}"  > "${c2821}".tcl ; chmod 700 ./"${c2821}".tcl ; ./"${c2821}".tcl >> strace.txt ; rm -rf "${c2821}".tcl
	done
   else 
   
	echo "[Aponte o arquivo expect.]" 
	exit 1

fi
   else

   	echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
	exit 0
 fi

}

func_exec_cisco_2811VE() {

 if [[ "${chave_cisco_2811ve}" = "1" ]];   then
     
    if [[ "$1" != "" ]];  then     	        

        for c2811ve in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C2811VE/,/END_C2811VE/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');    
 	do sed s/HOST/"${c2811ve}"/ "${1}"  > "${c2811ve}".tcl ; chmod 700 ./"${c2811ve}".tcl ; ./"${c2811ve}".tcl >> strace.txt ; rm -rf "${c2811ve}".tcl
	done
   else 
   
	echo "[Aponte o arquivo expect.]" 
	exit 1

fi
   else

   	echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
   	exit 0 
 fi

}

func_exec_cisco_2621() {


 if [[ "${chave_cisco_2621}" = "1" ]];   then
     
if [[ "$1" != "" ]];   then     	   

        for c2621 in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C2621/,/END_C2621/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');   
 	do sed s/HOST/"${c2621}"/ "${1}"  > "${c2621}".tcl ; chmod 700 ./"${c2621}".tcl ; ./"${c2621}".tcl >> strace.txt ; rm -rf "${c2621}".tcl
	done
  else 
   
	echo "[Aponte o arquivo expect.]" 
	exit 1

fi
   else

   	echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
   	exit 0 
 fi

}

func_exec_cisco_2511() {


 if [[ "${chave_cisco_2511}" = "1" ]];   then
     
    if [[ "$1" != "" ]];   then 
     
      
        for c2511 in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C2511/,/END_C2511/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');   
	do sed s/HOST/"${c2511}"/ "${1}"  > "${c2511}".tcl ; chmod 700 ./"${c2511}".tcl ; ./"${c2511}".tcl >> strace.txt ; rm -rf "${c2511}".tcl
	done
   else 
   
	echo "[Aponte o arquivo expect.]" 
        exit 1

fi
   else
     
	echo "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
	exit 0
fi

}

func_exec_cisco_2960() {


 if [[ "${chave_cisco_2960}" = "1" ]];   then
  
    if [[ "$1" != "" ]];   then       	

        for c2960 in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C2960/,/END_C2960/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');   
 	do sed s/HOST/"${c2960}"/ "${1}"  > "${c2960}".tcl ; chmod 700 ./"${c2960}".tcl ; ./"${c2960}".tcl >> strace.txt ; rm -rf "${c2960}".tcl
	done
  else 
   
	echo "[Aponte o arquivo expect.]" 
        exit 1 

fi 
   else

   	echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
   	exit 0 
 fi

}

func_exec_cisco_1120() {


 if [[ "${chave_cisco_1120}" = "1" ]];   then
 
    if [[ "$1" != "" ]];   then      	
      
        for c1120 in  $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C1120/,/END_C1120/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');    
 	do sed s/HOST/"${c1120}"/ "${1}"  > "${c1120}".tcl ; chmod 700 ./"${c1120}".tcl ; ./"${c1120}".tcl >> strace.txt ; rm -rf "${c1120}".tcl
	done
   else 
   
	echo "[Aponte o arquivo expect.]" 
	exit 1 

fi    
   else

   	echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
	exit 0
 fi

}

func_exec_cisco_2801() {


 if [[ "${chave_cisco_2801}" = "1" ]];    then
    
     if [[ "$1" != "" ]];   then   	

        for c2801 in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C2801/,/END_C2801/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');    
 	do sed s/HOST/"${c2801}"/ "${1}"  > "${c2801}".tcl ; chmod 700 ./"${c2801}".tcl ; ./"${c2801}".tcl >> strace.txt ; rm -rf "${c2801}".tcl
	done
   else 
   
	echo "[Aponte o arquivo expect.]" 
	exit 1 

fi    
   else

    	echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
    	exit 0
 fi

}

func_exec_cisco_1760() {


 if [[ "${chave_cisco_1760}" = "1" ]];   then
     
    if [[ "$1" != "" ]]; then
     

        for c1760 in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C1760/,/END_C1760/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');   
 	do sed s/HOST/"${c1760}"/ "${1}"  > "${c1760}".tcl ; chmod 700 ./"${c1760}".tcl ; ./"${c1760}".tcl >> strace.txt ; rm -rf "${c1760}".tcl
	done
   else 
   
	echo "[Aponte o arquivo expect.]" 
	exit 1

fi    
   else

    	echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
    	exit 0
 fi

}

func_exec_cisco_1941() {


 if [[ "${chave_cisco_1941}" = "1" ]];  then
     
    if [[ "$1" != "" ]]; then	   
 
        for c1941 in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_C1941/,/END_C1941/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');   
 	do sed s/HOST/"${c1941}"/ "${1}"  > "${c1941}".tcl ; chmod 700 ./"${c1941}".tcl ; ./"${c1941}".tcl >> strace.txt ; rm -rf "${c1941}".tcl
	done
   else 
   
	echo "[Aponte o arquivo expect.]" 
        exit 1 

fi    
   else

   	echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
   	exit 0 
 fi

}

func_exec_datacom_dm1200e() {


 if [[ "${chave_datacom_dm_1200e}" = "1" ]];   then
     
    if [[ "$1" != "" ]];  then      	     

        for var_dm_1200e in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_DM1200E/,/END_DM1200E/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');    
 	do sed s/HOST/"${var_dm_1200e}"/ "${1}"  > "${var_dm_1200e}".tcl ; 
	chmod 700 ./"${var_dm_1200e}".tcl ; ./"${var_dm_1200e}".tcl >> strace.txt ; rm -rf "${var_dm_1200e}".tcl
	done
   else 
   
	echo "[Aponte o arquivo expect.]" 
	exit 1

fi    
   else

   	echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
   	exit 0
 fi

}

func_exec_dlink_dgs-1510() {

 if [[ "${chave_dlink_dgs_1510}" = "1" ]];  then
     
    if [[ "$1" != "" ]];   then      	

        for cdgs_1510 in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_DGS1510/,/END_DGS1510/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');     
 	do sed s/HOST/"${cdgs_1510}"/ "${1}"  > "${cdgs_1510}".tcl ; chmod 700 ./"${cdgs_1510}".tcl ; ./"${cdgs_1510}".tcl >> strace.txt ; rm -rf "${cdgs_1510}".tcl
	done
   else 
   
	echo "[Aponte o arquivo expect.]" 
	exit 1 

fi    
   else

   	 echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
   	 exit 0 
 fi

}

func_exec_cisco_sf300() {

if [[ "${chave_cisco_sf300}" = "1" ]];  then
     
    if [[ "$1" != "" ]];  then      	
     
     
        for var_csf300 in $(cat < /etc/hosts | awk '{print $2}' | sed -n '/BEGIN_CSF300/,/END_CSF300/p' | grep -E -v '^([[:space:]]*$|BEGIN|END)');    
 	do sed s/HOST/"${var_csf300}"/ "${1}"  > "${var_csf300}".tcl ; chmod 700 ./"${var_csf300}".tcl ; ./"${var_csf300}".tcl >> strace.txt ; rm -rf "${var_csf300}".tcl
	done
   else 
   
	echo "[Aponte o arquivo expect.]" 
	exit 1 

fi    
   else

 	echo  "[Esta função está desativada.] | ${dia}-${mes}-${ano}"
 	exit 0

  fi

}

func_exec_help() {

cat   <<  EOF

Uso: ${0} [OPÇÃO]

Opções Válidas:


	-V, --version   Exibir Versão da Ferramenta

	-h, --help      Exibir menu de Ajuda 

	--exec_c2960      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 2960

	--exec_c1120      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 1120 

	--exec_c1760      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 1760 

	--exec_c1941      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 1941

	--exec_c2501      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 2501

	--exec_c2511      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 2511 

	--exec_c2621      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 2621  

	--exec_c2801      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 2801 

	--exec_c2811VE    arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 2811VE  

	--exec_c2821      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 2821

	--exec_c2921      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 2921 

	--exec_c2924      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 2924 
	
	--exec_c2950      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 2950 

	--exec_c3560      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 3560  

	--exec_c3662      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 3662 

	--exec_c3750      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 3750 

	--exec_c3850      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 3850  

	--exec_c3945      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 3945  

	--exec_c4321      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 3321  

	--exec_c4331      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 4331  

	--exec_c4503      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 4503  

	--exec_c4506      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 4506 

	--exec_c4507      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 4507

	--exec_c6509      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 6509 

	--exec_c6513      arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco 6513 

	--exec_casr-1002  arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco asr-1002

	--exec_casr-1006  arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco asr-1006

	--exec_casr-903   arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco asr-903 

	--exec_ccgr-2010  arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco cgr-2010 

	--exec_ccgs-2520  arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco cgs-2520 

	--exec_cgrwic     arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco grwic 

	--exec_cie-3000   arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco ie-3000 

	--exec_cmc4810    arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco mc4810

	--exec_cnexus     arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco nexus

	--exec_dm1200e    arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da datacom 1200e 

	--exec_dgs-1510   arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da dlink dgs-1510

	--exec_csf300     arquivo_de_lote.tcl     Executa comandos em todos os equipamentos da cisco sf300

	--exec_teste      arquivo_de_lote.tcl     Executa comandos em teste para todos os equipamentos da rede

	--exec_all_cisco  arquivo_de_lote.tcl     Executa comandos em todos os equipamentos cisco

EOF

}


if [[ $# -ne 1 && $# -ne 2 ]]; then
    echo "Quantidade inválida de argumentos."
    exit 1
           
elif [[ "$1" == "-h" ]]; then
    func_exec_help
    exit $?

elif [[ "$1" == "--help" ]]; then
    func_exec_help
    exit $?

elif [[ "$1" == "-V" ]]; then
    echo "Versão:$version"
    exit $?    
    
elif [[ "$1" == "--version" ]]; then
    echo "Versão:$version"
    exit $?        
                
elif [[ "$1" == "--exec_teste" ]]; then
    func_exec_teste "$2"
    exit $?
    
elif [[ "$1" == "--exec_c2501" ]]; then
    func_exec_cisco_2501 "$2"
    exit $?

elif [[ "$1" == "--exec_c2960" ]]; then
    func_exec_cisco_2960 "$2"
    exit $?
    
elif [[ "$1" == "--exec_dm1200e" ]]; then
    func_exec_datacom_dm1200e "$2"
    exit $?
    
elif [[ "$1" == "--exec_dgs-1510" ]]; then
    func_exec_dlink_dgs_1510 "$2"
    exit $?

elif [[ "$1" == "--exec_c1120" ]]; then
    func_exec_cisco_1120 "$2"
    exit $?
    
elif [[ "$1" == "--exec_c1760" ]]; then
    func_exec_cisco_1760 "$2"
    exit $?
    
elif [[ "$1" == "--exec_c1941" ]]; then
    func_exec_cisco_1941 "$2"
    exit $?    

elif [[ "$1" == "--exec_c2511" ]]; then
    func_exec_cisco_2511 "$2"
    exit $?
    
elif [[ "$1" == "--exec_c2621" ]]; then
    func_exec_cisco_2621 "$2"
    exit $?    

elif [[ "$1" == "--exec_c2801" ]]; then
    func_exec_cisco_2801 "$2"
    exit $?    
    
elif [[ "$1" == "--exec_c2811VE" ]]; then
    func_exec_cisco_2811VE "$2"
    exit $?    
    
elif [[ "$1" == "--exec_c2821" ]]; then
    func_exec_cisco_2821 "$2"
    exit $?    
    
elif [[ "$1" == "--exec_c2921" ]]; then
    func_exec_cisco_2921 "$2"
    exit $?    
    
elif [[ "$1" == "--exec_c2924" ]]; then
    func_exec_cisco_2924 "$2"
    exit $?    
    
elif [[ "$1" == "--exec_c2950" ]]; then
    func_exec_cisco_2950 "$2"
    exit $?
    
elif [[ "$1" == "--exec_c3560" ]]; then
    func_exec_cisco_3560 "$2"
    exit $?
  
elif [[ "$1" == "--exec_c3662" ]]; then
    func_exec_cisco_3662 "$2"
    exit $?

elif [[ "$1" == "--exec_c3750" ]]; then
    func_exec_cisco_3750 "$2"
    exit $?
    
elif [[ "$1" == "--exec_c3850" ]]; then
    func_exec_cisco_3850 "$2"
    exit $? 
    
elif [[ "$1" == "--exec_c3945" ]]; then
     func_exec_cisco_3945 "$2"
    exit $?    
    
elif [[ "$1" == "--exec_c4321" ]]; then
    func_exec_cisco_4321 "$2"
    exit $?   
    
elif [[ "$1" == "--exec_c4331" ]]; then
    func_exec_cisco_4331 "$2"
    exit $?    

elif [[ "$1" == "--exec_c4503" ]]; then
     func_exec_cisco_4503 "$2"
    exit $?    
    
elif [[ "$1" == "--exec_c4506" ]]; then
    func_exec_cisco_4506 "$2"
    exit $?    

elif [[ "$1" == "--exec_c4507" ]]; then
    func_exec_cisco_4507 "$2"
    exit $?        

elif [[ "$1" == "--exec_c6509" ]]; then
    func_exec_cisco_6509 "$2"
    exit $?      

elif [[ "$1" == "--exec_c6513" ]]; then
    func_exec_cisco_6513 "$2"
    exit $?      

elif [[ "$1" == "--exec_casr-1002" ]]; then
    func_exec_cisco_asr_1002 "$2"
    exit $?  

elif [[ "$1" == "--exec_casr-1006" ]]; then
    func_exec_cisco_asr_1006 "$2"
    exit $?
    
elif [[ "$1" == "--exec_casr-903" ]]; then
    func_exec_cisco_asr_903 "$2"
    exit $?

elif [[ "$1" == "--exec_ccgr-2010" ]]; then
    func_exec_cisco_cgr_2010 "$2"
    exit $?
    
elif [[ "$1" == "--exec_ccgs-2520" ]]; then
    func_exec_cisco_cgs_2520 "$2"
    exit $?

elif [[ "$1" == "--exec_cgrwic" ]]; then
    func_exec_cisco_grwic "$2"
    exit $?

elif [[ "$1" == "--exec_cie-3000" ]]; then
    func_exec_cisco_ie_3000 "$2"
    exit $?
    
elif [[ "$1" == "--exec_cmc4810" ]]; then
    func_exec_cisco_cmc4810 "$2"
    exit $?
    
elif [[ "$1" == "--exec_cnexus" ]]; then
    func_exec_cisco_nexus "$2"
    exit $?

elif [[ "$1" == "--exec_csf300" ]]; then
    func_exec_cisco_sf300 "$2"
    exit $?
    
elif [[ "$1" == "--exec_all_cisco" ]]; then
    func_exec_all_cisco "$2"
    exit $?      
else
    echo "[Esta opção não é válida, verifique as opções em ajuda: -h, --help]"
    exit 1
fi 
