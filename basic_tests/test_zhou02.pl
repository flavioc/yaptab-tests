%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% File:      test_zhou02.pl
%% Author(s): Miguel Areias and Ricardo Rocha
%% Program:   Example taken from one of Zhou's paper
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

time_query:- p(X,Y,Z),
             fail.

debug_query:- p(X,Y,Z),
              write(X), write(' - '), write(Y), write(' - '), write(Z), nl,
              fail.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- table p/3.
tabled_predicate(p/3).

p(a,b,c).
p(X,Y,Z):- p(Z,X,Y).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
