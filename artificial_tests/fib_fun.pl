
fib(0, 0) :- !.
fib(1, 1) :- !.
fib(X, V) :-
	X > 1,
  X1 is X - 1,
  X2 is X - 2,
  fib(X1, V1),
  fib(X2, V2),
  V is V1 + V2.

