
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



/*Question 5 version 2*/

ligne_stations(NOMLIGNE1, LIGNEDECHANGEMENT, [LIGNEDECHANGEMENT|STATION]):-
    intersection(NOMLIGNE1, LIGNEDECHANGEMENT, LISTSTATIONS),
    member(STATION, LISTSTATIONS).



correspondances_possibles(NOMLIGNE1, L):-
    ligne_stations(NOMLIGNE1, NOMLIGNE2, L).


correspondance(NOMLIGNE, LISTCORRESPONDANCE):-
    setof(L,correspondances_possibles(NOMLIGNE, L), LISTCORRESPONDANCE).  
    

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

/*                  QUESTION 7 :                 */
/*copier_sans_arrive est un predicat appelé par le prédicat liste_des_arrets pour retourner la liste des arrets entre depart et arrivé*/
copier_sans_arrive([ARRIVE|LISTARRETS], ARRIVE,[]):- !.
copier_sans_arrive([ARRIVE|LISTARRETS], ARRIVE, _):-!.
copier_sans_arrive([X|LISTARRETS],ARRIVE,[X|LIST]):- !,
    X \= ARRIVE, 
    copier_sans_arrive(LISTARRETS,ARRIVE,LIST).


/*liste_des_arrets retourne la liste des arrets se trouvant entre départ et arrive*/
liste_des_arrets([DEPART], DEPART, ARRIVE, []):-!.
liste_des_arrets([DEPART|LARRETS], DEPART,ARRIVE, LISTARRETS):- !,
    append([],LARRETS, LISTA ),
    copier_sans_arrive(LISTA,ARRIVE, LISTARRETS).
liste_des_arrets([SATION|LARRETS], DEPART,ARRIVE, LISTARRETS):-
    liste_des_arrets(LARRETS, DEPART, ARRIVE, LISTARRETS).

/*

/*le prédicat is direction retourne vrai si DIR est une direction de la ligne NOMLIGNE*/
isDirection(NOMLIGNE, DIR):-
    ligne(NOMLIGNE,_,_,DIR,_),!.
isDirection(NOMLIGNE,DIR):-
    ligne(NOMLIGNE,_,_,_,DIR).


/*liste_arrets_dirigé retourne la liste de tous les arrets de la ligne NOMLIGNE */
liste_arrets_dirigee(NOMLIGNE,DIR, LISTARRETS):-
    ligne(NOMLIGNE,_,_,DIR,_),!,
    listeArrets(NOMLIGNE, LISTARRETS),!.
liste_arrets_dirigee(NOMLIGNE,DIR, LISTARRETS):- 
/*sinon c'est la direction 2, on retourne donc la liste des arrets inversée*/
    listeArrets(NOMLIGNE, L),
    reverse(L, LISTARRETS).

/*nbarrets retourne le nomre d'arrets se trouvant entre DEPART et ARRIVE */
nbarrets(NOMLIGNE, DEPART, ARRIVE, DIR, NBARRETS):-!,
    isDirection(NOMLIGNE,DIR),
    dessert(NOMLIGNE, DEPART, ARRIVE), 
    liste_arrets_dirigee(NOMLIGNE,DIR,  LISTARRETS),
    liste_des_arrets(LISTARRETS,DEPART,ARRIVE, L),
    longueur(L, NBARRETS).
/*                  QUESTION 8: en cours                   */




