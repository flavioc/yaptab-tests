%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% File:      test_path_right_first.pl
%% Author(s): Miguel Areias and Ricardo Rocha
%% Program:   Right recursive path definition 
%%            with the recursive clause first
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

time_query:- path(X,Y),
             fail.

debug_query:- path(X,Y),
              write(X), write(' - '), write(Y), nl,
              fail.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- table path/2.
tabled_predicate(path/2).

path(X,Z):- edge(X,Y), path(Y,Z).
path(X,Z):- edge(X,Z).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
