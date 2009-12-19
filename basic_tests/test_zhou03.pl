%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% File:      test_zhou03.pl
%% Author(s): Miguel Areias and Ricardo Rocha
%% Program:   Example taken from one of Zhou's paper
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

time_query :- reach(a,X),
              fail.

debug_query:- reach(a,X),
              write(X), nl,
              fail.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- table reach/2.
tabled_predicate(reach/2).

reach(X,Y):- reach(X,Z), edge(Z,Y).
reach(X,X).
reach(X,d).

edge(a,b).
edge(d,e).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
