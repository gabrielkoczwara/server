-module(client).
-export([echo/2, plus/3, minus/3]).

echo(Server, X) ->
    Server ! {self(), echo, X},
    receive
        {Server, echo, Y} ->
            Y
    after
        1000 ->
            error
    end.

plus(Server, A, B) ->
    Server ! {self(), plus, A, B},
    receive
        {Server, plus, X} ->
            X
    after
        1000 ->
            error
    end.

minus(Server, A, B) ->
    Server ! {self(), minus, A, B},
    receive
        {Server, minus, X} ->
            X
    after
        1000 ->
            error
    end.
