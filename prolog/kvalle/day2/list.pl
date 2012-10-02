reversed([Head], [Head|[]]).

reversed(Reversed, [Head|Tail]) :- 
	reversed(ReversedTail, Tail), 
	append(ReversedTail, [Head], Reversed).

/*
| ?- reversed(R, [1,2,3,4,5,6]).

R = [6,5,4,3,2,1] ? 
*/


min([Head|[]], Head).

min([Head|Tail], Min) :- 
	min(Tail, TailMin), 
	TailMin < Head, 
	Min is TailMin.

min([Head|Tail], Min) :- 
	min(Tail, TailMin), 
	TailMin >= Head, 
	Min is Head.

/*
| ?- min([4,2,5,7,4,1,4,8], Min).

Min = 1 ?
*/


sorted([Head], [Head|[]]).

sorted([Min|SortedRest], List) :- 
	min(List, Min), 
	append(L1, [Min|L2], List),
	append(L1, L2, Rest),
	sorted(SortedRest, Rest).

/*
| ?- sorted(S, [3,3,5,1,2,7,1,4]).

S = [1,1,2,3,3,4,5,7] ? 
*/