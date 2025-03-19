% Predicate to check if an element is in a list
find(X, [X|_]). find(X, [_|T]) :- find(X, T).

% Predication checking
vowel(X) :- find(X, ['a', 'e', 'i', 'o', 'u']).
digit(X) :- find(X, [0,1,2,3,4,5,6,7,8,9]).
spl_char(X) :- find(X, ['!', '@', '#', '.', ':']).
octal(X) :- find(X, [0,1,2,3,4,5,6,7]).
hexa(X) :- find(X, [0,1,2,3,4,5,6,7,8,9,'a','b','c','d','e','f']).

% Count elements in a list
counter([], 0).
counter([_|T], N) :- counter(T, N1), N is N1 + 1.

% Sum elements in a list
sum([], 0).
sum([H|T], N) :- sum(T, N1), N is N1 + H.

% Find K-th element in a list
k_ele([H|_], 1, H).
k_ele([_|T], K, N) :- K1 is K - 1, k_ele(T, K1, N).

% Logic Gates
and(X, Y, N) :- (X =:= 1, Y =:= 1 -> N is 1; N is 0).
or(X, Y, N) :- (X =:= 0, Y =:= 0 -> N is 0; N is 1).
not(X, N) :- (X =:= 0 -> N is 1; N is 0).
nand(X, Y, N) :- (X =:= 1, Y =:= 1 -> N is 0; N is 1).
nor(X, Y, N) :- (X =:= 0, Y =:= 0 -> N is 1; N is 0).
xor(X, Y, N) :- (X =\= Y -> N is 1; N is 0).
xnor(X, Y, N) :- (X =:= Y -> N is 1; N is 0).

cirl(X, Y, N) :-
    and(X, Y, N1),or(X, Y, N2),xor(X, Y, N3),nand(N1, N2, N4),or(N4, N3, N).

cirl(A, B, C, D, E, F, N) :-
    and(A,B, N1),or(C, D, N2),xor(E, F, N3),nand(N1, N2, N4),or(N4, N3, N).

% Print truth table
tt1() :-
    writeln('| A | B | AND | OR | NAND | NOR | XOR | XNOR | CIRL |'),
    writeln('|---|---|-----|----|------|-----|-----|------|------|'),
    forall((member(A, [0,1]), member(B, [0,1])),(
            and(A, B, Y1),or(A, B, Y2),nand(A, B, Y3),nor(A, B, Y4),
            xor(A, B, Y5),xnor(A, B, Y6),cirl(A, B, Y7),
            format('| ~w | ~w |  ~w  |  ~w |   ~w  |  ~w  |  ~w  |   ~w  |   ~w  |\n',
                   [A, B, Y1, Y2, Y3, Y4, Y5, Y6, Y7]))).

tt2() :-
    writeln('| A | B | C | D | E | F | CIRL |'),
    writeln('|---|---|---|---|---|---|------|'),
    forall((member(A, [0,1]), member(B, [0,1]), member(C, [0,1]), member(D, [0,1]), member(E, [0,1]), member(F, [0,1])),(
        cirl(A, B, C, D, E, F, Y), ( Y =:= 0 ->
        format('| ~w | ~w | ~w | ~w | ~w | ~w |   ~w  |\n',
                   [A, B, C, D, E, F, Y]));write(''))).
