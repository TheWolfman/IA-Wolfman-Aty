/*********************************************
 * Modèle pour le problème du carré latin
 *********************************************/
using CP;

/* Paramétrage du solveur */
// TODO préciser la stratégie de recherche à utiliser (bloc OPL Script)
execute{
	cp.param.searchType="DepthFirst";
	cp.param.workers=1;
}

/*** Données du problème  ***/
include "../shared/donnee.mod";
 
/*** Variables et domaines  ***/
range c = 1..n;

dvar int lignes[c] in c;

/*** Contraintes  ***/  
constraints { 
	//Une reine par ligne et par diagonales
	forall(i,j in c : i < j){
		lignes[i] != lignes[j];
		abs(lignes[i] - lignes[j]) != abs(i - j)	;
	}
}

/*** Post-traitement  ***/

execute{
	for (var l in c){
		for (var co in c){
			if(lignes[l] == co){
				write(lignes[l]);
			} else {
				write(0);
			}
		}
		writeln();
	}
}

/* Controle de Flux (pour énumérer toutes les solutions) */
// TODO (utiliser un "include" sur un ficher externe)
include "../shared/allSolutions.mod";
