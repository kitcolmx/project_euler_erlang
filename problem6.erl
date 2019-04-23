-module(problem6).
-export([main/0]).

main()->
  Answer = solve(100),
  io:format("Sum square difference: ~p~n", [Answer]).

solve(Num) when Num > 0 ->
  Sum_of_square = lists:foldl(fun(Cur, Acc) -> Acc + Cur * Cur end, 0, lists:seq(1,Num)),
  Square_of_sum = trunc(math:pow((Num * (Num + 1)) div 2, 2)),
  Square_of_sum - Sum_of_square;
solve(_) ->
  false.