%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% File:      yap_subsumptive_exec_answers.pl
%% Author(s): Flavio Cruz
%% Program:   Sets subsumptive tabling and exec answers for all predicates
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- write('OLA').
:- yap_flag(tabling_mode,subsumptive).
:- yap_flag(tabling_mode,exec_answers).
