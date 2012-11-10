// Write a Censor trait with a method that will replace the curse words
// Shoot and Darn with Pucky and Beans alternatives. Use a map to
// store the curse words and their alternatives.

trait Cencor {	
	val c = Map("shoot" -> "pucky",	"darn" -> "beans")

	def censor(string: String) = {
		def cw(word: String) = if(c.contains(word)) c(word) else word
		string.split(" ").toList.map(cw).mkString(" ")
	}
}

class Text( val content: String ) extends Cencor {
    def censoredContent() = this.censor(this.content)   
}

val s = new Text("foo bar shoot darn baz shoot")

println(s.content)
// foo bar shoot darn baz shoot

println(s.censoredContent)
//foo bar pucky beans baz pucky
