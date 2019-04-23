-module(problem4).
-export([main/0]).

main() ->
  Answer = gen_plaindrome(),
  io:format("Largest plaindrome product of two 3-digit numbers is ~p~n", [Answer]).

gen_plaindrome() ->
  Product = [A * B || A <- lists:seq(100, 999), B <- lists:seq(100, 999)],
  Plaindrome = lists:filter(fun is_plaindrome_product/1, Product),
  lists:foldl(fun erlang:max/2, 0, Plaindrome).

is_plaindrome_product(Num) when Num >= 10000, Num =< 99999 ->
  [D1,D2,_,D4,D5] = [Char - 48 || Char <- integer_to_list(Num)],
  if D1 =:= D5 andalso D2 =:= D4 -> true;
     true -> false
  end;
is_plaindrome_product(Num) when Num >= 100000, Num =< 999999 ->
  [D1,D2,D3,D4,D5,D6] = [Char - 48 || Char <- integer_to_list(Num)],
  if D1 =:= D6 andalso D2 =:= D5 andalso D3 =:= D4 -> true;
     true -> false
  end;
is_plaindrome_product(Num) when Num >= 1000000 ->
  [D1,D2,D3,_,D5,D6,D7] = [Char - 48 || Char <- integer_to_list(Num)],
  if D1 =:= D7 andalso D2 =:= D6 andalso D3 =:= D5 -> true;
     true -> false
  end.