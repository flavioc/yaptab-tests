%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% File:      yap_subsumptive_exec_answers.pl
%% Author(s): Flavio Cruz
%% Program:   Sets subsumptive tabling, exec answers and local scheduling for all predicates
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
:- yap_flag(tabling_mode, subsumptive).
:- yap_flag(tabling_mode, local).
:- yap_flag(tabling_mode, exec_answers).
