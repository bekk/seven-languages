-module(day2).
-export([getval/2, comp/1, tictactoe/1]).

% Consider a list of keyword-value tuples, such as [{erlang, "a functional lan- guage"}, {ruby, "an OO language"}].
% Write a function that accepts the list and a keyword and returns the associated value for the keyword.

getval(List, Key) ->
  [{_, Answer}] = lists:filter(fun({K, _}) -> K == Key end, List),
  Answer.


% Consider a shopping list that looks like [{item, quantity, price}, ...]. Write a list comprehension that
% builds a list of items of the form [{item, total_price}, ...], where total_price is quantity times price.

comp(List) -> [{Item, Quantity * Price} || {Item, Quantity, Price} <- List].


% Write a program that reads a tic-tac-toe board presented as a list or a tuple of size nine. Return
% the winner (x or o) if a winner has been deter- mined, cat if there are no more possible moves,
% or no_winner if no player has won yet.

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