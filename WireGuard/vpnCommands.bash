#! /bin/bash
# Basic if statement

###########################################################################
# Script : vpnInstall.bash
#
# Description 	: Installation et configuration d'un serveur VPN avec WireGuard.
#
# Liens utiles	: https://openvpn.net/vpn-server-resources/installing-openvpn-access-server-on-a-linux-system/
#				  https://github.com/angristan/wireguard-install
#				  https://www.wireguard.com/quickstart/
#				  https://help.keenetic.com/hc/en-us/articles/360010408000-Connecting-to-a-WireGuard-VPN-from-Windows
#				  https://www.thomas-krenn.com/en/wiki/Ubuntu_Desktop_as_WireGuard_VPN_client_configuration
#				  https://manpages.debian.org/unstable/wireguard-tools/wg.8.en.html
#
# Dépendances 	: curl
#
# Problèmes		: WireGuard bloque les connexions locales sur windows. Il n'est pas possible d'y accéder depuis le VPN ou/et la VM.
#				  Il suffit de permettre les connexions entrante depuis 10.66.66.0/24 dans les règles entrantes du pare-feu.
#
#				  La connection à partir de l'IPV4 publique ne fonctionne pas.
#				  Il faut probablement reconfigurer le serveur avec le script wireguard-install.sh en inscrivant l'IPV4 publique au lieu de local.
#
###########################################################################

######Création du serveur#######
# Télécharger le script d'installation de WireGuard
curl -O https://raw.githubusercontent.com/angristan/wireguard-install/master/wireguard-install.sh

# Donner les droits d'éxécution du script
chmod +x wireguard-install.sh

# Exécuter le script
./wireguard-install.sh

# Supprimer le script

######Connexion du client#######
# Télécharger et installer wireguard
apt-get install wireguard

# Il faut transférer le .conf du client depuis le serveur sur la machine du client
# Ex. Depuis @server /home/username/client.conf -> @client /etc/wireguard/client.conf
:' Template for client .conf
[Interface]
PrivateKey = <Private key of the client>
Address = <IPV4 on VPN>/<Mask>, <IPV6 on VPN>/<Mask>
DNS = 94.140.14.14, 94.140.15.15

[Peer]
PublicKey = <Public key of the server>
PresharedKey = <Preshared key>
AllowedIPs = 0.0.0.0/0, ::/0
Endpoint = <IPV4 of the server>:<Port of the server>
'

:' Example for wg0.conf
[Interface]
PrivateKey = mF3BtMfQ7hzDejEZeq3tI9voJqRT5r1LYq/oWofgpGM=
Address = 10.66.66.2/32, fd42:42:42::2/128
DNS = 94.140.14.14, 94.140.15.15

[Peer]
PublicKey = o7LPc8D5kbTv262KOJqZv01k0k/u0HEWezzUVRMjoRc=
PresharedKey = WXb7PSK9B627WTnywWSr7nO4BAAc254bofYcmxyoKJs=
AllowedIPs = 0.0.0.0/0, ::/0
Endpoint = 192.168.1.122:59895
'

# Connect to VPN
wg-quick up wg0

# Disconnect from VPN
wg-quick down wg0

# Auto-Start at boot
systemctl enable wg-quick@wg0.service 
systemctl disable wg-quick@wg0.service 

# Manage Auto-Start at boot
systemctl start wg-quick@wg0.service
systemctl status wg-quick@wg0.service
systemctl stop wg-quick@wg0.service