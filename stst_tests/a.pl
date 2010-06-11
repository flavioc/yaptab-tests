
:- ['path_right_first', 'data/grid_64'].
:- yap_flag(tabling_mode, subsumptive).

debug_query :- path(_, _), fail.
time_query :- path(_, _), fail.
