-module(day1).
-export([word_count/1, count/0, matching/1]).


word_count([]) -> 1;

word_count([H|T]) ->
  if(H==($ )) -> 1 + word_count(T);
  true -> word_count(T)
  end.


count() -> count(1).

count(N) ->
  if
    (N<11) -> io:format("~w~n", [N]), count(N+1);
    true -> done
  end.


matching(M) ->
  case M of
    success -> io:format("Success!~n");
    {error, Message} -> io:format("Error: ~p~n",[Message])
  end.