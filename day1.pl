parent(nilesh, ravi).
parent(nita, kiran).
parent(nilesh, kiran).
parent(nita, ravi).
parent(rakesh, nita).
parent(pramila, nita).
parent(mira, amitav).
parent(rakesh, mira).
parent(pramila, mira).
parent(amit, ramila).
parent(subhra, ramila).
parent(rakesh, amit).
parent(pramila, amit).
parent(abhishek, kavita).
parent(kamla, kavita).
parent(rakesh, abhishek).
parent(pramila, abhishek).
parent(ankita,sam).

male(rakesh).
male(nilesh).
male(amit).
male(abhishek).
male(ravi).
male(amitav).

female(pramila).
female(nita).
female(mira).
female(subhra).
female(kamla).
female(kiran).
female(ramila).
female(kavita).

marriedto(rakesh, pramila).
marriedto(nilesh, nita).
marriedto(amit, subhra).
marriedto(abhishek, kamla).

mother(X, Y) :- parent(X, Y), female(X).
father(X, Y) :- parent(X, Y), male(X).

son(X, Y) :- parent(Y, X), male(X).
daughter(X, Y) :- parent(Y, X), female(X).

siblings(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

uncle(X, Y) :- parent(Z, Y), siblings(X, Z), male(X).
aunt(X, Y) :- parent(Z, Y), siblings(X, Z), female(X).

mgm(X, Y) :- mother(Z, Y), mother(X, Z).
mgf(X, Y) :- mother(Z, Y), father(X, Z).
pgf(X, Y) :- father(Z, Y), father(X, Z).
pgm(X, Y) :- father(Z, Y), mother(X, Z).

wife(X, Y) :- marriedto(Y, X), female(X).

sil(X, Y) :- parent(Y, Z), marriedto(X, Z), male(X).
dil(X, Y) :- parent(Y, Z), marriedto(Z, X), female(X).
