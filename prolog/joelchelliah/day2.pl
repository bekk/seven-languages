/* Reverse the elements of a list. */

rev([],[]).
rev([Head|[]],[Head|[]]).
rev([Head|Tail],Rlist) :- rev(Tail,Rtail), append(Rtail, [Head], Rlist).


/* Find the smallest element of a list. */

smallest([],[]).
smallest([H|[]],H).
smallest([H|T], S) :- smallest(T, ST), S is min(H,ST).