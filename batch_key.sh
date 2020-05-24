#!/usr/bin/env bash
# Autor : Tiago Eduardo Zacarias
# Versão: 1.3.0
# Data: 25-03-2020
# Licença: GPLv3

# Variáveis
dia="$(date +%d)"
mes="$(date +%m)"
ano="$(date +%Y)"
version="1.3.0"

# Variáveis de chaves: opcões 0/1 | Desativado/Ativado
source ./var_chave.sh

#TODO
# Pendente implementar paralelismo nos processos.

# Funções

func_exec_all () {

 if [[ "$chave" = "1" ]] ; then
     
   if [[ "$1" != "" ]]; then
	
  	test -d tmp || mkdir -p tmp
  	for hosts in $(cat < /etc/hosts | sed -n '/BEGIN_'"$model"'/,/END_'"$model"'/p' | grep -E -v '^([[:space:]]*$|BEGIN|END|#)' |  awk '{print $2}');    
	do sed s/HOST/"${hosts}"/ "${1}"  > tmp/"${hosts}".tcl ; chmod 700 tmp/"${hosts}".tcl ; tmp/"${hosts}".tcl | tee -a  strace.log ; rm -rf tmp/"${hosts}".tcl
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
    func_exec_all "$2"
    exit $?
    
elif [[ "$1" == "--exec_c2501" ]]; then
    chave="$chave_cisco_2501"
    model="C2501"
    func_exec_all "$2"
    exit $?

elif [[ "$1" == "--exec_c2960" ]]; then
    chave="$chave_cisco_2960"
    model="C2960"
    func_exec_all "$2"
    exit $?
    
elif [[ "$1" == "--exec_dm1200e" ]]; then
    chave="$chave_datacom_dm_1200e"
    model="DM1200E"
    func_exec_all "$2"
    exit $?
    
elif [[ "$1" == "--exec_dgs-1510" ]]; then
    chave="$chave_dlink_dgs_1510"
    model="DGS1510"
    func_exec_all "$2"
    exit $?

elif [[ "$1" == "--exec_c1120" ]]; then
    chave="$chave_cisco_1120"
    model="C1120"
    func_exec_all "$2"
    exit $?
    
elif [[ "$1" == "--exec_c1760" ]]; then
    chave="$chave_cisco_1760"
    model="C1760"
    func_exec_all "$2"
    exit $?
    
elif [[ "$1" == "--exec_c1941" ]]; then
    chave="$chave_cisco_1941"
    model="C1941"
    func_exec_all "$2"
    exit $?    

elif [[ "$1" == "--exec_c2511" ]]; then
    chave="$chave_cisco_2511"
    model="C2511"
    func_exec_all "$2"
    exit $?
    
elif [[ "$1" == "--exec_c2621" ]]; then
    chave="$chave_cisco_2621"
    model="C2621"
    func_exec_all "$2"
    exit $?    

elif [[ "$1" == "--exec_c2801" ]]; then
    chave="$chave_cisco_2801"
    model="C2801"
    func_exec_all "$2"
    exit $?    
    
elif [[ "$1" == "--exec_c2811VE" ]]; then
    chave="$chave_cisco_2811ve"
    model="C2811VE"
    func_exec_all "$2"
    exit $?    
    
elif [[ "$1" == "--exec_c2821" ]]; then
    chave="$chave_cisco_2821"
    model="C2821"
    func_exec_all "$2"
    exit $?    
    
elif [[ "$1" == "--exec_c2921" ]]; then
    chave="$chave_cisco_2921"
    model="C2921"
    func_exec_all "$2"
    exit $?    
    
elif [[ "$1" == "--exec_c2924" ]]; then
    chave="$chave_cisco_2924"
    model="C2924"
    func_exec_all "$2"
    exit $?    
    
elif [[ "$1" == "--exec_c2950" ]]; then
    chave="$chave_cisco_2950"
    model="C2950"
    func_exec_all "$2"
    exit $?
    
elif [[ "$1" == "--exec_c3560" ]]; then
    chave="$chave_cisco_3560"
    model="C3560"
    func_exec_all "$2"
    exit $?
  
elif [[ "$1" == "--exec_c3662" ]]; then
    chave="$chave_cisco_3662"
    model="C3662"
    func_exec_all "$2"
    exit $?

elif [[ "$1" == "--exec_c3750" ]]; then
    chave="$chave_cisco_3750"
    model="C3750"
    func_exec_all "$2"
    exit $?
    
elif [[ "$1" == "--exec_c3850" ]]; then
    chave="$chave_cisco_3850"
    model="C3850"
    func_exec_all "$2"
    exit $? 
    
elif [[ "$1" == "--exec_c3945" ]]; then
    chave="$chave_cisco_3945"
    model="C3945"
    func_exec_all "$2"
    exit $?    
    
elif [[ "$1" == "--exec_c4321" ]]; then
    chave="$chave_cisco_4321"
    model="C4321"
    func_exec_all "$2"
    exit $?   
    
elif [[ "$1" == "--exec_c4331" ]]; then
    chave="$chave_cisco_4331"
    model="C4331"
    func_exec_all "$2"
    exit $?    

elif [[ "$1" == "--exec_c4503" ]]; then
    chave="$chave_cisco_4503"
    model="C4503"
    func_exec_all "$2"
    exit $?    
    
elif [[ "$1" == "--exec_c4506" ]]; then
    chave="$chave_cisco_4506"
    model="C4506"
    func_exec_all "$2"
    exit $?    

elif [[ "$1" == "--exec_c4507" ]]; then
    chave="$chave_cisco_4507"
    model="C4507"
    func_exec_all "$2"
    exit $?        

elif [[ "$1" == "--exec_c6509" ]]; then
    chave="$chave_cisco_6509"
    model="C6509"
    func_exec_all "$2"
    exit $?      

elif [[ "$1" == "--exec_c6513" ]]; then
    chave="$chave_cisco_6513"
    model="C6513"
    func_exec_all "$2"
    exit $?      

elif [[ "$1" == "--exec_casr-1002" ]]; then
    chave="$chave_cisco_asr_1002"
    model="CASR1002"
    func_exec_all "$2"
    exit $?  

elif [[ "$1" == "--exec_casr-1006" ]]; then
    chave="$chave_cisco_asr_1006"
    model="CASR1006"
    func_exec_all "$2"
    exit $?
    
elif [[ "$1" == "--exec_casr-903" ]]; then
    chave="$chave_cisco_asr_903"
    model="CASR903"
    func_exec_all "$2"
    exit $?

elif [[ "$1" == "--exec_ccgr-2010" ]]; then
    chave="$chave_cisco_cgr_2010"
    model="CCGR2010"
    func_exec_all "$2"
    exit $?
    
elif [[ "$1" == "--exec_ccgs-2520" ]]; then
    chave="$chave_cisco_cgs_2520"
    model="CCGS2520"
    func_exec_all "$2"
    exit $?

elif [[ "$1" == "--exec_cgrwic" ]]; then
    chave="$chave_cisco_grwic"
    model="CGRWIC"
    func_exec_all "$2"
    exit $?

elif [[ "$1" == "--exec_cie-3000" ]]; then
    chave="$chave_cisco_ie_3000"
    model="CIE3000"
    func_exec_all "$2"
    exit $?
    
elif [[ "$1" == "--exec_cmc4810" ]]; then
    chave="$chave_cisco_mc3810"
    model="CMC3810"
    func_exec_all "$2"
    exit $?
    
elif [[ "$1" == "--exec_cnexus" ]]; then
    chave="$chave_cisco_nexus"
    model="CNEXUS"
    func_exec_all "$2"
    exit $?

elif [[ "$1" == "--exec_csf300" ]]; then
    chave="$chave_cisco_sf300"
    model="CSF300"
    func_exec_all "$2"
    exit $?
    
elif [[ "$1" == "--exec_all_cisco" ]]; then
    chave="$chave_all_cisco"
    model="ALL_CISCO"
    func_exec_all "$2"
    exit $?      
else
    echo -e "\033[0;36m[Esta opção não é válida, verifique as opções em ajuda: -h, --help]\033[0m"
    exit 1
fi 
