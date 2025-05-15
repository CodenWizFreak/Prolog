% Implementation of Bubble Sort (with output)
% ?_bubblesort([4,5,8,2,3,1,9],L).
% L=[1,2,3,4,5,8,9].

bubblesort(L,L1):-
  (bubble(L,L2)
  ->bubblesort(L2,L1)
  ;L=L1).

bubble([A,B|T],L):-
  (A>B
  ->L=[B,A|T]
  ;L=[A|L1],
  bubble([B|T],L1)).
