
:- table p/2.
tabled_predicate(p/2).

backtrack_and_print(Goal) :-
  call(Goal), write(Goal), nl, fail.
backtrack_and_print(_).

generate_calls(A, 0) :- !.
generate_calls(A, N) :- V is A + N,
                        backtrack_and_print(p(V, X)), fail.
generate_calls(A, N) :- N1 is N - 1,
                        generate_calls(A, N1).

debug_query :- backtrack_and_print(p(_, _)),
               generate_calls(123456780, 9),
               backtrack_and_print(p(X, X)),
               backtrack_and_print(p(123456788, _)),
               fail.

generate_longs(_, 0, _) :- !, fail.
generate_longs(A, N, V) :- V is A + N.
generate_longs(A, N, V) :- N1 is N - 1,
                           generate_longs(A, N1, V).

p(X, 2) :- generate_longs(123456780, 9, X).
p(X, 5) :- generate_longs(123456780, 9, X).
p(X, Y) :- generate_longs(123456788, 2, X),
           generate_longs(123456788, 2, Y).
p(123456788, X).
p(X, X).

