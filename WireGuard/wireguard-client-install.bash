#! /bin/bash
# Basic if statement

###########################################################################
# Script : wireguard-client-install.bash
#
# Description 	: Installation d'un client VPN avec WireGuard.
#					Le programme doit être exécuté avec les permissions du root.
#
# Liens utiles	: https://github.com/angristan/wireguard-install
#				  https://www.wireguard.com/quickstart/
#				  https://manpages.debian.org/unstable/wireguard-tools/wg.8.en.html
#				  https://www.thomas-krenn.com/en/wiki/Ubuntu_Desktop_as_WireGuard_VPN_client_configuration
#
#
###########################################################################

# Mise à jour d'apt-get
apt-get update

# Télécharger et installer wireguard
apt-get -y install wireguard

# Télécharger et installer resolvconf
apt-get -y install resolvconf

echo -e '\n'
echo "--------Et maintenant?------------"
echo "Il faut transférer le .conf du client depuis le serveur sur la machine du client"
echo "Voici quelques commandes pratiques pour, par exemple, un fichier de configuration nommé wg0.conf"
echo -e '\n'
echo "# Connect to VPN"
echo "wg-quick up wg0"
echo -e '\n'
echo "# Disconnect from VPN"
echo "wg-quick down wg0"
echo -e '\n'
echo "# Auto-Start at boot"
echo "systemctl enable wg-quick@wg0.service "
echo "systemctl disable wg-quick@wg0.service "
echo -e '\n'
echo "# Manage Auto-Start at boot"
echo "systemctl start wg-quick@wg0.service"
echo "systemctl status wg-quick@wg0.service"
echo "systemctl stop wg-quick@wg0.service"
echo -e '\n'