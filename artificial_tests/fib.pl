:- consult('fib_fun.pl').

% input parameter
% fib_fact(Number).

do_fib(X) :- fib_fact(T), fib(T, X).

:- table p/2.

a(X) :- p(1,X).
p(1,2).
p(1,X) :- do_fib(X).

time_query :- a(A), p(B, C), fail.
