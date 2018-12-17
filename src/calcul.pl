
/*                           QUESTION 3                  */
/*chercherLigne(STATION, NOMLIGNE est un predication permet de verifier si la ligne NOMLIGNE passe par la station STATION*/
chercherLigne(STATION, NOMLIGNE):-
    ligne(NOMLIGNE,_,_, _, _),
    listeArrets(NOMLIGNE, LISTARRETS),
    member(STATION, LISTARRETS).


station(STATION, LLIGNE):-
    setof(NOMLIGNE, chercherLigne(STATION, NOMLIGNE), LLIGNE).



/*                          QUESTION 4                  */
/*croise est un prédicat qui retourne vrai si STATION existe à la fois dans LISTA1 et LISTA2*/
croise(LISTA1, LISTA2, STATION):-
    member(STATION, LISTA1),
    member(STATION, LISTA2).

/*le prédication serach retourne à chaque fois toutes les stations ou peuvent se croiser NOMLIGNE1 et NOMLIGNE2 */
search(NOMLIGNE1, NOMLIGNE2,STAION):-
    listeArrets(NOMLIGNE1, LISTA1),
    listeArrets(NOMLIGNE2, LISTA2),
    croise(LISTA1, LISTA2, STAION).

/*le rédicat intersection retourne la liste de toutes les station ou peuvent se croiser NOMLIGNE1, NOMLIGNE2*/
intersection(NOMLIGNE1, NOMLIGNE2, L):-
    setof(STAION, search(NOMLIGNE1, NOMLIGNE2, STAION), L),
    NOMLIGNE1 \= NOMLIGNE2.



/*                      QUESTION 5                  */
/*ligne_station est prédication qui permet de retourner une liste L contenant les paires [NOMLIGNE, STATION]*/
ligne_station(NOMLIGNE, [], []):- !.
ligne_station(NOMLIGNE, [ST|LSTATIONS],[[NOMLIGNE,ST] |L]):-
    ligne_station(NOMLIGNE, LSTATIONS, L).


/*changemet_ligne permet pour chaque ligne NOMLIGNE2 de retourner la liste de correspondance pouvant être effectuées à partir de NOMLIGNE1*/
changement_ligne(NOMLIGNE1, NOMLIGNE2, LISTCORRESPONDANCE):-
    intersection(NOMLIGNE1, NOMLIGNE2, LL),
    ligne_station(NOMLIGNE2, LL, LISTCORRESPONDANCE).


/*list_changement est un prédicat auxiliaire pour éviter de mettre des variable libres lors de l'appel de setof dans le prédicat correspondance*/
list_changement(LIGNE, L):-
    changement_ligne(LIGNE, LIGNE2, L).


/*correspondance(LIGNE, */
correspondance(LIGNE, LISTCORRESPONDANCE):-
    setof(L, list_changement(LIGNE, L), LISTCORRESPONDANCE).



/*                      QUESTION 6                  */

isStationOF([STATION], STATION, []):- !.
isStationOF([STATION|LISTARRETS], STATION, LISTARRETS):-!.
isStationOF([_|LISTARRETS], STATION, REST):-
    isStationOF(LISTARRETS, STATION, REST).

/*dessert(NOMLIGNE, DEPART, ARRIVE) est prédicat qui retourne vrai si la ligne NOMLIGNE dessert les station DEPART et ARRIVE*/

/*dessert dans la direction 1*/
dessert(NOMLIGNE, DEPART, ARRIVE):-
    listeArrets(NOMLIGNE, LISTARRETS),
    isStationOF(LISTARRETS, DEPART, RESTOFSTATIONS), !.
/*après avoir testé que DEPART est une station de la liste des arrets de NOMLIGNE, on test si ARRIVE exite encore dans la reste des station 
pour s'assurer que ARRIVE est toujours après DEPART*/
    isStationOF(RESTOFSTATIONS, ARRIVE, RESTOFSTATIONS2). 

/*dessert pour la direction 2*/
dessert(NOMLIGNE, DEPART, ARRIVE):-
    listeArrets(NOMLIGNE, LISTARRETS),
    reverse(LISTARRETS, INVLISTARRETS),
    isStationOF(INVLISTARRETS, DEPART, R1),
    isStationOF(R1, ARRIVE, R2).

/*                  QUESTION 7 : en cours                 */
copie([ARRIVE|L], ARRIVE,[]):- !.
copie([ARRIVE|L], ARRIVE, _):-!.
copie([X|L],ARRIVE,[X|L2]):- !,
    X \= ARRIVE, 
    copie(L,ARRIVE,L2).
    

calcul([DEPART], DEPART, ARRIVE, []):-!.
calcul([DEPART|LISTARRETS], DEPART,ARRIVE, LL):- !,
    append([],LISTARRETS, L),
    copie(L,ARRIVE, LL).
calcul([SATION|LISTARRETS], DEPART,ARRIVE, LL):-
    calcul(LISTARRETS, DEPART, ARRIVE, LL).


nbarrets(NOMLIGNE, DEPART, ARRIVE, DIR, NBARRETS):-
    dessert(NOMLIGNE, DEPART, ARRIVE), !,
    listeArrets(NOMLIGNE, LISTARRETS),
    calcul(LISTARRETS,DEPART,ARRIVE, L),
    longueur(L, NBARRETS).

/*                  QUESTION 8: en cours                   */
