# WireGuard
## Description
Installation et configuration d'un serveur et de clients VPN avec WireGuard.

## Instalattion et configuration d'un client sous Windows 10
*	L'application est téléchargeable via https://www.wireguard.com/install/.
*	Il faut permettre les connexions entrante depuis l'adresse du VPN (Par défaut : 10.66.66.0/24) dans les règles entrantes du pare-feu.

### À partir d'un .conf
1.	Mettre le fichier .conf dans un dossier sur la machine du client
![Alt text](/Captures/Capture1.bmp?raw=true "1.	Mettre le fichier .conf dans un dossier sur la machine du client")
2.	Appuyer sur "Ajouter le tunnel" en bas à gauche de l'application WireGuard
3.	Sélectionner le fichier .conf
4.	Passer à la section "Général"

### À partir du contenu d'un .conf
1.	Appuyer sur la flêche à côté de "Ajouter le tunnel" en bas à gauche de l'application WireGuard
2.	Appuyer sur "Ajouter un tunnel vide..."
3.	Inscrire un nom pour l'interface (Sans caractères spéciaux ou espace)
4.	Remplacer le contenu de la zone de texte par le contenu d'un fichier .conf
5.	Appuyer sur "Enregistrer"
6.	Passer à la section "Général"

### Général
1.	Dans l'onglet "Modifier", le trafic sur votre réseau local peut être bloqué ou débloqué ("Bloquer tous le trafic hors tunnel (interrupteur)")
2. 	Permettre les connexions entrante depuis l'adresse du VPN (Par défaut : 10.66.66.0/24) dans les règles entrantes du pare-feu.
3.	Il suffit d'activer ou désactiver l'interface sur WireGuard pour se connecter ou se déconnecter du VPN.
	
## Problèmes
*	WireGuard bloque les connexions locales sur windows. Il n'est pas possible d'y accéder depuis le VPN ou/et la VM.
	*	Il suffit de permettre les connexions entrante depuis 10.66.66.0/24 dans les règles entrantes du pare-feu.
	
*	La connection à partir de l'IPV4 publique ne fonctionne pas.
	*	Il faut reconfigurer le serveur avec le script wireguard-install.sh en inscrivant l'IPV4 publique au lieu de local.
	*	Il faut ouvrir le port utiliser par le serveur VPN sur votre routeur (Se trouve dans tous les .conf à la fin de l'IPV4 du Endpoint)