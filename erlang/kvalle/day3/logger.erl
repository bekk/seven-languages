% Task: Create a basic OTP server that logs messages to a file.

-module(logger).
-behaviour(gen_server).
-export([
    start_link/0,
    init/1, 
    handle_call/3, 
    handle_cast/2, 
    handle_info/2, 
    terminate/2, 
    code_change/3,
    die/0,
    log/1
]).

log(Message) ->
    gen_server:cast(logger, {log, Message}).

die() ->
    gen_server:cast(logger, {die, "Aaaaargh!"}).

% -- Callback functions

start_link() ->
    gen_server:start_link({local, logger}, logger, [], []).

init(_Args) ->
    process_flag(trap_exit, true), 
    {ok, 0}.

handle_call(_Message, _From, State) -> 
    {noreply, 0, State}.

handle_cast(Message, State) ->
    case Message of
        {log, Log} ->
            file:write_file("log.log", io_lib:fwrite("~s\n", [Log]), [append]);
        {die, Reason} -> 
            exit({Reason})
    end,
    {noreply, State}.

handle_info(_Message, State) -> 
    {noreply, State}.

terminate(Reason, _State) -> 
    io:format("Stopping: ~p~n", [Reason]), 
    ok.

code_change(_OldVersion, State, _Extra) -> 
    io:format("I have changed!~n"),
    {ok, State}.
