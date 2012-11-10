-module(day2).
-export([lookup/2, checkout/1]).

% Consider a list of keyword-value tuples, such as 
% [{erlang, "a functional language"}, {ruby, "an OO-language"}]. 
% Write a function that accepts the list and a keyword and returns 
% the associated value for the keyword.

lookup([], _) -> false;
lookup([{Key, Message}|_], Key) -> Message;
lookup([_|T], Key) -> lookup(T, Key).

	% Example:

	% 6> List.                                                                
	% [{erlang,"a functional language"},{ruby,"an OO-language"}]
	% 7> day2:lookup(List, erlang).
	% "a functional language"
	% 8> day2:lookup(List, ruby).  
	% "an OO-language"
	% 9> day2:lookup(List, haskell).
	% []

% Consider a shopping list that looks like [{item, quantity, price}, ...]. 
% Write a list comprehension that builds a list of items of the form 
% [{item, total_price}, ...], where total_price is quantity times price.

checkout(List) -> [{Item, Quantity * Price} || {Item, Quantity, Price} <- List].

	% Example

	% 13> Shopping = [{banana, 0, 6}, {beer, 12, 80}, {cake, 1, 200}].
	% [{banana,0,6},{beer,12,80},{cake,1,200}]
	% 14> day2:checkout(Shopping).
	% [{banana,0},{beer,960},{cake,200}]

