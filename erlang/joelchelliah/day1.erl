-module(day1).
-export([word_count/1, count/0, matching/1]).

% Write a function that uses recursion to return the number of words in a string.

word_count([]) -> 1;
word_count([H|T]) ->
  if(H==($ )) -> 1 + word_count(T);
  true -> word_count(T)
  end.


% Write a function that uses recursion to count to ten.

count() -> count(1).
count(N) ->
  if
    (N<11) -> io:format("~w~n", [N]), count(N+1);
    true -> done
  end.


%   Write a function that uses matching to selectively print “success” or
%  “error: message” given input of the form {error, Message} or success.

matching(M) ->
  case M of
    success -> io:format("Success!~n");
    {error, Message} -> io:format("Error: ~p~n",[Message])
  end.