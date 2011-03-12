
:- consult('fib_fun.pl').

between_num(Num, Num, Num) :- !.
between_num(Num, Num, Max).
between_num(Num, Min, Max) :-
	Min1 is Min + 1,
	between_num(Num, Min1, Max).

% input parameter:
% big_fact(Number).

b(X) :- big_fact(Max), between_num(X, 1, Max).

:- table p/1.
:- table a/1.

a(0) :- b(X), p(X).
a(0).
a(0) :- p(_).

p(_) :- a(_), fib(32, X).

time_query :- a(X), fail.
