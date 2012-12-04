-module(day2).
-export([getval/2, comp/1, tictactoe/1]).

getval(List, Key) ->
  [{_, Answer}] = lists:filter(fun({K, _}) -> K == Key end, List),
  Answer.


comp(List) -> [{Item, Quantity * Price} || {Item, Quantity, Price} <- List].


tictactoe([V,V,V,_,_,_,_,_,_]) -> V;
tictactoe([_,_,_,V,V,V,_,_,_]) -> V;
tictactoe([_,_,_,_,_,_,V,V,V]) -> V;
tictactoe([V,_,_,V,_,_,V,_,_]) -> V;
tictactoe([_,V,_,_,V,_,_,V,_]) -> V;
tictactoe([_,_,V,_,_,V,_,_,V]) -> V;
tictactoe([V,_,_,_,V,_,_,_,V]) -> V;
tictactoe([_,_,V,_,V,_,V,_,_]) -> V;
tictactoe(Board) ->
  Res = lists:filter(fun(X) -> (X/=o) and (X/=x) end, Board),
  case Res of
    [] -> cat;
    _ -> no_winner
  end.