import collection.mutable.MutableList

object CellValue extends Enumeration {
  type CellValue = Value
  val X = Value("x")
  val O = Value("o")
  val BLANK = Value("-")
}

import CellValue._

class Board {

  val board = MutableList.fill(9)(BLANK)
  
  def setCell(index: Int, value: CellValue) = board.update(index, value)
  def done() = !board.contains(BLANK) || winner != None
  def rows() = board.grouped(3)

  def winner() : Option[CellValue] = {
    rows.foreach { row => 
      if (row.distinct.size == 1 && !row.contains(BLANK)) {
        return Some(row.first)
      }
    }
    return None
  }

  def print() {
    println
    rows.foreach { line =>
      line.foreach { cell => Predef.print(" " + cell) }
      println
    }
    println
  }
}

println("Cell positions: \n")
println(" 0 1 2")
println(" 3 4 5")
println(" 6 7 8\n")

var player = X
val b = new Board()
while(!b.done) {
  print("Select position for player " + player +": ")
  val pos = readLine().toInt
  b.setCell(pos, player)
  player = if (player == X) O else X
  b.print
}

println("Winner: " + b.winner)