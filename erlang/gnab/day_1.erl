-module(day_1).
-export([word_count/1]).

word_count([]) -> 0;
word_count([32|Rest]) -> word_count(Rest);
word_count([_|[32|Rest]]) -> 1 + word_count(Rest);
word_count([32]) -> 0;
word_count([_]) -> 1;
word_count([_|Rest]) -> word_count(Rest).
