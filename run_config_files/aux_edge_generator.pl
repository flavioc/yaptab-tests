%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% File:      aux_edge_generator.pl
%% Author(s): Miguel Areias and Ricardo Rocha
%% Program:   edge generator for path tests
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

btree(Depth):-
   atomic_concat(['data_edge_btree_',Depth,'.pl'],File),
   atomic_concat(['Binary tree configuration with depth ',Depth],Program),
   open(File,'write',FO),
   tell(FO),
   write_header(File,Program),
   edge_btree(Depth,1),
   write_footer,
   close(FO).

edge_btree(1,_):- 
   !.
edge_btree(X,Z):- 
   Z1 is Z*2, write_edge(Z,Z1),
   Z2 is Z*2+1, write_edge(Z,Z2),
   X1 is X-1, edge_btree(X1,Z1), edge_btree(X1,Z2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

grid(Depth):-
   atomic_concat(['data_edge_grid_',Depth,'.pl'],File),
   atomic_concat(['Grid configuration with depth ',Depth],Program),
   open(File,'write',FO),
   tell(FO),
   write_header(File,Program),
   edge_grid_rows(Depth,1,Depth),
   edge_grid_cols(Depth,1,Depth),
   write_footer,
   close(FO).

edge_grid_rows(0,_,_):- 
   !.
edge_grid_rows(X,Z,Size):- 
   write_line(Size,Z,1), 
   X1 is X-1, Z1 is Z+Size, edge_grid_rows(X1,Z1,Size).

edge_grid_cols(0,_,_):- 
   !.
edge_grid_cols(X,Z,Size):- 
   write_line(Size,Z,Size), 
   X1 is X-1, Z1 is Z+1, edge_grid_cols(X1,Z1,Size).  

write_line(1,_,_):- 
   !.
write_line(X,Z,Step):- 
   Z1 is Z+Step, write_edge(Z,Z1), write_edge(Z1,Z),
   X1 is X-1, write_line(X1,Z1,Step).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pyramid(Depth):-
   atomic_concat(['data_edge_pyramid_',Depth,'.pl'],File),
   atomic_concat(['Pyramid configuration with depth ',Depth],Program),
   open(File,'write',FO),
   tell(FO),
   write_header(File,Program),
   edge_pyramid(Depth,1),
   write_footer,
   close(FO).

edge_pyramid(1,Z):- 
   !, Z1 is Z+1, write_edge(Z,Z1).
edge_pyramid(X,Z):- 
   Z1 is Z+1, write_edge(Z,Z1),
   Z2 is Z+2, write_edge(Z,Z2),
   Z3 is Z+3, write_edge(Z1,Z3),
   X1 is X-1, Z4 is Z+4, edge_pyramid(X1,Z2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cycle(Depth):- 
   atomic_concat(['data_edge_cycle_',Depth,'.pl'],File),
   atomic_concat(['Cycle configuration with depth ',Depth],Program),
   open(File,'write',FO),
   tell(FO),
   write_header(File,Program),
   edge_cycle(Depth,1),
   write_footer,
   close(FO).

edge_cycle(1,Z):-
   !, write_edge(Z,1).
edge_cycle(X,Z):- 
   Z1 is Z+1, write_edge(Z,Z1), 
   X1 is X-1, edge_cycle(X1,Z1).

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

write_edge(X,Z) :- 
   write('edge('), write(X), write(','), write(Z), write(').'), nl.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
