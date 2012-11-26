% Supervisor for resurrecting the metadoctor (doctor supervisor).
% Test using pman:start() to kill the metadoctor or doctor.

-module(metametadoctor).
-behaviour(supervisor).
-export([start_link/0]).
-export([init/1]).

start_link() ->
    supervisor:start_link({local, metametadoctor}, metametadoctor, []).

init(_Args) ->
    {ok, {{one_for_one, 1, 60},
          [{metadoctor, {metadoctor, start_link, []},
            permanent, brutal_kill, supervisor, [metadoctor]}]}}.