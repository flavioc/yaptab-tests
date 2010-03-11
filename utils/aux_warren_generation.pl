%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% File:      aux_edge_warren_generator.pl
%% Author(s): Miguel Areias and Ricardo Rocha
%% Program:   edge generator for David Warren tests
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

warren01(Depth):-
   atomic_concat(['data_edge_warren01_',Depth,'.pl'],File),
   atomic_concat(['Pyramid configuration with depth ',Depth],Program),
   open(File,'write',FO),
   tell(FO),
   write_header(File,Program),
   K is Depth//2-1,
   edge_warren01(K),
   write_footer,
   close(FO).


edge_warren01(0):- write_edge(0,a,1),
   	           write_edge(1,b,2),!.
edge_warren01(K):-
	K1 is K-1,
	edge_warren01(K1),
	K2 is 2*K,
	K2_1 is 2*K+1,
	K2_2 is 2*K+2,
	write_edge(K2,a,K2_1),
	write_edge(K2_1,b,K2_2).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

write_header(File,Program):- 
   write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), nl,
   write('%%'), nl,
   write('%% File:      '), write(File), nl,
   write('%% Author(s): Miguel Areias and Ricardo Rocha'), nl,
   write('%% Program:   '), write(Program), nl,
   write('%%'), nl,
   write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), nl,
   nl.

write_footer:- 
   nl, write('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'), nl.

write_edge(X1,X2,X3) :- 
   write('edge('), write(X1), write(','), write(X2), write(','), write(X3),write(').'), nl.


