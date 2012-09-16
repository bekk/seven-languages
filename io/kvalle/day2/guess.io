solution := Random value(1,100) floor
solution := 42 # debug
diff := nil
guess := nil
tries := 10

debug := method(
	"-----------" println
	"diff     #{diff}" interpolate println
	"tries    #{tries}" interpolate println
	"guess    #{guess}" interpolate println
	"solution #{solution}" interpolate println
)

do_guess := method(diff,
	if (diff == nil) then (
		"Guess a number between 1 and 100: " print
	) else (
		"Guess again! (#{tries} tries left): " interpolate print
	)
	File standardInput readLine asNumber
)

while(tries > 0 and diff != 0, 
	guess := do_guess(diff)
	diff = guess - solution
	diff = diff abs
	tries = tries - 1
	debug
)

if (diff == 0,
	"Correct!" println,
	"The solution was #{solution}..." interpolate println)