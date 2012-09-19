doFile("curlies.io")

Builder := Object clone
Builder level := 0
Builder tabsize := 2

Builder indent := method(self level = level + tabsize)
Builder unindent := method(self level = level - tabsize)

Builder tab := method(
	str := ""
	for(i, 1, level, str = str .. " ")
	str)

Builder start := method(label, parameters,
	params := if(parameters, " #{parameters}" interpolate, "")
	tag := "#{tab}<#{label}#{params}>\n" interpolate
	indent
	tag)

Builder end := method(label,
	unindent
	"#{tab}</#{label}>\n" interpolate)

Builder forward := method(
	html := ""

	parameters := nil
	first := call message arguments first
	content := if (first, self doMessage(first), nil)
	if(content and content type == "Map", 
		parameters := content asParameters join(" "))

	label := call message name
	html := html .. start(label, parameters)

	call message arguments foreach(arg, 
		content := self doMessage(arg)
		if(content type == "Sequence",
			if(content beginsWithSeq(" ")) then(
				html = "#{html}#{content}" interpolate
			) else (
				html = "#{html}#{tab}#{content}\n" interpolate)))
	
	html = html .. end(label))

doFile("testBuilder.io")
