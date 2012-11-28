-module(monitor).
-export([loop/0]).

loop() ->
  process_flag(trap_exit, true),
  receive
    create ->
      io:format("Creating translation service.~n"),
      register(translator, spawn_link(fun translate_service:loop/0)),
      loop();
    {'EXIT', From, Reason} ->
      io:format("Process ~p died with reason ~p.~n", [From, Reason]),
      self() ! create,
      loop()
  end.
