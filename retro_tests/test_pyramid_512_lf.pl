
:- ['data/pyramid_512', 'path_left_first'].

time_query :- path(X, 1), fail.

debug_query :- path(X, 1), write(X), nl, fail.
