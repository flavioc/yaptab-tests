
:- ['anc_r', 'data/cycle_4096'].

time_query :- anc_r(f(X), f(Y)), fail.
