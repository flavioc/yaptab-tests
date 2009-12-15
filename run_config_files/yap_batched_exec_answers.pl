%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% File:      yap_batched_exec_answers.pl
%% Author(s): Miguel Areias and Ricardo Rocha
%% Program:   Sets the default tabling mode for all tabled predicates
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- yap_flag(tabling_mode,batched).
:- yap_flag(tabling_mode,exec_answers).
