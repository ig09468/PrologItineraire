/* station(Station, LLignes) qui retourne vrai si la liste LLignes contient toutes les lignes passant par la Station */
/*station(_,[]). */
/*station(STATION, [X|QLLIGNES]):- */
/*	num_station(STATION, X, _,_,_,_), */
/*	station(STATION, QLLIGNES). */


/* intersection(LIGNE1, LIGNE2, LSTATIONS) retourne vrai si LSTATIONS contient toutes les stations où LIGNE1 et LIGNE2 se croisent */
intersection(LIGNE1,LIGNE2):-
	num_station(X,LIGNE1,_,_,_,_),
	num_station(X,LIGNE2,_,_,_,_).

