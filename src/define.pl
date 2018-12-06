/* Représentation du réseau de transport */


/* longueur(L,T) est un prédicat permettant de retourner la longueur d'une liste */ 
longueur([],0).
longueur([_|LISTE], N):-
	longueur(LISTE, M), N is M+1.

/* listeArrests(L,R) est un prédicat permettant de retourner la liste des arrêts d'une ligne */
listeArrests([], []).
listeArrests(NOMLIGNE,LISTE):-
	ligne(NOMLIGNE,_,LISTE,_,_).

/* link_nbstations(NOMLIGNE) */
link_nbstations(NOMLIGNE):-
	listeArrests(NOMLIGNE, LISTE),
	longueur(LISTE, NBARRETS),
	assert(nb_stations(NOMLIGNE, NBARRETS)).


/* create_nbstations(L,NA) est un prédicat permettant d'associer une ligne avec son nombre de stations */
create_nbstations:-

	/* Association pour les lignes de métro */
	link_nbstations(m1),
	link_nbstations(m2),
	link_nbstations(m3),
	link_nbstations(m4),
	link_nbstations(m5),
	link_nbstations(m6),
	link_nbstations(m7),
	link_nbstations(m7inter1),
	link_nbstations(m7inter2),
	link_nbstations(m7b),
	link_nbstations(m8),
	link_nbstations(m9),
	link_nbstations(m10),
	link_nbstations(m11),
	link_nbstations(m12),
	link_nbstations(m13),
	link_nbstations(m13inter1),
	link_nbstations(m13inter2),
	link_nbstations(m14),

	/* Association pour les lignes de RER */
	link_nbstations(rerA),
	link_nbstations(rerB),
	link_nbstations(rerC1),
	link_nbstations(rerC2),
	link_nbstations(rerD),
	link_nbstations(rerE),

	/* Association pour les lignes de tramway */
	link_nbstations(t1),
	link_nbstations(t2),
	link_nbstations(t3),
	link_nbstations(t4).
 

/* nom_d1(LISTE, D1) est un prédicat permettant de retourner le nom de la première direction */
nom_d1(NOMLIGNE, D1):-
	ligne(NOMLIGNE,_,_,D1,_).

/* nom_d2(LISTE, D2) est un prédicat permettant de retourner le nom de la deuxième direction */
nom_d2(NOMLIGNE, D2):-
	ligne(NOMLIGNE, _, _, _, D2).

/* position_stations(NOMSTATION, LISTE, POSITION) est un prédicat permettant de retourner la position d'une station sur une ligne */
position_stations(NOMSTATION, [NOMSTATION|_], 1).
position_stations(NOMSTATION,[_|LISTE], POSITION):-
	position_stations(NOMSTATION,LISTE, NEWPOSITION), POSITION is NEWPOSITION+1. 

/* create_ligne_numstations(NOMSTATION, LISTE, LISTE, RLISTE, D1, D2) est un prédicat permettant créer le prédicat num_stations sur toutes les stations d'une ligne */
create_ligne_numstations(_, [], _, _, _, _).
create_ligne_numstations(NOMLIGNE,[NOMSTATION|NEXT], LISTE, RLISTE, D1, D2):-
	position_stations(NOMSTATION, LISTE, POSITIOND1),
	position_stations(NOMSTATION, RLISTE, POSITIOND2),
	assert(num_stations(NOMSTATION, NOMLIGNE, D1, POSITIOND1, D2, POSITIOND2)),
	create_ligne_numstations(NOMLIGNE,NEXT,LISTE, RLISTE, D1, D2).

/* link_numstations(NOMLIGNE) */
link_numstations(NOMLIGNE):-
	listeArrests(NOMLIGNE, LISTE),
	nom_d1(NOMLIGNE,D1),
	nom_d2(NOMLIGNE,D2),
	reverse(LISTE, RLISTE),
	create_ligne_numstations(NOMLIGNE, LISTE, LISTE, RLISTE, D1, D2).


/* create_numstations(N, NA) est un prédicat permettant d'associer chaque station de la ligne avec son Nom, son numéro dans chacune des directions */
create_numstations:-
	
	/* Création de num_stations pour la liste des stations de métro */
	link_numstations(m1),
	link_numstations(m2),
	link_numstations(m3),
	link_numstations(m4),
	link_numstations(m5),
	link_numstations(m6),
	link_numstations(m7),
	link_numstations(m7b),
	link_numstations(m7inter1),
	link_numstations(m7inter2),
	link_numstations(m8),
	link_numstations(m9),
	link_numstations(m10),
	link_numstations(m11),
	link_numstations(m12),
	link_numstations(m13),
	link_numstations(m13inter1),
	link_numstations(m13inter2),
	link_numstations(m14),
	
	/* Création de num_stations pour la liste des stations de RER */
	link_numstations(rerA),
	link_numstations(rerB),
	link_numstations(rerC1),
	link_numstations(rerC2),
	link_numstations(rerD),
	link_numstations(rerE),
	
	/* Création de num_stations pour la liste des stations de tramway */
	link_numstations(t1),
	link_numstations(t2),
	link_numstations(t3),
	link_numstations(t4).


/* station(Station, LLignes) qui retourne vrai si la liste LLignes contient toutes les lignes passant par la Station */
station(_,[]).
station(STATION, [X|QLLIGNES]):-
	num_station(STATION, X, _,_,_,_),
	station(STATION, QLLIGNES).