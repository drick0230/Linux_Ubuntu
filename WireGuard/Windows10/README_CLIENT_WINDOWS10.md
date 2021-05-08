# Installation et configuration d'un client WireGuard sous Windows 10
*	L'application est téléchargeable via https://www.wireguard.com/install/.

### À partir d'un .conf
1.	Mettre le fichier .conf dans un dossier sur la machine du client   
![Alt text](Captures/Capture1-1.bmp?raw=true)

2.	Appuyer sur "Ajouter le tunnel" en bas à gauche de l'application WireGuard   
![Alt text](Captures/Capture1-2.bmp?raw=true)

3.	Sélectionner le fichier .conf   
![Alt text](Captures/Capture1-3.bmp?raw=true)

4.	Passer à la section "Général"

### À partir du contenu d'un .conf
1.	Appuyer sur la flêche à côté de "Ajouter le tunnel" en bas à gauche de l'application WireGuard   
![Alt text](Captures/Capture2-1.bmp?raw=true)

2.	Appuyer sur "Ajouter un tunnel vide..."   
![Alt text](Captures/Capture2-2.bmp?raw=true)

3.	Inscrire un nom pour l'interface (Sans caractères spéciaux ou espace)   
![Alt text](Captures/Capture2-3.bmp?raw=true)

4.	Remplacer le contenu de la zone de texte par le contenu d'un fichier .conf   
![Alt text](Captures/Capture2-4.bmp?raw=true)

5.	Appuyer sur "Enregistrer"   
![Alt text](Captures/Capture2-5.bmp?raw=true)

6.	Passer à la section "Général"

### Général
1.	Dans l'onglet "Modifier", le trafic de votre réseau local peut être bloqué ou débloqué ("Bloquer tous le trafic hors tunnel (interrupteur)")
2. 	Permettre les connexions entrante depuis les adresses du VPN (Par défaut : 10.66.66.0/24) dans le pare-feu
	1.	Lancer l'application "Pare-feu Windows Defender avec fonctions avancées de sécurité"
	2.	Appuyer sur "Règles de trafic entrant" en haut à gauche de l'application
	3.	Appuyer sur le bouton droit de la sourie sur "Règles de trafic entrant"
	4.	Appuyer sur "Nouvelle règle..."
	5.	Choisir "Personalisée" pour le "Type de règle"
	6.	Appuyer sur "Étendue" à la gauche de la fenêtre
	7.	Sous la section "À quelles adresses IP locales cette règle s'applique-t-elle?", cocher "Ces adresses IP:"
	8.	Appuyer sur "Ajouter..."
	9.	Inscrire l'adresse du réseau à permettre (Par défaut : 10.66.66.0/24)
	10.	Appuyer sur "OK"
	11.	Appuyer sur "Nom" à la gauche de la fenêtre
	12. Donner un nom à la règle (Ex: WireGuard_VPN)
	13. Appuyer sur Terminer
3.	Il suffit d'activer ou désactiver l'interface sur WireGuard pour se connecter ou se déconnecter du VPN
	
## Problèmes
*	WireGuard bloque les connexions locales sur windows. Il n'est pas possible d'y accéder depuis le VPN ou/et la VM.
	*	Il suffit de permettre les connexions entrante depuis 10.66.66.0/24 dans les règles entrantes du pare-feu Windows du client .
	
*	La connection à partir de l'IPV4 publique ne fonctionne pas.
	*	Il faut reconfigurer le serveur avec le script wireguard-install.sh en inscrivant l'IPV4 publique au lieu de local.
	*	Il faut ouvrir le port utiliser par le serveur VPN sur votre routeur (Se trouve dans tous les .conf à la fin de l'IPV4 du Endpoint)