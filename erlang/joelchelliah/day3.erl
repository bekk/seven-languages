-module(day3).
-export([loop/0, doctor/0, super_doctor/0, super_duper_doctor/0, translate/1]).

% Monitor the translate_service and restart it should it die.

loop() ->
  receive
    {From, "casa"} ->
        From ! "house",
        loop();

    {From, "blanca"} ->
        From ! "white",
        loop();

    {From, kill} ->
        From ! dead,
        exit("Shot down!");

    {From, _} ->
        From ! "I don't understand.",
        loop()
end.

translate(Word) ->
  translator ! {self(), Word},
  receive
    dead -> ok;
    Translation -> io:format("~p~n",[Translation])
  end.

doctor() ->
  process_flag(trap_exit, true),
  receive
    new ->
      io:format("Creating and monitoring a new translator.~n"),
      register(translator, spawn_link(fun day3:loop/0)),
      doctor();

    kill ->
      exit("Blargh!");

    {'EXIT', From, "Shot down!"} ->
      io:format("The translator: ~p died.~n", [From]),
      io:format("Restarting...~n"),
      self() ! new,
      doctor()
    end.


% Make the Doctor process restart itself if it should die.

super_doctor() ->
  process_flag(trap_exit, true),
  receive
    new ->
      io:format("Creating and monitoring a new doctor.~n"),
      register(doc, spawn_link(fun day3:doctor/0)),
      doc ! new,
      super_doctor();

    kill ->
      io:format("ouch~n"),
      exit("Stabbed!");

    {'EXIT', From, "Blargh!"} ->
      io:format("The doctor ~p died.~n", [From]),
      io:format("Restarting...~n"),
      self() ! new,
      super_doctor();
    end.


% Make a monitor for the Doctor monitor. If either monitor dies, restart it.

super_duper_doctor() ->
  process_flag(trap_exit, true),
  receive
    new ->
      io:format("Creating and monitoring a new super doctor.~n"),
      register(sdoc, spawn_link(fun day3:super_doctor/0)),
      sdoc ! new,
      super_duper_doctor();

    kill ->
      exit("Boom!");

    {'EXIT', From, "Stabbed!"} ->
      io:format("The super doctor ~p died.~n", [From]),
      io:format("Killing all other doctors...~n"), doc ! kill,
      io:format("Restarting...~n"),
      self() ! new,
      super_duper_doctor()
    end.

% SD = spawn(fun day3:super_duper_doctor/0).
% SD ! new.
% day3:translate(kill).