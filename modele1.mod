/*********************************************
 * OPL 12.7.0.0 Model
 * Author: Aty
 * Creation Date: 12 févr. 2017 at 14:21:31
 * On ignore l'indisponibilité et la précédence - toutes les réunions sont sur 1 seul jours ayant suffisament de créneaux !
 *********************************************/
using CP;

/* Paramétrage du solveur */
execute{
	cp.param.searchType="DepthFirst";
	cp.param.workers=1;
}

/*** Lecture du fichier f et affichage de son contenu ligne par ligne sinon erreur  ***/
execute {
	var f = new IloOplInputFile("instanceMod1.txt");
   	if (f.exists) {
     	writeln("the file instanceMod1.txt exists");
     	var s;
     	while (!f.eof) {
      		s=f.readline();
      		writeln(s);
     	}
     	f.close();
   	} else { 
     	writeln("the file instanceMod1.txt doesn't exist");
   	}
}

/* Déclarations domaines et variables */

/*Données du modèle billes1.mod
range age = 4..7;

dvar int Anne in age;
dvar int Bernard in age;
dvar int Claudine in age;
dvar int Denis in age;
dvar int Bleue in age;
dvar int Jaune in age;
dvar int Noire in age;
dvar int Rouge in age;
dvar int Parc in age;
dvar int Chambre in age;
dvar int Salon in age;
dvar int Jardin in age;*/



/* Contraintes */
// TODO DÃ©crire les contraintes dans la syntaxe OPL)
   // Pour une meilleure lisibilitÃ©, penser Ã  bien faire prÃ©cÃ©der
   // chaque contrainte (ou groupe de contraintes) avec le texte
   // de l'Ã©noncÃ© originel (en commentaire) qui lui correspond.
   
/*Données du modèle billes1.mod
constraints { 
	//Denis joue dans le parc 
	Denis == Parc;

	//Denis n'a pas 4 ans 
	Denis != 4;

	//Contrairement Ã  l'enfant qui a des billes bleues 
	Denis != Bleue;
	Bleue == 4;

	//Fille de 6 ans 
	Bernard != Jaune;
	Denis != Jaune;

	//a des billes jaunes 
	Jaune == 6;

	//L'enfant bille noire est plus agÃ© que enfant jardin 
	Noire > Jardin; 

	//Mais plus jeune que Anne 
	Noire < Anne;

	//Anne joue dans sa chambre  
	Anne == Chambre; 

	//Anne a 1 ans de plus que l'enfant salon 
	Anne == Salon + 1;

	//Chacun est unique
	Anne != Bernard; 
	Anne != Claudine;
	Anne != Denis;
	Bernard != Claudine;
	Bernard != Denis;
	Claudine != Denis; 
	
	Bleue != Jaune;
	Bleue != Noire;
	Bleue != Rouge;
	Jaune != Noire;
	Jaune != Rouge;
	Noire != Rouge;
	
	Parc != Chambre;
	Parc != Salon;
	Parc != Jardin;
	Chambre != Salon;
	Chambre != Jardin;
	Salon != Jardin;
}*/

/* Post-traitement pour l'affichage de la solution  (bloc OPL Script)*/

/*Données du modèle billes1.mod
execute{
	writeln("Anne = ", Anne);
	writeln("Bernard = ", Bernard);
	writeln("Claudine = ", Claudine);
	writeln("Denis = ", Denis);
	writeln("Bleue = ", Bleue);
	writeln("Jaune = ", Jaune);
	writeln("Noire = ", Noire);
	writeln("Rouge = ", Rouge);
	writeln("Parc = ", Parc);
	writeln("Salon = ", Salon);
	writeln("Chambre = ", Chambre);
	writeln("Jardin = ", Jardin);
}*/
 