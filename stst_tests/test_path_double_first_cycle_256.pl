
:- ['path_double_first', 'data/cycle_256'].

time_query :- path(f(X), f(Y)), fail.
