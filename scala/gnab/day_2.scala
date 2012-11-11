// Use foldLeft to compute the total size of a list of strings.

val strings = List("ole", "petter", "bang")
val length = strings.foldLeft(0)((sum, str) => sum + str.length)

println("Total length of strings %s is %d".format(
  strings.mkString(", "), length))

// Write a Censor trait with a method that will replace the curse
// words Shoot and Darn with Pucky and Beans alternatives. Use a map
// to store the curse words and their alterntives.

trait Censor {
  // Load the curse words and alternatives from a file.
  val mappings = io.Source.fromFile("censor.txt").getLines
    .map(line => line.split("=") match { case Array(a,b) => (a,b) })
    .toMap

  def censor(str:String): String = {
    str.split(" ").map(word => mappings.getOrElse(word, word)).mkString(" ")
  }
}

val censorable = new Object with Censor
println(censorable.censor("Shoot and Darn"))
