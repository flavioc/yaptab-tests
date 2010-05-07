
:- ['reach_left_last', 'data/trans_leader'].

time_query :- reach(systemLeader_0(5,end), par(D, E, A, B)), fail.

%:- yap_flag(tabling_mode, grounded).

%:- time_query.
