-module(problem3).
-export([main/0]).

main() ->
  Number = 600851475143,
  io:format("Largest prime factor of ~p is ~p~n", [Number, solve(Number)]).

%% solve(100, [2], []) -> solve(50, [2], [2])
%% solve(50, [2], [2]) -> solve(25, [2], [2, 2])
%% solve(25, [2], [2, 2]) ->  -> solve(25, [3, 2], [2, 2])
solve(Num) -> solve(Num, [2], []).
solve(1, _, [LargestPrime|_]) -> LargestPrime;
solve(Num, [LargestPrime|OtherPrimes], Component) 
  when Num rem LargestPrime =:= 0 ->
    solve(Num div LargestPrime, [LargestPrime|OtherPrimes], [LargestPrime|Component]);
solve(Num, [LargestPrime|OtherPrimes], Component) ->
  NewPrimesList = prime(LargestPrime + 1, [LargestPrime|OtherPrimes]),
  solve(Num, NewPrimesList, Component).

%% prime(6, [5,3,2]) -> prime(7, [5,3,2])
%% prime(7, [5,3,2]) -> [7,5,3,2]
prime(Cur, Primes) ->
  case lists:all(fun(Prime) -> Cur rem Prime =/= 0 end, Primes) of
    true -> [Cur|Primes];
    false -> prime(Cur + 1, Primes)
  end.