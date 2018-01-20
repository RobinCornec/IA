% --- PARTIE 1 ---

% ffvi = (personnage(nom,groupe,fonction,note,xp),chef)

ffvii(personnage(aeris,cetras,soin,19,10000),ifalna).
ffvii(personnage(ifalna,cetras,pnj,6,15000),cloud).
ffvii(personnage(cloud,soldat,heros,18,30000),cloud).
ffvii(personnage(tifa,equipe,guerrier,11,15000),barret).
ffvii(personnage(barret,equipe,guerrier,7,14000),cloud).
ffvii(personnage(rougexiii,equipe,soin,18,11000),barret).
ffvii(personnage(yuffie,equipe,ninja,8,2000),barret).

% Question A :

getGroupe(PERSONNAGE,GROUPE):-ffvii(personnage(PERSONNAGE,GROUPE,_,_,_),_).

% Question B :

getChef(PERSONNAGE,CHEF):-ffvii(personnage(PERSONNAGE,_,_,_,_),CHEF).

% QUESTION C :

% membre_valide(cloud) retourne "true"
membreValide(cloud).

% La seconde ligne cherche le chef du chef jusqu'a arriver sur cloud (Le big boss)
membreValide(PERSONNAGE):-getChef(PERSONNAGE,CHEF),membreValide(CHEF).

% QUESTION D :

getXp(PERSONNAGE,XP):-ffvii(personnage(PERSONNAGE,_,_,_,XP),_).

% QUESTION E-I : 

getNote(PERSONNAGE,NOTE):-ffvii(personnage(PERSONNAGE,_,_,NOTE,_),_).

% Si la note est du personnage est inferieur a 10 alors j'affiche l'xp de celui-ci.
getXpReel(PERSONNAGE,XP):-getNote(PERSONNAGE,NOTE), NOTE < 10, getXp(PERSONNAGE,XP).

% Si la note du personnage est supperieur a 10, alors j'ajoute 5000 a celui-ci
get_xp_reel(PERSONNAGE,XP):-getNote(PERSONNAGE,NOTE), NOTE >= 10, getXp(PERSONNAGE,XPPERSONNAGE), XP is XPPERSONNAGE+5000.

% QUESTION E-II

/*
Je recupere l'xp reel du personnage
Je recupere le chef
Je recupere l'xp reel du chef
Si l'xp du personnage est inferieur a l'xp du chef, alors son xp est bonne je l'affiche
Si l'xp du personnage est supperieur a l'xp du chef, alors son xp est equivalente a celle du chef
*/

getXpReel2(PERSONNAGE,XP):-getXpReel(PERSONNAGE,XPPERSONNAGE), getChef(PERSONNAGE,CHEF), getXpReel(CHEF,XPCHEF), XPPERSONNAGE < XPCHEF , XP is XPPERSONNAGE.
getXpReel2(PERSONNAGE,XP):-getXpReel(PERSONNAGE,XPPERSONNAGE), getChef(PERSONNAGE,CHEF), getXpReel(CHEF,XPCHEF), XPPERSONNAGE >= XPCHEF , XP is XPCHEF.

% --- PARTIE 2 ---

/*
X = 0 est la condition d'arret de la recurcive
Sinon on calcule la valeur X-1
Un factorielle est forcement positif donc on renvoit false si X est negatif
*/

factorielle(X,RESULTAT):-X = 0, RESULTAT is 1.
factorielle(X,RESULTAT):- X > 0, Y is X-1, factorielle(Y,PSEUDORESULTAT), RESULTAT is PSEUDORESULTAT*X.



% --- PARTIE 3 ---

% Suite Lucas = suite u et suite V

/*
La suite u est definit par :
	U0(P,Q) = 0
	U1(P,Q) = 1
	Un(P,Q) = P*U(n-1)(P,Q) - Q*U(n-2)(P,Q)
	
Les 2 premières lignes permettent de retrouver U0 et U1 
La derniere ligne c'est la boucle
*/

u(N,P,Q,RESULT):-N = 0, RESULT is 0.
u(N,P,Q,RESULT):-N = 1, RESULT is 1.
u(N,P,Q,RESULT):-N > -1, X is N-1, Y is N-2, u(X,P,Q,RES1), u(Y,P,Q,RES2), RESULT is P*RES1-Q*RES2.

/*
La suite v est definit par :
	V0(P,Q) = 2
	V1(P,Q) = P
	Vn(P,Q) = P*V(n-1)(P,Q) - Q*V(n-2)(P,Q)

On a donc : 
Les 2 premieres lignes qui permettent de retrouver V0 et V1 (conditions d'arret)
La derniere ligne correspond a la boucle
*/

v(N,P,Q,RESULT):-N = 0, RESULT is 2.
v(N,P,Q,RESULT):-N = 1, RESULT is P.
v(N,P,Q,RESULT):-N > -1, X is N-1, Y is N-2, v(X,P,Q,RES1), v(Y,P,Q,RES2), RESULT is P*RES1-Q*RES2.

/*
MAX nombre de boucle
N : nb d'iteration a laquelle on etait rendu
P et Q : variable pour les calcules
*/

calc(MAX,N,P,Q):-
N < MAX,
u(N,P,Q,RESULTU),
write( "\nPour N : " + N ),
write( "\nPour P : " + P ),
write( "\nPour Q : " + Q ),
write( "\nU --> " + RESULTU ),
v(N,P,Q,RESULTV),
write( "\nV --> " + RESULTV ),
NBIS is N+1,
calc(MAX,NBIS,P,Q).

/*
Verifie si la condition P*P-4*Q est different de 0,
Lance les calcules des suites U et V
*/

lucas(P,Q):-
RESULTAT is P*P-4*Q,
not( RESULTAT = 0 ),
calc(20,0,P,Q).