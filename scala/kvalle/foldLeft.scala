// Use foldLeft to compute the total size of a list of strings.

def skriv(liste: List[String], lengde: Int) = println("Summen av lengder av " + liste + " er " + lengde)
val liste = List("foo", "bar", "faggruppe", "pizza")

val lengde = liste.foldLeft(0)((sum, string) => sum + string.length)
val lengde2 = (0 /: liste) {(sum, string) => sum + string.length}

skriv(liste, lengde)
skriv(liste, lengde2)
