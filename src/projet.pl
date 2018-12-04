longueur([],0).
longueur([_|ligne], N):-
	longueur(ligne, M),
	N is M+1.

listeArrests([], []).
listeArrests(NomLigne,Liste):-
	ligne(NomLigne,_,Liste,_,_).

create_nbstations(NomLigne):-
	listeArrests(NomLigne, Liste),
	longueur(Liste, NbArrets).
	assert(nb_stations(NomLigne, NbArrets)).

