
:- ['data/grid_16', 'path_double_last'].

time_query :- path(X, 1), fail.

debug_query :- path(X, 1), write(X), nl, fail.
