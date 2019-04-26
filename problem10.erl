-module(problem10).
-export([main/0]).

main() ->
  Primes = soe(2000000),
  Answer = lists:foldl(fun(X,Y) -> X + Y end, 0, Primes),
  io:format("The sum of all the primes below 2M is ~p~n",[Answer]).

soe(Max) -> soe(math:sqrt(Max), [], lists:seq(2,Max)).

soe(SqrtMax, Primes, [H|T]) when H > SqrtMax -> lists:reverse(Primes) ++ [H|T];
soe(SqrtMax, Primes, [H|T]) -> soe(SqrtMax, [H|Primes], lists:filter(fun(X) -> X rem H =/= 0 end, T)).
