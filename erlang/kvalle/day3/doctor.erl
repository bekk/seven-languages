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
    stop/0,
    poison/0
]).

stop() -> gen_server:cast(doctor, stop).
poison() -> gen_server:cast(doctor, poison).

% -- Callback functions

start_link() ->
    gen_server:start_link({local, doctor}, doctor, [], []).

init(_Args) ->
    process_flag(trap_exit, true), 
    gen_server:cast(doctor, new_game),
    {ok, 0}.

handle_call(_Message, _From, State) -> {noreply, 0, State}.

handle_cast(Message, State) -> 
    case Message of
        new_game ->
            io:format("Starting new roulette game.~n"),
            register(revolver, spawn_link(fun roulette:loop/0)),
            {noreply, State};
        stop ->
            {stop, normal, State};
        poison ->
            {stop, aaargh, State};
        _ -> 
            {noreply, State}
    end.

handle_info({'EXIT', From, _Reason}, State) -> 
    io:format("Player ~p died.~n", [From]),
    gen_server:cast(doctor, new_game),
    {noreply, State}.

terminate(Reason, _State) -> 
    io:format("Stopping: ~p~n", [Reason]), ok.

code_change(_OldVersion, State, _Extra) -> 
    io:format("I have changed!~n"),
    {ok, State}.
