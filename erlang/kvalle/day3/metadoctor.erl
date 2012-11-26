% Supervisor for ressurecting the doctor should it die.
% Test using doctor:poison() to kill the doctor.

-module(metadoctor).
-behaviour(supervisor).
-export([start_link/0]).
-export([init/1]).

start_link() ->
    supervisor:start_link({local, metadoctor}, metadoctor, []).

init(_Args) ->
    {ok, {{one_for_one, 1, 60},
          [{doctor, {doctor, start_link, []},
            transient, brutal_kill, worker, [doctor]}]}}.