
:- ['reach_left_last', 'data/trans_sieve'].

time_query :- reach(sieve_0(5,4,27,end), par(D, E, A, B)), fail.

debug_query :- Query = reach(sieve_0(5,4,27,end), par(A, B, C, D)),
               call(Query),
               numbervars(Query, 0, _),
               write(Query), nl, fail.
