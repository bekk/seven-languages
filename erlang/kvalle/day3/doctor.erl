% Make the Doctor process restart itself if it should die.

-module(doctor).
-export([loop/0, start/0]).
loop() ->
    process_flag(trap_exit, true), 
    receive
        new ->
            io:format("Creating and monitoring process.~n"),
            %register(revolver, spawn_link(fun roulette:loop/0)),
            loop();
        die ->
            io:format("Oh shit...~n"), 
            exit({doctor,die,at,erlang:time()});
        help ->
            io:format("Here, have a medkit!~n");
        {'EXIT', From, Reason} -> 
            io:format("The shooter ~p died with reason ~p. Restaring.~n", 
                [From, Reason]),
            self() ! new, 
            loop()
        end.

start() ->
    process_flag(trap_exit, true), 
    register(doc, spawn_link(fun loop/0)),
    doc ! new,
    receive
        {'EXIT', From, _} -> 
            io:format("Ressurecting the doctor ~p.~n", [From]),
            start()
        end.
