%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% File:      test_reach_left_first.pl
%% Author(s): Miguel Areias and Ricardo Rocha
%% Program:   Left recursive reach definition 
%%            with the recursive clause first
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- table reach/2.
tabled_predicate(reach/2).

reach(X,Z):- reach(X,Y), trans(Y,_,Z).
reach(X,Z):- trans(X,_,Z).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
