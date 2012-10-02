html := Builder html(
	head(
		title(
			"Hi ho, Io!")), 
	body(
		div({"type":"article", "style":"fancy"}, 
			p(
				"Hey ho, Io"),
			p(
				"Some more text"),
			script({"type":"text/javascript"}, 
				"alert('Wooo');"))))

html print