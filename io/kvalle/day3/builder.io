Object asParameters := ""

Map asParameters := method(
	params := List clone
	foreach(key, value,	
		params append("#{key}=\"#{value}\"" interpolate))
	" " .. params join(" "))

Builder := Object clone
Builder level := 0
Builder tabsize := 2

Builder tab := method(" " repeated(level))

Builder startTag := method(label, parameters,
	tag := "#{tab}<#{label}#{parameters}>\n" interpolate
	level = level + tabsize
	tag)

Builder endTag := method(label,
	level = level - tabsize
	"#{tab}</#{label}>\n" interpolate)

Builder forward := method(
	html := ""
	parameters := doMessage(call message arguments first) asParameters
	label := call message name

	html := html .. startTag(label, parameters)
	call message arguments foreach(arg, 
		content := doMessage(arg)
		if(content type == "Sequence",
			if(content beginsWithSeq(" ")) then(
				html = html .. content
			) else (
				html = "#{html}#{tab}#{content}\n" interpolate)))
	html = html .. endTag(label))

doFile("curlies.io")
doFile("testBuilder.io")