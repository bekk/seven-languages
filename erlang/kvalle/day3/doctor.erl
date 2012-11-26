% Doctor module implemented as gen_server

-module(doctor).
-behaviour(gen_server).

-export([
    start_link/0,
    init/1, 
    handle_call/3, 
    handle_cast/2, 
    handle_info/2, 
    terminate/2, 
    code_change/3,
    stop/0
]).

stop() ->
    gen_server:cast(doctor, stop).

start_link() ->
    gen_server:start_link({local, doctor}, doctor, [], []).

init(_Args) ->
    process_flag(trap_exit, true), 
    io:format("Starting new roulette game.~n"),
    register(revolver, spawn_link(fun roulette:loop/0)),
    {ok, 0}.

handle_call(_Message, _From, State) -> {noreply, 0, State}.

handle_cast(stop, State) -> {stop, normal, State};
handle_cast(_Message, State) -> {noreply, State}.

handle_info({'EXIT', From, Reason}, _State) -> 
    io:format("Player ~p died. (~p)~n", [From, Reason]),
    io:format("Starting new roulette game.~n"),
    register(revolver, spawn_link(fun roulette:loop/0)),
    {noreply, 0}.

terminate(_Reason, _State) -> 
    io:format("Stopping: ~p~n", [_Reason]), ok.

code_change(_OldVersion, State, _Extra) -> 
    io:format("I have changed!~n"),
    {ok, State}.
