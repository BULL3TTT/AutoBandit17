#!/bin/bash

#Colores
greenColour="\e[0;32m\033[1m"
grayColour="\e[0;37m\033[1m"
endColour="\033[0m\e[0m"


echo -e "\n\n${greenColour}[!]${endColour}${grayColour} Realizando conexion...${endColour}\n\n" 

#Conexion ssh hacia Bandit16 
sshpass -p 'kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx' ssh bandit16@bandit.labs.overthewire.org -p 2220 << 'EOF'

#Colores dentro de ssh Bandit16
greenColour="\e[0;32m\033[1m"
grayColour="\e[0;37m\033[1m"
endColour="\033[0m\e[0m"

#Creacion de directorio temporal
cd "$(mktemp -d)" &&  echo -e "\n\n${greenColour}[!]${endColour}${grayColour} Escaneando puertos y mandando contraseña${endColour}\n\n"

#Ciclo for para escanear del puerto 31000 al 32000 
for port in $(seq 31000 32000); do 

#Envio de un string vacio hacia localhost y el puerto iterado redirijiendo el stdrr, ademas creando una conexion segura con netcat para enviar un hash a los puertos abiertos
(echo " " > /dev/tcp/127.0.0.1/$port) 2> /dev/null && echo "kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx" | ncat --ssl 127.0.0.1 $port >> id_rsa 
done

#Lectura de RSA Private Key tomando solamente las ultimas 28 lineas
echo -e "\n\n${greenColour}[!]${endColour}${grayColour} RSA Private Key obtenida${endColour}\n\n" && cat id_rsa | tail -n 28

#Copeando solamente las ultimas 28 lineas de RSA Private Key (id_rsa) hacia id_rsaC y ademas cambiando los permisos para lectura y escritura del usuario
tail -n 28 id_rsa > id_rsaC && chmod 600 id_rsaC
echo -e "\n\n${greenColour}[+]${endColour}${greyColour} Conectando a Bandit17...${endColour}\n\n"

#Conexion ssh con RSA Private Key hacia Bandit17 ignorando el fingerprint 
ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i id_rsaC bandit17@127.0.0.1 -p 2220 <<'EOF'

#Colores dentro de ssh Bandit17
grayColour="\e[0;37m\033[1m"
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"

#Lectura del archivo bandit17 dentro de las carpetas /etc/bandit_pass
echo -e "\n\n${greenColour}[!]${endColour}${grayColour} Obteniendo la contraseña...${endColour}\n\n\n${greenColour}[!]${endColour}${grayColour} La contraseña es:${endColour}" $(cat /etc/bandit_pass/bandit17)

#Fin de la ejecucion remota de comandos 
EOF

#Mentorias D4ZC
echo -e "${grayColour}\n\n\n\n\nScript by GriZzly${endColour}"
