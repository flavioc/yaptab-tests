
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
               generate_calls(0.5, 9),
               backtrack_and_print(p(X, X)),
               backtrack_and_print(p(3.14, _)),
               fail.

generate_floats(_, 0, _) :- !, fail.
generate_floats(A, N, V) :- V is A + N.
generate_floats(A, N, V) :- N1 is N - 1,
                           generate_floats(A, N1, V).

p(X, 2) :- generate_floats(0.5, 9, X).
p(X, 5) :- generate_floats(0.5, 9, X).
p(X, Y) :- generate_floats(3.14, 2, X),
           generate_floats(3.14, 2, Y).
p(3.14, X).
p(X, X).
