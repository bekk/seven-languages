-module(metadoctor).
-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

start_link() ->
    supervisor:start_link(metadoctor, []).

init(_Args) ->
    {ok, {{one_for_one, 1, 60},
          [{doctor, {doctor, start_link, []},
            transient, brutal_kill, worker, [doctor]}]}}.