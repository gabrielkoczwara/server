-module(server).
-export([start/0, run/0]).

run() ->
    spawn(server, start, []).

start() ->
    receive
        {Client, echo, Message} ->
            Client ! {self(), echo, Message};
        {Client, plus, A, B} ->
            Client ! {self(), plus, A + B};
        {Client, minus, A, B} ->
            Client ! {self(), minus, A - B}
    end,
    start().
