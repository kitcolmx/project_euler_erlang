-module(problem1).
-export([main/0]).

main() ->
  Answer = add_multiples_of_three_or_five_below(1000),
  io:format("The sum of all the multiples of 3 or 5 below 1000 is ~p~n", [Answer]).

add_multiples_of_three_or_five_below(Num) -> add_multiples_of_three_or_five_below(Num - 1, 0).

add_multiples_of_three_or_five_below(0, Acc) -> Acc;
add_multiples_of_three_or_five_below(Num, Acc)
  when Num rem 3 =:= 0; Num rem 5 =:= 0 ->
    add_multiples_of_three_or_five_below(Num - 1, Num + Acc);
add_multiples_of_three_or_five_below(Num, Acc) ->
  add_multiples_of_three_or_five_below(Num - 1, Acc).