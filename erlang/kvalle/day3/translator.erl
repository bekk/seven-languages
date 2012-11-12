% Monitor the translate_service and restart it should it die.

-module(translator).
-export([loop/0, translate/1, monitor/0]).

loop() ->
	receive
		die -> 
			exit(wtf);
		{From, "casa" } ->
			From ! "house",
			loop();
		{From, "blanca" } ->
			From ! "white",
			loop();
		{From, _} ->
			From ! "I don't understand." ,
			loop()
	end.

translate(Word) ->
	translator ! {self(), Word},
	receive
		Translation -> Translation
	end.

monitor() ->
	process_flag(trap_exit, true),
	receive
		create ->
			io:format("Creating a new translator.~n"),
            register(translator, spawn_link(fun translator:loop/0)),
            monitor();
        {'EXIT', _, _} -> 
            io:format("The translator died.~n"),
            self() ! create, 
            monitor()
    end.

% 1> c(translator).
% {ok,translator}
% 2> Monitor = spawn(fun translator:monitor/0).
% <0.39.0>
% 3> translator:translate("blanca").
% ** exception error: bad argument
%      in function  translator:translate/1
% 4> Monitor ! create.              
% Creating a new translator.
% create
% 5> translator:translate("blanca").
% "white"
% 6> translator ! die.              
% The translator died.
% die
% Creating a new translator.
% 7> translator:translate("blanca").
% "white"