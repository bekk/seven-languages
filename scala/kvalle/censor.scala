// Write a Censor trait with a method that will replace the curse words
// Shoot and Darn with Pucky and Beans alternatives. Use a map to
// store the curse words and their alternatives.

trait Cencor {	
	var curses = Map[String, String]()

	io.Source.fromFile("curses.txt").getLines().foreach { (line) =>
		val words = line.split(":")
		curses += words(0) -> words(1)
	}

	def censor(string: String) = curses.foldLeft(string)((res, cw) => res.replaceAll(cw._1, cw._2))
}

class Text( val content: String ) extends Cencor {
    def censoredContent() = this.censor(this.content)   
}

val s = new Text("foo bar shoot darn baz shoot")

println(s.content)
// foo bar shoot darn baz shoot

println(s.censoredContent)
//foo bar pucky beans baz pucky
