% ---------- Family Facts ----------
% Children of Rakesh and Pramila
parent(rakesh, nita).
parent(pramila, nita).

parent(rakesh, mira).
parent(pramila, mira).

parent(rakesh, amit).
parent(pramila, amit).

parent(rakesh, abhishek).
parent(pramila, abhishek).

parent(rakesh, ankita).
parent(pramila, ankita).

% Nita and Nilesh
parent(nilesh, ravi).
parent(nita, ravi).

parent(nilesh, kiran).
parent(nita, kiran).

% Amit and Subhra
parent(amit, ramila).
parent(subhra, ramila).

% Abhishek and Kamla
parent(abhishek, kavita).
parent(kamla, kavita).

parent(abhishek, rohan).
parent(kamla, rohan).

% Ankita (single parent)
parent(ankita, sam).

% ---------- Gender ----------
male(rakesh).
male(nilesh).
male(amit).
male(abhishek).
male(ravi).
male(amitav).
male(sam).
male(rohan).

female(pramila).
female(nita).
female(mira).
female(subhra).
female(kamla).
female(kiran).
female(ramila).
female(kavita).
female(ankita).

% ---------- Marriages ----------
marriedto(rakesh, pramila).
marriedto(nita, nilesh).
marriedto(mira, amitav).
marriedto(amit, subhra).
marriedto(abhishek, kamla).

% Make marriedto symmetric
married(X, Y) :- marriedto(X, Y).
married(X, Y) :- marriedto(Y, X).

% ---------- Derived Relationships ----------

father(F, C) :- parent(F, C), male(F).
mother(M, C) :- parent(M, C), female(M).

son(S, P)     :- parent(P, S), male(S).
daughter(D, P):- parent(P, D), female(D).

sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y.

brother(B, X) :-
    sibling(B, X),
    male(B).

sister(S, X) :-
    sibling(S, X),
    female(S).

paternal_uncle(U, C) :-
    father(F, C),
    sibling(U, F),
    male(U).

maternal_uncle(U, C) :-
    mother(M, C),
    sibling(U, M),
    male(U).

paternal_aunt(A, C) :-
    father(F, C),
    sibling(A, F),
    female(A).

maternal_aunt(A, C) :-
    mother(M, C),
    sibling(A, M),
    female(A).

paternal_grandfather(GF, C) :-
    father(F, C),
    father(GF, F).

paternal_grandmother(GM, C) :-
    father(F, C),
    mother(GM, F).

maternal_grandfather(GF, C) :-
    mother(M, C),
    father(GF, M).

maternal_grandmother(GM, C) :-
    mother(M, C),
    mother(GM, M).

cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    sibling(P1, P2),
    X \= Y.

husband(H, W) :-
    married(H, W),
    male(H).

wife(W, H) :-
    married(H, W),
    female(W).

son_in_law(SIL, P) :-
    parent(P, C),
    married(C, SIL),
    male(SIL).

daughter_in_law(DIL, P) :-
    parent(P, C),
    married(C, DIL),
    female(DIL).

father_in_law(FIL, X) :-
    married(X, S),
    father(FIL, S).

mother_in_law(MIL, X) :-
    married(X, S),
    mother(MIL, S).
