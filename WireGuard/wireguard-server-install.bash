#! /bin/bash
# Basic if statement

###########################################################################
# Script : wireguard-server-install.bash
#
# Description 	: Installation et configuration d'un serveur VPN avec WireGuard.
#					Le programme doit être exécuté avec les permissions du root.
#
# Liens utiles	: https://github.com/angristan/wireguard-install
#				  https://www.wireguard.com/quickstart/
#				  https://manpages.debian.org/unstable/wireguard-tools/wg.8.en.html
#
#
###########################################################################

# Mise à jour d'apt-get
apt-get update

# Télécharger et installer curl
apt-get -y install curl

######Vérification de l'installation de wireguard-install.sh#######
if [ -e ./wireguard-install.sh ]; then
	echo "wireguard-install.sh already downloaded. [OK]"
else
	# Télécharger le script d'installation de WireGuard
	curl -O https://raw.githubusercontent.com/angristan/wireguard-install/master/wireguard-install.sh

	# Donner les droits d'éxécution du script
	chmod +x wireguard-install.sh
fi

# Exécution du script
./wireguard-install.sh