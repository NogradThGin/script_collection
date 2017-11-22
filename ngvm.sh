#!/bin/bash

while getopts "k:s:lrh" OPTION; do
  case $OPTION in
    s)
      echo -e "\n\e[96m[+]\e[39m Lancement de la VM \e[91m$OPTARG\e[39m en \e[35mHeadless"
      VBoxManage startvm "$OPTARG" --type headless
      ;;
    k)
      echo -e "\n\e[96m[+]\e[39m Arrêt de la VM \e[91m$OPTARG\e[39m"
      VBoxManage controlvm "$OPTARG" poweroff
      ;;
    l)
      echo -e "\n\e[96m[+]\e[39m Listing des VMs installés\n"
      VBoxManage list vms
      ;;
    r)
      echo -e "\n\e[96m[+]\e[39m Listing des VMs en cours d'exécution\n"
      VBoxManage list runningvms
      ;;
    h)
      echo -e "\n\e[96m[+]\e[39m Utilisation de la commande \e[91mngvm\e[39m:\n"
      echo -e "\e[96m[+]\e[39m \e[92m-h\e[39m: Affiche ce message"
      echo -e "\e[96m[+]\e[39m \e[92m-l\e[39m: Liste les machines virtuelle installées"
      echo -e "\e[96m[+]\e[39m \e[92m-r\e[39m: Liste les machines virtuelle démarrées"
      echo -e "\e[96m[+]\e[39m \e[92m-s \e[93m\"VM_NAME\"\e[39m: Démarre la machine virtuelle \e[93mVM_NAME\e[39m"
      echo -e "\e[96m[+]\e[39m \e[92m-k \e[93m\"VM_NAME\"\e[39m: Arrête la machine virtuelle \e[93mVM_NAME\e[39m"
      ;;
    esac
done
