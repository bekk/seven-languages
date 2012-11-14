% Make the Doctor process restart itself if it should die.

-module(doctor).
-export([loop/0, start/0]).

loop() ->
    process_flag(trap_exit, true), 
    receive
        new ->
            io:format("Creating and monitoring process for ~p attachted to atom ~p.~n", [Fun, Atom]),
            register(gun, spawn_link(fun roulette:loop/0)),
            loop();
        {'EXIT', Pid, normal} -> % not a crash
            ok;
        {'EXIT', Pid, shutdown} -> % manual termination, not a crash
            ok;
        {'EXIT', _, Reason} -> 
            io:format("~p died with reason ~p.", [Atom, Reason]),
            io:format(" Restarting. ~n"),
            self() ! new, 
            loop()
        end.

start() ->
    Doctor = spawn(doctor, loop, []),
    Doctor ! new,
    Doctor.

