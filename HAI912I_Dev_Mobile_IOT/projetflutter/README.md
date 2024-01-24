# projetflutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


**Fonctionner l'applciation**

Pour utiliser l'application, premierement

- creer un compte utilisateur
- ce connecter a ce copmte si ce n'est pas encore fait
- acceder a l'accueil de l'application : il ya plusieurs fonctionnalités, cette interface recupere la localisation actuel et la date et l'heure de jour.
	- temperature : cette interface recupere la temperature capter par le backend, ainsi que toutes les temperatures stocker dans sqlite
	- luminosité : cette interface recupere le mode d'affichage de cette interface par rapport a la valuer de seuil choisi par defaut ( clair : 1000 - 4000) et 							
	(sombre : entre 500- 1000)
	- controle LED : interface permet a l'utilisateur d'ajuster la valeur ou la couleur de l'allumage de la led en fonction d'un mélangeur de couleurs CMY (Cyan, 				 	
	Magenta, Jaune). 
	- Statitique : cette inetrface nous affiche les statistiques des données de temperature et de lumenosité stocker dans la base de données sqlite.
	- Profile : cette inetreface affiche le profile de l'utilisateur en cours
	- Parametres : pour ajuster les parametres de l'application
	- menu deconnexion: il ce trouve dans l'inetrface profile, qui permet de se deconnecter de l'applciation.
	
	
	
