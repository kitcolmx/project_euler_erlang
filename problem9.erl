-module(problem9).
-export([main/0]).

main() ->
  N = 1000,
  [Answer] = [ A*B*(N-A-B) ||
    A <- lists:seq(1,N-2),
    B <- lists:seq(A+1,N-1),
    (A-1000)*(B-1000) =:= 500000
  ],
  io:format("abc = ~p~n", [Answer]).