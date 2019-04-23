-module(problem2).
-export([main/0]).

main() ->
  Answer = even_fib_below_4m(),
  io:format("The sum of the even-valued terms in the Fib-sequence is ~p~n", [Answer]).

even_fib_below_4m() -> even_fib_below_4m(1, 2, 0).

even_fib_below_4m(_, Curr, Sum) when Curr > 4000000 -> Sum; 
even_fib_below_4m(Prev, Curr, Sum) when Curr rem 2 =:= 0 ->
  even_fib_below_4m(Curr, Prev + Curr, Sum + Curr);
even_fib_below_4m(Prev, Curr, Sum) ->
  even_fib_below_4m(Curr, Prev + Curr, Sum).