Builder := Object clone

Builder level := 0
Builder tabsize := 2

Builder indent := method(self level = level + tabsize)
Builder unindent := method(self level = level - tabsize)

Builder tab := method(for(i, 1, level, write(" ")))

Builder forward := method(
	label := call message name
	tab; writeln("<#{label}>" interpolate)
	indent
	call message arguments foreach(arg, 
		content := self doMessage(arg)
		if(content type == "Sequence", 
			tab; self writeln(content)))
	unindent
	tab; writeln("</#{label}>" interpolate)
)

