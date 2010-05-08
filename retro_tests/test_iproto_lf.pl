
:- ['reach_left_first.pl', 'data/trans_iproto.pl'].

time_query:- reach(iproto_0(_,_,end),imain_7_0(A,B,C,D,E)), fail.

debug_query :- Query = reach(iproto_0(_,_,end),imain_7_0(A,B,C,D,E)),
               call(Query),
               numbervars(Query, 0, _),
               write(Query), nl, fail.
