#!/bin/bash
#
# SETSMS: ISHSHELL IOS
#
# Variables y Colores
#
PWD=$(pwd)
OS=$(uname -o)
USER=$(id -u)
verde='\033[32m'
blanco='\033[37m'
rojo='\033[31m'
azul='\033[34m'
negro='\033[0;30m'
rosa='\033[38;5;207m'
amarillo='\033[33m'
morado='\033[35m'
cian='\033[1;36m'
magenta='\033[1;35m'
#
# Dependencias del Script
#
function Dependencies {

	echo -e ${rojo}"Ejecutar: 1"
	echo -e "Instalar: 2"
	echo -e "Nota: Si no funciona desinstale y vuelva a instalar"
	echo -e -n ""${blanco}
	read -r INSTALACION
	echo -e -n ""${negro}
	
	if [[ ${INSTALACION} == 1 || ${INSTALACION} == 01 ]]; then
	
	echo -e ${rojo}"Iniciando..."${negro}	
	elif [[ ${INSTALACION} == 2 || ${INSTALACION} == 02 ]]; then
	
		echo -e -n ""${blanco}
		#Instalacion de python
		apk update && apk upgrade
		apk add python3
		apk add py3-pip
		
		#quack
		RUTA=$(pwd)
		unzip quack.zip
		rm quack.zip
		cd ${RUTA}/quack
		python3 -m pip install -r requirements.txt
		cd ${RUTA}
		
		#Impulse
		RUTA=$(pwd)
		unzip Impulse.zip
		rm Impulse.zip
		cd ${RUTA}/Impulse
		python3 -m pip install -r requirements.txt
		cd ${RUTA}		
		echo -e -n ""${negro}
	else
	echo -e ${rojo}"Saludos!!"${blanco}
	exit
	fi
}
#
# Mensaje de Opción Incorrecta
#
function Error {
echo -e "${rojo}
┌═════════════════════┐
█ ${blanco}¡OPCIÓN INCORRECTA! ${rojo}█
└═════════════════════┘
"${blanco}
sleep 0.5
}
#
# Banner SETSMS
#
function SETSMS {
	sleep 0.5
echo -e "${verde}
███████╗███████╗████████╗███████╗███╗   ███╗███████╗
██╔════╝██╔════╝╚══██╔══╝██╔════╝████╗ ████║██╔════╝
███████╗█████╗     ██║   ███████╗██╔████╔██║███████╗
╚════██║██╔══╝     ██║   ╚════██║██║╚██╔╝██║╚════██║
███████║███████╗   ██║   ███████║██║ ╚═╝ ██║███████║
╚══════╝╚══════╝   ╚═╝   ╚══════╝╚═╝     ╚═╝╚══════╝"${blanco}
}
#
# Menu Principal
#
function Choose {
SETSMS
echo -e -n "${verde}
┌═══════════════════════┐
█ ${blanco}SELECCIONE UNA OPCIÓN ${verde}█
└═══════════════════════┘
┃    ┌═══════════════════════════════════════════┐
└═>>>█ [${blanco}01${verde}] ┃ ${blanco}SPAM DE SMS A 1 NÚMERO TELEFÓNICO  ${verde}█
┃    └═══════════════════════════════════════════┘
┃    ┌═══════════════════════════════════════════┐
└═>>>█ [${blanco}02${verde}] ┃ ${blanco}GUARDAR 1 NÚMERO EN LA LISTA NEGRA ${verde}█
┃    └═══════════════════════════════════════════┘
┃    ┌═══════════════════════════════════════════┐
└═>>>█ [${blanco}03${verde}] ┃ ${blanco}SPAMEAR NÚMEROS DE LA LISTA NEGRA  ${verde}█
┃    └═══════════════════════════════════════════┘
┃    ┌═══════════════════════════════════════════┐
└═>>>█ [${blanco}04${verde}] ┃ ${blanco}VER LOS NÚMEROS DE LA LISTA NEGRA  ${verde}█
┃    └═══════════════════════════════════════════┘
┃    ┌══════════════┐
└═>>>█ [${blanco}00${verde}] ┃ ${rojo}SALIR ${verde}█
┃    └══════════════┘
┃
└═>>> "${blanco}
read -r OPTION
sleep 0.5

if [[ ${OPTION} == 0 || ${OPTION} == 00 ]]; then
echo -e -n "" ${blanco}
exit
elif [[ ${OPTION} == 1 || ${OPTION} == 01 ]]; then
source $(pwd)/tools/target.sh
elif [[ ${OPTION} == 2 || ${OPTION} == 02 ]]; then
source $(pwd)/tools/save.sh
elif [[ ${OPTION} == 3 || ${OPTION} == 03 ]]; then
source $(pwd)/tools/spam.sh
elif [[ ${OPTION} == 4 || ${OPTION} == 04 ]]; then
source $(pwd)/tools/list.sh
else
Error
Choose
fi
}
#
# Declarando Funciones
#
Dependencies
Choose
