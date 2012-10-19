rev([A], [A]).
rev([Head|Tail], R) :- rev(Tail, RR), append(RR, [Head], R).

min([A], A).
min([Head|Tail], M) :- min(Tail, N), (Head < N -> M = Head ; M = N).

srt([A], [A]).
srt(List, [M|S]) :- 
  min(List, M), 
  append(B, [M|A], List), 
  append(B, A, L),
  srt(L, S).
