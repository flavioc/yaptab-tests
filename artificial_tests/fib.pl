
fib(0, 0) :- !.
fib(1, 1) :- !.
fib(X, V) :-
	X > 1,
  X1 is X - 1,
  X2 is X - 2,
  fib(X1, V1),
  fib(X2, V2),
  V is V1 + V2.

% input parameter
% fib_fact(Number).

do_fib(X) :- fib_fact(T), fib(T, X).

:- table p/2.

a(X) :- p(1,X).
p(1,2).
p(1,X) :- do_fib(X).

time_query :- a(A), p(B, C), fail.
