# Configuration du pare-feu Windows 10 pour permettre les connexions entrantes depuis un VPN
*	L'adresse par défaut du réseau du VPN est 10.66.66.0/24. Le /24 représente le masque de sous-réseau 255.255.255.0. Autrement dit, ce sont les IPV4 de 10.66.66.0 à 10.66.66.255.
*	Lorsque vous n'êtes pas connecté au VPN, vous pouvez "Désactiver la règle", en appuyant sur le bouton droit de la sourie, sur celle-ci.

## Instructions
1.	Lancer l'application "Pare-feu Windows Defender avec fonctions avancées de sécurité"   
	![](Captures/Capture3-1.bmp?raw=true)
	
2.	Appuyer sur "Règles de trafic entrant" en haut à gauche de l'application   
	![](Captures/Capture3-2.bmp?raw=true)
	
3.	Appuyer sur le bouton droit de la sourie sur "Règles de trafic entrant"   
	![](Captures/Capture3-3.bmp?raw=true)
	
4.	Appuyer sur "Nouvelle règle..."   
	![](Captures/Capture3-4.bmp?raw=true)
	
5.	Choisir "Personalisée" pour le "Type de règle"   
	![](Captures/Capture3-5.bmp?raw=true)
	
6.	Appuyer sur "Étendue" à la gauche de la fenêtre   
	![](Captures/Capture3-6.bmp?raw=true)
	
7.	Sous la section "À quelles adresses IP locales cette règle s'applique-t-elle?", cocher "Ces adresses IP:"   
	![](Captures/Capture3-7.bmp?raw=true)
	
8.	Appuyer sur "Ajouter..."   
	![](Captures/Capture3-8.bmp?raw=true)
	
9.	Inscrire l'adresse du réseau à permettre (Par défaut : 10.66.66.0/24)   
	![](Captures/Capture3-9.bmp?raw=true)
	
10.	Appuyer sur "OK"   
	![](Captures/Capture3-10.bmp?raw=true)
	
11.	Appuyer sur "Nom" à la gauche de la fenêtre   
	![](Captures/Capture3-11.bmp?raw=true)
	
12. Donner un nom à la règle (Ex: WireGuard_VPN)   
	![](Captures/Capture3-12.bmp?raw=true)
	
13. Appuyer sur Terminer   
	![](Captures/Capture3-13.bmp?raw=true)
	
