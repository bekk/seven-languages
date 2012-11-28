-module(day_1).
-export([word_count/1]).
-export([count_to_ten/0]).
-export([count_to_ten/1]).
-export([success_or_error/1]).

word_count([]) -> 0;
word_count([32|Rest]) -> word_count(Rest);
word_count([_|[32|Rest]]) -> 1 + word_count(Rest);
word_count([32]) -> 0;
word_count([_]) -> 1;
word_count([_|Rest]) -> word_count(Rest).

count_to_ten() -> count_to_ten(1).
count_to_ten(10) -> io:format("10~n");
count_to_ten(N) -> io:format("~p~n", [N]), count_to_ten(N+1).

success_or_error({error, Message}) -> io:format("error: ~p~n", [Message]);
success_or_error(success) -> io:format("success~n").
