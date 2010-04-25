% internal subsumptive generator with a single subsumed external dependency.
% some repeated answers are generated for this test, but that is OK.

:- table p/2.
:- table t/2.

:- use_grounded_tabling p/2.
:- use_subsumptive_tabling t/2.
:- yap_flag(tabling_mode, load_answers).

p(1, Y) :- e(1, Y), t(A, B).
p(2, 3).
p(5, 6).
p(1, 5).
p(1, 7).

e(1, 4).
e(1, 2).

t(5, 6).
t(1, 6).
t(1, 7).

debug_query :- p(1, X), t(1, Y), p(A, B), write((X, Y, A, B)), nl, fail.
