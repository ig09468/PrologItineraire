longueur([],0).
longueur([_|ligne], N):-
	longueur(ligne, M),
	N is M+1.

listeArrests([], []).
listeArrests(X,L):-
	ligne(X,_,L,_,_).