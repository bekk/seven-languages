-module(day_2).
-export([filter_by/2]).
-export([sum/1]).

filter_by([], _) -> false;
filter_by([{Language, Text}|_], Language) -> Text;
filter_by([{_, _}|Rest], Language) -> filter_by(Rest, Language).

sum([]) -> false;
sum(Items) -> [{Item, Quantity * Price} || {Item, Quantity, Price} <- Items].
