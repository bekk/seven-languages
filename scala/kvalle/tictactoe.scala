import collection.mutable.MutableList

object CellValue extends Enumeration {
  type CellValue = Value
  val X = Value("x")
  val O = Value("o")
  val EMPTY = Value("-")
}

import CellValue._

class Board {

  val board = MutableList.fill(9)(EMPTY)
  
  def setCell(index: Int, value: CellValue) {
    board.update(index, value)
  }

  def print() {
    println
    board.grouped(3).foreach { line =>
      line.foreach { cell => Predef.print(" " + cell) }
      println
    }
  }

  def done() : Boolean = !board.contains(EMPTY)

}

println("Cell positions: ")
println
println(" 0 1 2")
println(" 3 4 5")
println(" 6 7 8")


val b = new Board()
b.print

b.setCell(4, X)
b.print

println
println(b.done)