princess(blanche-neige).
princess(belle-au-bois-dormant).
princess(cendrillon).
princess(petite-sirene).
princess(belle).

nain(simplet).
nain(grincheux).
nain(prof).
nain(timide).
nain(joyeux).
nain(atchoum).
nain(dormeur).

prince(charmant).

belle(X):-princess(X).
barbu(X):-nain(X).

personnage(X):-princess(X);prince(X);nain(X).

fatigue(dormeur).
fatigue(cendrillon).

personnage_fatigue(X):-personnage(X),fatigue(X).

glabre(X):-personnage(X),not(barbu(X)).
