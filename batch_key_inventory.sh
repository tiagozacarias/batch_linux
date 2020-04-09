#!/usr/bin/env bash
# Autor : Tiago Eduardo Zacarias
# Versão: 1.0.0
# Data: 25-03-2020
# Licença: GPLv3

# Variáveis
dia="$(date +%d)"
mes="$(date +%m)"
ano="$(date +%Y)"
version="1.0.0"

# Variáveis de chaves: opcões 0/1 | Desativado/Ativado
chave_all_cisco="1"
chave_cisco_2501="1"
chave_cisco_nexus="1"
chave_cisco_mc3810="1"
chave_cisco_ie_3000="1"
chave_cisco_grwic="1"
chave_cisco_cgs_2520="1"
chave_cisco_cgr_2010="1"
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
# Pendente implementar paralelismo nos processos.

# Funções


func_exec_inventory () {

 if [[ "$chave" = "1" ]] ; then
     
   if [[ "$1" != "" ]]; then
  	
  	for hosts in $(cat < /etc/hosts | sed -n '/BEGIN_'"$model"'/,/END_'"$model"'/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');    
	do sed s/HOST/"${hosts}"/ "${1}"  > "${hosts}".tcl ; chmod 700 ./"${hosts}".tcl ; ./"${hosts}".tcl | tee inventory.log ;  rm -rf "${hosts}".tcl;
		
		version="$(cat < inventory.log | grep -E -o -m 1  "\".*\"" | grep -E -o "c.*bin")"
		chassi="$(cat < inventory.log | grep -E -o -m 1 "((CISCO|Cisco[[:space:]])[0-9]{4}|WS-C[0-9]{4}[A-Z]?[0-9,+]?[0-9]?.[0-8]{1,2}[A-Z]{1,3}-[A-Z])")"
		uptime="$(cat < inventory.log | grep -E -o -m 1 "uptime[[:space:]]{1}is\s{1}[0-9]{0,10}.(minutes|hour|hours|day|days|week|weeks|year|yars)")"
		memory_size_total_kbytes="$(cat < inventory.log | grep -E -o -m 1 "[0-9]{5,9}K" | grep -E -o -m1 "[0-9]{5,9}")"
	
	if [[ $memory_size_total_kbytes = "" ]]; then
	
	echo "Host:"$hosts" Sistema:Sem Info Memoria Total:Sem Info Flash Total:Sem Info Flash Livre:Sem Info Chassi:Sem Info  Uptime:Sem Info"  >> ./inventory.txt
	echo "#-------------------------------------------------------------------------------------------------------------------------------------------------------#"                >> ./inventory.txt
	echo "" >> ./inventory.txt
	
	else

		memory_size_total_Mbytes="$(($memory_size_total_kbytes/1024))"

	fi


		flash_size_free_bytes="$(cat < inventory.log | grep -E -o -m 5 "\([0-9]{6,}" | grep -E -o -m1 "[0-9]{6,}")"


	 if [[ $flash_size_free_bytes = "" ]]; then

        continue

        else

                flash_size_free_Mbytes="$(($flash_size_free_bytes/1024000))"
        
        fi      



		flash_size_total_bytes="$(cat < inventory.log | grep -E -o -m 1 "^[0-9]{8,}")"

	if [[ $flash_size_total_bytes = "" ]]; then

	continue

        else

		flash_size_total_Mbytes="$(($flash_size_total_bytes/1024000))"
	
	fi	
	
	echo "Host:"$hosts" | Sistema:"$version""  >> ./inventory.txt
        echo "Host:"$hosts" | Mem Total:"$memory_size_total_Mbytes"MB | Flash Total:"$flash_size_total_Mbytes"MB Flash Livre:"$flash_size_free_Mbytes"MB Chassi:"$chassi" | Uptime:"$uptime""  >> ./inventory.txt	
	echo "#-------------------------------------------------------------------------------------------------------------------------------------------------------#" 		>> ./inventory.txt
	echo "" >> ./inventory.txt

	done
   
    else 

	echo -e "\033[0;31m[Aponte o arquivo expect | ${dia}-${mes}-${ano}]\033[0m"
	exit 1
fi 
    else
    	
    	echo -e "\033[0;32m[Esta função está desativada | ${dia}-${mes}-${ano}]\033[0m"
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

if [[ $# = 0  ]]; then
    echo -e "\033[0;36m[Você precisa informar uma opção válida]: --help ou -h para exibir opções\033[0m"
    exit 1

elif [[ $# -ne 1 && $# -ne 2 ]]; then
    echo -e "\033[0;36m[Quantidade inválida de argumentos]\033[0m"
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
    chave="$chave_teste"
    model="TESTE"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?
    
elif [[ "$1" == "--exec_c2501" ]]; then
    chave="$chave_cisco_2501"
    model="C2501"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?

elif [[ "$1" == "--exec_c2960" ]]; then
    chave="$chave_cisco_2960"
    model="C2960"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?
    
elif [[ "$1" == "--exec_dm1200e" ]]; then
    chave="$chave_datacom_dm_1200e"
    model="DM1200E"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?
    
elif [[ "$1" == "--exec_dgs-1510" ]]; then
    chave="$chave_dlink_dgs_1510"
    model="DGS1510"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?

elif [[ "$1" == "--exec_c1120" ]]; then
    chave="$chave_cisco_1120"
    model="C1120"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?
    
elif [[ "$1" == "--exec_c1760" ]]; then
    chave="$chave_cisco_1760"
    model="C1760"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?
    
elif [[ "$1" == "--exec_c1941" ]]; then
    chave="$chave_cisco_1941"
    model="C1941"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?    

elif [[ "$1" == "--exec_c2511" ]]; then
    chave="$chave_cisco_2511"
    model="C2511"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?
    
elif [[ "$1" == "--exec_c2621" ]]; then
    chave="$chave_cisco_2621"
    model="C2621"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?    

elif [[ "$1" == "--exec_c2801" ]]; then
    chave="$chave_cisco_2801"
    model="C2801"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?    
    
elif [[ "$1" == "--exec_c2811VE" ]]; then
    chave="$chave_cisco_2811ve"
    model="C2801"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?    
    
elif [[ "$1" == "--exec_c2821" ]]; then
    chave="$chave_cisco_2821"
    model="C2821"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?    
    
elif [[ "$1" == "--exec_c2921" ]]; then
    chave="$chave_cisco_2921"
    model="C2921"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?    
    
elif [[ "$1" == "--exec_c2924" ]]; then
    chave="$chave_cisco_2924"
    model="C2924"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?    
    
elif [[ "$1" == "--exec_c2950" ]]; then
    chave="$chave_cisco_2950"
    model="C2950"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?
    
elif [[ "$1" == "--exec_c3560" ]]; then
    chave="$chave_cisco_3560"
    model="C3560"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?
  
elif [[ "$1" == "--exec_c3662" ]]; then
    chave="$chave_cisco_3662"
    model="C3662"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?

elif [[ "$1" == "--exec_c3750" ]]; then
    chave="$chave_cisco_3750"
    model="C3750"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?
    
elif [[ "$1" == "--exec_c3850" ]]; then
    chave="$chave_cisco_3850"
    model="C3850"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $? 
    
elif [[ "$1" == "--exec_c3945" ]]; then
    chave="$chave_cisco_3945"
    model="C3945"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?    
    
elif [[ "$1" == "--exec_c4321" ]]; then
    chave="$chave_cisco_4321"
    model="C4321"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?   
    
elif [[ "$1" == "--exec_c4331" ]]; then
    chave="$chave_cisco_4331"
    model="C4331"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?    

elif [[ "$1" == "--exec_c4503" ]]; then
    chave="$chave_cisco_4503"
    model="C4503"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?    
    
elif [[ "$1" == "--exec_c4506" ]]; then
    chave="$chave_cisco_4506"
    model="C4506"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?    

elif [[ "$1" == "--exec_c4507" ]]; then
    chave="$chave_cisco_4507"
    model="C4507"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?        

elif [[ "$1" == "--exec_c6509" ]]; then
    chave="$chave_cisco_6509"
    model="C6509"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?      

elif [[ "$1" == "--exec_c6513" ]]; then
    chave="$chave_cisco_6513"
    model="C6513"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?      

elif [[ "$1" == "--exec_casr-1002" ]]; then
    chave="$chave_cisco_asr_1002"
    model="CASR1002"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?  

elif [[ "$1" == "--exec_casr-1006" ]]; then
    chave="$chave_cisco_asr_1006"
    model="CASR1006"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?
    
elif [[ "$1" == "--exec_casr-903" ]]; then
    chave="$chave_cisco_asr_903"
    model="CASR903"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?

elif [[ "$1" == "--exec_ccgr-2010" ]]; then
    chave="$chave_cisco_cgr_2010"
    model="CCGR2010"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?
    
elif [[ "$1" == "--exec_ccgs-2520" ]]; then
    chave="$chave_cisco_cgs_2520"
    model="CCGS2520"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?

elif [[ "$1" == "--exec_cgrwic" ]]; then
    chave="$chave_cisco_grwic"
    model="CGRWIC"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?

elif [[ "$1" == "--exec_cie-3000" ]]; then
    chave="$chave_cisco_ie_3000"
    model="CIE3000"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?
    
elif [[ "$1" == "--exec_cmc4810" ]]; then
    chave="$chave_cisco_mc3810"
    model="CMC3810"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?
    
elif [[ "$1" == "--exec_cnexus" ]]; then
    chave="$chave_cisco_nexus"
    model="CNEXUS"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?

elif [[ "$1" == "--exec_csf300" ]]; then
    chave="$chave_cisco_sf300"
    model="CSF300"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?
    
elif [[ "$1" == "--exec_all_cisco" ]]; then
    chave="$chave_all_cisco"
    model="ALL_CISCO"
    echo "" > ./inventory.txt
    func_exec_inventory "$2"
    exit $?      
else
    echo -e "\033[0;36m[Esta opção não é válida, verifique as opções em ajuda: -h, --help]\033[0m"
    exit 1
fi 
