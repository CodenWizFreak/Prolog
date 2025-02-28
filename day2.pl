% Factorial of a number
factorial(0, 1).
factorial(N, F) :- N > 0,N1 is N - 1, factorial(N1, F1),F is N * F1.

% GCD of two numbers
gcd(X, 0, X).
gcd(X, Y, G) :-  Y > 0, R is X mod Y, gcd(Y, R, G).

% Maximum of two numbers
max(X, Y, X) :- X >= Y.
max(X, Y, Y) :- Y > X.

% Minimum of two numbers
min(X, Y, X) :- X =< Y.
min(X, Y, Y) :- Y < X.

% Maximum of three numbers
max3(A, B, C, M) :- max(A, B, J),max(J, C, M).

% Minimum of three numbers
min3(A, B, C, M) :- min(A, B, J),min(J, C, M).

% Check if a number is even or odd
even_odd(N) :- (N mod 2 =:= 0)-> write("even");write("odd").

% Dynamic Line chart
change(M,X1,X2,X3,X4,Y1,Y2,Y3,Y4):-
    Y1 is M*X1+0.5,Y2 is M*X2+0.5,Y3 is M*X3+0.5,Y4 is M*X4+0.5.

% Ohm Law
ohm(V, I, R) :- var(V), V is I * R.
ohm(V, I, R) :- var(I), I is V / R.
ohm(V, I, R) :- var(R), R is V / I.

menu :-
    write('1. Voltage (V)  2. Current (I)  3. Resistance (R)\nEnter choice: '),
    read(Ch),
    ( Ch = 1 -> write('I: '), read(I), write('R: '), read(R), ohm(V, I, R), format('V = ~2f V~n', [V])
    ; Ch = 2 -> write('V: '), read(V), write('R: '), read(R), ohm(V, I, R), format('I = ~2f A~n', [I])
    ; Ch = 3 -> write('V: '), read(V), write('I: '), read(I), ohm(V, I, R), format('R = ~2f O~n', [R])
    ; write('Invalid choice!')).

start :- menu.
