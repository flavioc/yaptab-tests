%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% File:      test_single02.pl
%% Author(s): Miguel Areias and Ricardo Rocha
%% Program:   Tests the use of the table_try_single instruction
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

time_query:- t(X),
             fail.

debug_query:- t(X), 
              write(X), nl,
              fail.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- table t/1.
:- table a/1.
:- table b/1.
:- table c/1.
tabled_predicate(t/1).
tabled_predicate(a/1).
tabled_predicate(b/1).
tabled_predicate(c/1).

t(X):- a(X), a(X).

a(X):- b(X).

b(X):- c(X).
b(3).

c(Y):- a(X), Y is 2.
c(1).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
