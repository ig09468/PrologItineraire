/* Représentation du réseau de transport */


/* longueur(L,T) est un prédicat permettant de retourner la longueur d'une liste */ 
longueur([],0).
longueur([_|LISTE], N):-
	longueur(LISTE, M), N is M+1.

/* listeArrests(L,R) est un prédicat permettant de retourner la liste des arrêts d'une ligne */
listeArrests([], []).
listeArrests(NOMLIGNE,LISTE):-
	ligne(NOMLIGNE,_,LISTE,_,_).

/* create_nbstations(L,NA) est un prédicat permettant d'associer une ligne avec son nombre de stations */
create_nbstations:-

	/* Association pour les lignes de métro */
	listeArrests(m1, LISTE),
	longueur(LISTE, NBARRETS),
	assert(nb_stations(m1, NBARRETS)),
	listeArrests(m2, LISTE),
	longueur(LISTE, NBARRETS),
	assert(nb_stations(m2, NBARRETS)),
	listeArrests(m3, LISTE),
	longueur(LISTE, NBARRETS),
	assert(nb_stations(m3, NBARRETS)),
	listeArrests(m3b, LISTE),
	longueur(LISTE, NBARRETS),
	assert(nb_stations(m3b, NBARRETS)),
	listeArrests(m4, LISTE),
	longueur(LISTE, NBARRETS),
	assert(nb_stations(m4, NBARRETS)),
	listeArrests(m5, LISTE),
	longueur(LISTE, NBARRETS),
	assert(nb_stations(m5, NBARRETS)),
	listeArrests(m6, LISTE),
	longueur(LISTE, NBARRETS),
	assert(nb_stations(m6, NBARRETS)),
	listeArrests(m7inter1, LISTE),
	longueur(LISTE, NBARRETS),
	assert(nb_stations(m7inter1, NBARRETS)),
	listeArrests(m7inter2, LISTE),
	longueur(LISTE, NBARRETS),
	assert(nb_stations(m7inter2, NBARRETS)),
	listeArrests(m8, LISTE),
	longueur(LISTE, NBARRETS),
	assert(nb_stations(m8, NBARRETS)),
	listeArrests(m9, LISTE),
	longueur(LISTE, NBARRETS),
	assert(nb_stations(m9, NBARRETS)),
	listeArrests(m10, LISTE),
	longueur(LISTE, NBARRETS),
	assert(nb_stations(m10, NBARRETS)),
	listeArrests(m11, LISTE),
	longueur(LISTE, NBARRETS),
	assert(nb_stations(m11, NBARRETS)),
	listeArrests(m12, LISTE),
	longueur(LISTE, NBARRETS),
	assert(nb_stations(m12, NBARRETS)),
	listeArrests(m13, LISTE),
	longueur(LISTE, NBARRETS),
	assert(nb_stations(m13, NBARRETS)),
	listeArrests(m13inter1, LISTE),
	longueur(LISTE, NBARRETS),
	assert(nb_stations(m13inter1, NBARRETS)),
	listeArrests(m13inter2, LISTE),
	longueur(LISTE, NBARRETS),
	assert(nb_stations(m13inter2, NBARRETS)),
	listeArrests(m14, LISTE),
	longueur(LISTE, NBARRETS),
	assert(nb_stations(m14, NBARRETS)),

	/* Association pour les lignes de RER */
	listeArrests(rerA, LISTE),
	longueur(LISTE, NBARRETS),
	assert(nb_stations(rerA, NBARRETS)),
	listeArrests(rerB, LISTE),
	longueur(LISTE, NBARRETS),
	assert(nb_stations(rerB, NBARRETS)),
	listeArrests(rerC1, LISTE),
	longueur(LISTE, NBARRETS),
	assert(nb_stations(rerC1, NBARRETS)),
	listeArrests(rerC2, LISTE),
	longueur(LISTE, NBARRETS),
	assert(nb_stations(rerC2, NBARRETS)),
	listeArrests(rerD, LISTE),
	longueur(LISTE, NBARRETS),
	assert(nb_stations(rerD, NBARRETS)),
	listeArrests(rerE, LISTE),
	longueur(LISTE, NBARRETS),
	assert(nb_stations(rerE, NBARRETS)),

	/* Association pour les lignes de tramway */
	listeArrests(t1, LISTE),
	longueur(LISTE, NBARRETS),
	assert(nb_stations(t1, NBARRETS)),
	listeArrests(t2, LISTE),
	longueur(LISTE, NBARRETS),
	assert(nb_stations(t2, NBARRETS)),
	listeArrests(t3, LISTE),
	longueur(LISTE, NBARRETS),
	assert(nb_stations(t3, NBARRETS)),
	listeArrests(t4, LISTE),
	longueur(LISTE, NBARRETS),
	assert(nb_stations(t4, NBARRETS)).

/* nom_d1(LISTE, D1) est un prédicat permettant de retourner le nom de la première direction */
nom_d1(NOMLIGNE, D1):-
	ligne(NOMLIGNE, _, _, D1).

/* position_stations_d1(NOMSTATION, LISTE, POSITION) est un prédicat permettant de retourner la position d'une station sur une ligne */
position_stations_d1(NOMSTATION, [NOMSTATION|_], 1).
position_stations_d1(NOMSTATION,[_|LISTE], POSITION):-
	position_stations_d1(NOMSTATION,LISTE, NEWPOSITION), POSITION is NEWPOSITION+1. 

/* nom_d2(LISTE, D2) est un prédicat permettant de retourner le nom de la deuxième direction */
nom_d2(NOMLIGNE, D2):-
	ligne(NOMLIGNE, _, _, _, D2).

/* position_stations_d2(NOMSTATION, LISTE, POSITION) est un prédicat permettant de retourner la position d'une stations sur une direction d2 */



/* create_numstations(N, NA) est un prédicat permettant d'associer chaque station de la ligne avec son Nom, son numéro dans chacune des directions */
/*create_numstations(NOMLIGNE,NOMSTATION, NBARRETS):- */
/*	listeArrests(NOMLIGNE, LISTE), */
/*	nom_d1(NOMLIGNE,D1), */
/*	position_stations_d1(NOMSTATION,LISTE, POSITIOND1), */
/*	nom_d2(NOMLIGNE,D2), */
/*	position_stations_d2(NOMSTATION, LISTE, POSITIOND2),*/
/*	assert(num_stations(NOMSTATION, D1, POSITIOND1, D2, POSITIOND2)).*/

