%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% File:      test_other01.pl
%% Author(s): Miguel Areias and Ricardo Rocha
%% Program:   Other tests
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

time_query:- t(X),
             fail.

debug_query:- t(X), 
              write(X), nl,
              fail.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- table t/1.
tabled_predicate(t/1).

t(X):- a(X).
t(X):- b(X).
t(X):- c(X).

a(1).
a(2).

b(3).
b(4).

c(5).
c(6).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
