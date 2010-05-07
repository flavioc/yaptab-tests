
:- ['reach_left_first', 'data/trans_leader'].

time_query :- reach(systemLeader_0(5,end), par(0,one_node_0(1,2,0,5,end), A, B)), fail.
