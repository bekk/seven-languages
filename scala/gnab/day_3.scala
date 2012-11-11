import scala.io._
import scala.actors._
import Actor._

object PageLoader {
  def getPageInfo(url : String) = { 
    val html = Source.fromURL(url).mkString

    (html.length, countLinks(html))
  }

  def countLinks(html:String, offset:Int = 0) : Int = {
    val index = html.indexOf("<a", offset)

    if (index > -1) {
      1 + countLinks(html, index + 1)
    }
    else {
      0
    }
  }
}

val urls = List(
  //"http://www.amazon.com/",
  "https://www.twitter.com/",
  "http://www.google.com/",
  "http://www.cnn.com/"
)

def timeMethod(method: () => Unit) = {
  val start = System.nanoTime
  method()
  val end = System.nanoTime
  println("Method took " + (end - start)/1000000000.0 + " seconds.")
}

def getPageInfoSequentially() = {
  for(url <- urls) {
    val pageInfo = PageLoader.getPageInfo(url)
    println("Size for " + url + ": " + pageInfo._1)
    println("Links for " + url + ": " + pageInfo._2)
  }
}

def getPageInfoConcurrently() = {
  val caller = self

  for(url <- urls) {
    actor { caller ! (url, PageLoader.getPageInfo(url)) }
  }

  for(i <- 1 to urls.size) {
    receive {
      case (url, (size, linkCount)) =>
        println("Size for " + url + ": " + size)
        println("Links for " + url + ": " + linkCount)
    }
  }
}

println("Sequential run:") 
timeMethod { getPageInfoSequentially }

println("Concurrent run")
timeMethod { getPageInfoConcurrently }
