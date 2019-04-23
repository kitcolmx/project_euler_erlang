-module(problem7).
-export([main/0]).

%% I used brute-force method to solve this, althogh it took less than a minute

main() ->
  Limit = 10001,
  io:format("10001st prime number is ~p~n", [prime(Limit)]).

prime(Limit) -> prime(3, [2], Limit).

prime(Cur, Primes, Limit) when length(Primes) =:= Limit -> Cur - 1;
prime(Cur, Primes, Limit) ->
  case lists:all(fun(Prime) -> Cur rem Prime =/= 0 end, Primes) of
    true -> prime(Cur + 1, [Cur|Primes], Limit);
    false -> prime(Cur + 1, Primes, Limit)
  end.