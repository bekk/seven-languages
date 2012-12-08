// Write a game that will take a tic-tac-toe board with X, O, and blank characters and
// detect the winner or whether there is a tie or no winner yet. Use classes where appropriate.

class Board(val state:List[List[String]]) {

printboard()

def printboard() {
  println("+---+---+---+")
  state.foreach {row =>
    print("| ")
    row.foreach { space =>
      print(space + " | ")
    }
    println("\n+---+---+---+")
  }
}

def isFinished() {
  if (checkRows("X") || checkCols("X") || checkDiags("X")) {
    println("X wins!")
  }
  if (checkRows("O") || checkCols("O") || checkDiags("O")) {
    println("O wins!")
  }
}

def checkRows(p:String):Boolean = {
  val pWins = List(p,p,p)
  return (state(0).equals(pWins) || state(1).equals(pWins) || state(2).equals(pWins))
}

def checkCols(p:String):Boolean = {
  val transposed = state.transpose
  val pWins = List(p,p,p);
  return transposed(0).equals(pWins) || transposed(1).equals(pWins) || transposed(2).equals(pWins)
}

def checkDiags(p:String):Boolean = {
  val pWins = List(p,p,p);
  return List(state(0)(0), state(1)(1), state(2)(2)).equals(pWins) || List(state(2)(0), state(1)(1), state(0)(2)).equals(pWins)
}

}


var b = new Board(
  List(
    List("X","O","O"),
    List(" ","X"," "),
    List("O","X","X")
  )
)

b.isFinished()