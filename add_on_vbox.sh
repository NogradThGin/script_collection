#!/bin/bash
# Script permettant d'installer les AddOns de VirtualBox sur un Debian (9.2.1 Strecth)

echo -e "[+] Mise a jour du système"
apt-get update -y
apt-get upgrade -y
echo -e "\n\t[+]Mise a jour terminé..."

echo -e "\n\t[+] Mise place des éléments manquants"
apt-get install linux-headers-$(uname -r)
apt-get install gcc make perl dkms

echo -e "\n\t[+] Téléchargement des Additions Invité"
wget http://ftp.fr.debian.org/debian/pool/main/libn/libnotify/libnotify-bin_0.7.7-2_amd64.deb
wget http://ftp.fr.debian.org/debian/pool/contrib/v/virtualbox/virtualbox-guest-dkms_5.2.0-dfsg-4_all.deb
wget http://ftp.fr.debian.org/debian/pool/contrib/v/virtualbox/virtualbox-guest-x11_5.2.0-dfsg-4_amd64.deb
wget http://ftp.fr.debian.org/debian/pool/contrib/v/virtualbox/virtualbox-guest-utils_5.2.0-dfsg-4_amd64.deb

echo -e "\n\t[+] Installation des Additions Invité"
dpkg -i libnotify-bin_0.7.7-2_amd64.deb virtualbox-guest-*.deb

echo -e "\n\t[+] Nettoyage des fichiers d'installation"
rm libnotify-bin_0.7.7-2_amd64.deb virtualbox-guest-*.deb
apt autoclean

echo -e "\t\t[+] Le système va être rebooté"
reboot
