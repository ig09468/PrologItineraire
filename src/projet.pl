longueur([],0).
longueur([_|LISTE], N):-
	longueur(LISTE, M),
	N is M+1,
	N>0.

listeArrests([], []).
listeArrests(NomLigne,Liste):-
	ligne(NomLigne,_,Liste,_,_).

create_nbstations(NOMLIGNE, NBARRETS):-
	listeArrests(NOMLIGNE, LISTE),
	longueur(LISTE, NBARRETS).
	assert(nb_stations(NOMLIGNE, NBARRETS)).
