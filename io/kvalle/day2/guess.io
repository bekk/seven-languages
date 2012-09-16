solution := Random value(1,100) floor
diff := nil
prev_diff := nil
guess := nil
tries := 0

while(tries < 10 and diff != 0, 
	if (diff == nil) then (
		"Guess a number between 1 and 100 " println
	) elseif (prev_diff == nil) then(
		"Nope, try again!" println
	) else(
		if (diff > prev_diff, "Colder...", "Hotter...") println
	)
	guess = File standardInput readLine asNumber
	prev_diff = diff
	diff = (guess - solution) abs
	tries = tries + 1
)

if (diff == 0, 
	"Correct!", 
	"BEEP! The solution was #{solution}..." interpolate
) println

