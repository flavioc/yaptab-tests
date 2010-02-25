%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% File:      yap_subsumptive_load_answers.pl
%% Author(s): Flavio Cruz
%% Program:   Sets subsumptive tabling and load answers for all predicates
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- yap_flag(tabling_mode,subsumptive).
:- yap_flag(tabling_mode,load_answers).
