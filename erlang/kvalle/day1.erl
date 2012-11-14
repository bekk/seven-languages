-module(day1).
-export([words/1,count/0,select/1]).

% Write a function that uses recursion to return the number of words in a string.

words([]) -> 0;
words([_|String]) -> 
	Rest = lists:dropwhile(fun(E) -> E/=32 end, String),
	1 + words(Rest).

% Write a function that uses recursion to count to ten.

print(N) -> io:fwrite("~p ",[N]).

count(10) -> print(10);
count(N) -> print(N), 
	count(N+1).

count() -> count(1).

% Write a function that uses matching to selectively print "success"
% or "error: message" given input of the form {error, Message} or success.

select(success) -> io:fwrite("success~n",[]);
select({error, Message}) -> io:fwrite("error: ~p~n",[Message]).
