ffvii(personnage(aeris,cetras,soin,19,10000),ifalna).
ffvii(personnage(ifalna,cetras,pnj,6,15000),cloud).
ffvii(personnage(cloud,soldat,heros,18,30000),cloud).
ffvii(personnage(tifa,equipe,guerrier,11,15000),barret).
ffvii(personnage(barret,equipe,guerrier,7,14000),cloud).
ffvii(personnage(rougexiii,equipe,soin,18,11000),barret).
ffvii(personnage(yuffie,equipe,ninja,8,2000),barret).


% N = Nom
% E = Equipe
% R = Role
% P = Popularité
% X = XP
% C = Chef
group(E) :- ffvii(personnage(_,E,_,_,_),_).