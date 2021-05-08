#! /bin/bash
# Basic if statement

###########################################################################
# Script : steamInstall.bash
#
# Description 	: Installation de steamcmd et de SDL.
#
# Paramètres	: username	-	Nom de l'utilisateur
#				  password	-	Mot de passe de l'utilisateur
#				  userID	-	UID de l'utilisateur (id -u $username)
#				  groupID	-	GID du groupe de l'utilisateur (id -g $username)
#				  chrootID  -	ID  du chroot
#
# Liens utiles	: https://linuxcontainers.org/fr/lxd/getting-started-cli/#initial-configuration
#				  https://blog.simos.info/how-to-make-your-lxd-container-get-ip-addresses-from-your-lan/
#				  https://linuxcontainers.org/lxd/docs/master/networks
#
###########################################################################

username=$1
password=$2
userID=$3
groupID=$4
chrootID=$5

userHome=/home/$username

# Installer LXD
apt-get -y update
apt-get -y install lxd

# Installer ZFS
apt-get -y install zfsutils-linux

# Installer nettools

# Configurer LXD
lxd init

# Créer un LXC
lxc launch ubuntu:20.04 $username

# Rentrer dans un LXC
lxc exec $username -- /bin/bash

# Configurer le network du LXC - IP sur le même réseau
lxc profile create macvlan
lxc profile device add macvlan eth0 nic nictype=macvlan parent=enp0s3
lxc profile show macvlan
