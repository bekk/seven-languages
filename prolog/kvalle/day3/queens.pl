cols_in_range([]).
cols_in_range([Col|Tail]) :-
  member(Col, [1,2,3,4,5,6,7,8]),
  cols_in_range(Tail).

d1([], []).
d1([(Row, Col)|QueensTail], [Diagonal|DiagonalsTail]) :- 
  Diagonal is Col - Row, 
  d1(QueensTail, DiagonalsTail).

d2([], []).
d2([(Row, Col)|QueensTail], [Diagonal|DiagonalsTail]) :- 
  Diagonal is Col + Row, 
  d2(QueensTail, DiagonalsTail).

queens(Cols) :- 
  Cols = [C1, C2, C3, C4, C5, C6, C7, C8],
  cols_in_range(Cols),
  fd_all_different(Cols),

  Queens = [(1, C1), (2, C2), (3, C3), (4, C4), (5, C5), (6, C6), (7, C7), (8, C8)], 
  d1(Queens, Diags1),
  d2(Queens, Diags2),
  fd_all_different(Diags1),
  fd_all_different(Diags2).

/*
| ?- queens([A,B,C,D,E,F,G,H]).

A = 1
B = 5
C = 8
D = 6
E = 3
F = 7
G = 2
H = 4 ? ;

A = 1
B = 6
C = 8
D = 3
E = 7
F = 4
G = 2
H = 5 ? ;

A = 1
B = 7
C = 4
D = 6
E = 8
F = 2
G = 5
H = 3 ? 

(384 ms) yes
*/