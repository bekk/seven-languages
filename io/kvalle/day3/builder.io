Builder := Object clone

Builder level := 0
Builder indent := 2

Builder forward := method(
	for(i, 1, level, write(" "))
	writeln("<", call message name, ">")
	self level = level + indent

	call message arguments foreach(
		arg, 
		content := self doMessage(arg); 
		if(content type == "Sequence", 
			for(i, 1, level, write(" "))
			writeln(content)))
  
	self level = level - indent
	for(i, 1, level, write(" "))
	writeln("</", call message name, ">"))


Builder html(
			ul(
				li("Io"), 
				li("Lua"), 
				li("JavaScript")),
			p("Some text"))
