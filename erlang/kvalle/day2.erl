-module(day2).
-export([lookup/2, checkout/1,tictactoe/1]).


% Consider a list of keyword-value tuples, such as 
% [{erlang, "a functional language"}, {ruby, "an OO-language"}]. 
% Write a function that accepts the list and a keyword and returns 
% the associated value for the keyword.

lookup([], _) -> false;
lookup([{Key, Message}|_], Key) -> Message;
lookup([_|T], Key) -> lookup(T, Key).


% Consider a shopping list that looks like [{item, quantity, price}, ...]. 
% Write a list comprehension that builds a list of items of the form 
% [{item, total_price}, ...], where total_price is quantity times price.

checkout(List) -> [{Item, Quantity * Price} || {Item, Quantity, Price} <- List].


% Bonus problem:
% Write a program that reads a tic-tac-toe board presented as a list or a 
% tuple of size nine. Return the winner (x or o) if a winner has been 
% determined, cat if there are no more possible moves, or no_winner if no 
% player has won yet.

moves_left(Board) -> lists:filter(fun(X) -> X/=x andalso X/=o end, Board).

tictactoe([C1,C2,C3,C4,C5,C6,C7,C8,C9]) -> 
	Rows = [[C1,C2,C3],[C4,C5,C6],[C7,C8,C9]],
	Cols = [[C1,C4,C7],[C2,C5,C8],[C3,C6,C9]],
	Diags = [[C1,C5,C9],[C3,C5,C7]],
	
	Winner = [P || 
		P <- [x,o], 
		Line <- Rows ++ Cols ++ Diags,
		lists:all(fun(C) -> C==P end, Line)
	],
	
	case Winner of
		[] -> 
			case moves_left(lists:flatten(Rows)) of
				0 -> cat;
				_ -> no_winner
			end;
		[W|_] -> W
	end.