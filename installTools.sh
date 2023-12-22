#!/bin/bash

tools_directory="/home/jfg/Downloads/tools"

function ctrl_c(){
    echo -e "\nSaliendo...\n"
    tput cnorm && exit 1
}

function seclists(){
    cd $tools_directory
    if [ ! -d $tools_directory/SecLists ];then
        tput civis
        echo -e "\nClonamos el repositorio de Github\n"
        git clone https://github.com/danielmiessler/SecLists.git > /dev/null 2>&1
        tput cnorm
    fi
    if [ ! -d /usr/share/SecLists ];then
        echo -e "\nIntroduce la passwd de root, requiere permisos de sudo\n"
        sudo cp -r SecLists /usr/share
        echo -e "\nCopiado SecLists al /usr/share\n"
    else 
        echo -e "\nSecLists ya estaba descargado\n"
    fi
}

function subfinder(){
    cd $tools_directory
    if [ ! -d $tools_directory/subfinder ];then
        tput civis
        echo -e "\nClonando el repositorio de subfinder\n"
        git clone https://github.com/projectdiscovery/subfinder.git > /dev/null 2>&1
        echo -e "\nRepositorio de Subfinder ha sido clonado con exito\n"
        tput cnorm
    fi
    subfinder_directory="$tools_directory/subfinder/v2/cmd/subfinder"
    if [ ! -f $subfinder_directory/subfinder ];then
        cd $subfinder_directory
        echo -e "\nCompilando subfinder\n"
        sudo go build . > /dev/null 2>&1
        echo -e "\nSubfinder ha sido instalado con éxito\n"
        sudo cp -r subfinder /usr/bin
    fi
}

function wayback(){
    cd $tools_directory
    if [ ! -d $tools_directory/waybackurls ];then
        tput civis 
        echo -e "\nClonando el repositorio de waybackurls\n"
        git clone https://github.com/tomnomnom/waybackurls.git > /dev/null 2>&1
        echo -e "\nDirectorio Waybackurls clonado\n"
        tput cnorm
    fi
    if [ ! -f $tools_directory/waybackurls/waybackurls ];then
        cd $tools_directory/waybackurls
        sudo go build .
        sudo cp -r waybackurls /usr/bin
        echo -e "\nwaybackurls ha sido instalado con exito\n"
    else
        echo -e "\nwaybackurls ya estaba instalado previamente\n"
    fi
    
}

function amass(){
    cd $tools_directory
    echo -e "\nInstalando amass\n"
    sudo apt install amass -y > /dev/null 2>&1
    echo -e "\nAmass instalado con exito\n"
}

function httpx(){
    cd $tools_directory
    if [ ! -d $tools_directory/httpx ];then
        tput civis 
        echo -e "\nClonando el repositorio de httpx\n"
        git clone https://github.com/projectdiscovery/httpx.git > /dev/null 2>&1
        echo -e "\nDirectorio httpx clonado\n"
        tput cnorm
    fi
    httpx_directory="$tools_directory/httpx/cmd/httpx"
    if [ ! -f $subfinder_directory/httpx ];then
        cd $httpx_directory
        echo -e "\nCompilando httpx\n"
        sudo go build . > /dev/null 2>&1
        echo -e "\nhttpx ha sido instalado con éxito\n"
        sudo cp -r httpx /usr/bin
    fi
}


function anew(){
    cd $tools_directory
    if [ ! -d $tools_directory/anew ];then
        tput civis 
        echo -e "\nClonando el repositorio de anew\n"
        git clone https://github.com/tomnomnom/anew.git > /dev/null 2>&1
        echo -e "\nDirectorio anew clonado\n"
        tput cnorm
    fi
    if [ ! -f $tools_directory/anew/anew ];then
        cd $tools_directory/anew
        sudo go build .
        sudo cp anew /usr/bin
        echo -e "\n anew ha sido instalado con exito\n"
    else
        echo -e "\nanew ya estaba instalado previamente\n"
    fi    
}

function sublist3r(){
    cd $tools_directory
    if [ ! -d $tools_directory/Sublist3r ];then
        tput civis
        echo -e "\nClonamos el repositorio de sublist3r\n"
        git clone https://github.com/aboul3la/Sublist3r.git
        echo -e "\nRepositorio de Sublist3r ha sido clonado con exito\n"
        tput cnorm
    fi
    cd $tools_directory/Sublist3r
    #pip install -r requirements.txt        
}

function assetfinder(){
    sudo apt install assetfinder > /dev/null 2>&1
    echo -e "\nBinario assetfinder descargado con exito\n"
}

trap ctrl_c INT

echo -e "Instalamos go si no existe\n"
sudo apt install golang-go -y > /dev/null 2>&1
sudo apt install python3-pip -y > /dev/null 2>&1
seclists
subfinder
wayback
amass
httpx
anew
sublist3r # https://github.com/aboul3la/Sublist3r.git
assetfinder
