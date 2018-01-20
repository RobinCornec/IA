canevas([L1, L2, L3, L4, L5]):-canevas_ligne(L1),canevas_ligne(L2),canevas_ligne(L3),canevas_ligne(L4),canevas_ligne(L5).

% Dans l’ordre: nationalité, couleur, boisson, animal, profession
canevas_ligne([_, _, _, _, _]).

afficher_liste([X|L]):-writeln(X), afficher_liste(L).

print_canevas([]):-nl.
print_canevas([H|T]):-print_canevas_ligne(H),print_canevas(T).

print_canevas_ligne([]):-nl.
print_canevas_ligne([X]):-print_canevas_cellule(X), nl.
print_canevas_ligne([H,H2|T]):-print_canevas_cellule(H),write(','),print_canevas_ligne([H2|T]).

print_canevas_cellule(X):- var(X),write('_').
print_canevas_cellule(X):- \+var(X),write(X).

regle1(T) :-
	member([anglais, rouge, _, _, _], T).

regle2(T) :-
	member([espagnol, _, _, chien,_], T).

regle3(T) :-
	member([islandais, _, _, _,ingenieur], T).

regle4(T) :-
	member([_, verte, cafe, _, _], T).

regle5(T) :-
	nth1(N, T, [_, verte, _, _, _]),
	nth1(N2, T, [_, blanche, _, _, _]),
	D is N2-N,
	D == 1.

regle6(T) :-
	member([_, _, _, ane, sculpteur], T).

regle7(T) :-
	member([_, jaune, _, _, diplomate], T).

regle8(T) :-
	T = [[norvegien, _, _, _, _], _, _, _, _].

regle9(T) :-
	nth1(N, T, [_, _, _, _, medecin]),
	nth1(N2, T, [_, _, _, renard, _]),
	D is N2-N,
	member(D, [-1,1]).

regle10(T) :-
	nth1(N, T, [_, _, _, _, diplomate]),
	nth1(N2, T, [_, _, _, cheval, _]),
	D is N2-N,
	member(D, [-1,1]).

regle11(T) :-
	nth1(N, T, [_, _, lait, _, _]),
	N == 3.

regle12(T) :-
	member([slovene, _, the, _, _], T).

regle13(T) :-
	member([_, _, jusdorange, _, violoniste], T).

regle14(T) :-
	nth1(N, T, [norvegien, _, _, _, _]),
	nth1(N2, T, [_,bleue, _, _, _]),
	D is N2-N,
	member(D, [-1,1]).

question1(T) :-
	member([_, _, eau, _, _], T).

question2(T) :-
	member([_, _, _, zebre, _], T).

resoudre(T) :- 
	regle1(T), regle2(T), regle3(T), regle4(T),
	regle5(T), regle6(T), regle7(T), regle8(T),
	regle9(T), regle10(T), regle11(T), regle12(T),
	regle13(T), regle14(T), question1(T), question2(T).