doFile("curlies.io")

Builder := Object clone
Builder level := 0
Builder tabsize := 2

Builder indent := method(self level = level + tabsize)
Builder unindent := method(self level = level - tabsize)

Builder tab := method(for(i, 1, level, write(" ")))

Builder start := method(label, parameters,
	tab; 
	write("<",label)
	if(parameters, write(" ", parameters))
	writeln(">")
	indent)

Builder end := method(label,
	unindent
	tab
	writeln("</", label, ">"))

Builder forward := method(
	parameters := nil
	
	label := call message name
	start(label, parameters)

	call message arguments foreach(i, arg, 
		content := self doMessage(arg)
		if(content type == "Sequence", 
			tab; self writeln(content)))
	
	end(label))

doFile("testBuilder.io")
