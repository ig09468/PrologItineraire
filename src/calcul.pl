/* station(Station, LLignes) qui retourne vrai si la liste LLignes contient toutes les lignes passant par la Station */
station(STATION, LLIGNES):-
	num_station(STATION, LLIGNES, _,_,_,_).

/* compare_ligne(LLIGNE1, LLIGNE2, LSTATIONS) compare la liste des stations des deux lignes et retourne la liste */
compare_ligne([],[],_).
compare_ligne([STATION|NEXT],[STATION|NEXT2], [STATION|LSTATIONS]):-
	compare_ligne(NEXT,NEXT2,LSTATIONS).
compare_ligne([STATION1|NEXT],[STATION2|NEXT2],LSTATIONS):-
	compare_ligne(NEXT,NEXT2,LSTATIONS).
	


/* intersection(LIGNE1, LIGNE2, LSTATIONS) retourne vrai si LSTATIONS contient toutes les stations où LIGNE1 et LIGNE2 se croisent */
intersection(LIGNE1,LIGNE2, LSTATIONS):-
	listArrets(LIGNE1, LISTE1),
	listArrets(LIGNE2, LISTE2),
	compare_ligne(LISTE1,LISTE2,LSTATIONS).


/* correspondance(Ligne, LLIGNESSTATIONS) qui retourne vrai si la liste des stations contient toutes les correspondances possible sur la ligne */




/* dessert(LIGNE, DEPART, ARRIVEE) qui retourne vrai si la ligne dessert les arrêts DEPART et ARRIVEE */




/* nbarret(LIGNE, DEPART, ARRIVEE, DIR, NBARRET) qui calcul dans la variable NBARRET le nombre d'arrêt entre la station DEPART ET ARRIVEE */

nbarret(LIGNE, DEPART, ARRIVEE, DIR, NBARRET):-
	num_station(DEPART,LIGNE, DIR, NBDIR,_,_),
	num_station(ARRIVEE,LIGNE,DIR, NBDIR2,_,_),
	NBARRET is NBDIR-NBDIR2.
