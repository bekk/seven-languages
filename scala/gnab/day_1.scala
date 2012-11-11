// Write a game that will take a tic-tac-toe board with X, O, and blank
// characters and detect the winner or wheter there is a tie or no winner
// yet.

type Board = (Char, Char, Char, Char, Char, Char, Char, Char, Char)

val board = ('X', 'X', 'O',
             'O', 'X', 'X',
             'X', 'O', 'X')

def winner(board:Board) : String = {
  val ranges = boardRanges(board)

  ranges.foreach(range =>
    if (range.forall(chr => chr == range(0) && chr != ' ')) {
      return "Winner is " + range(0)
    }
  )

  if (ranges.forall(range => range.forall(chr => chr != ' '))) {
    return "Tie!"
  }

  "No winner yet"
}

def boardRanges(board:Board): List[List[Char]] = {
  val (a,b,c,d,e,f,g,h,i) = board

  List(List(a,b,c), List(d,e,f), List(g,h,i), // rows
       List(a,d,g), List(b,e,h), List(c,f,i), // cols
       List(a,e,i), List(c,e,g))              // diags
}

println(winner(board))
