(defmacro unless [test b1 b2]
    (list 'if (list 'not test) b1 b2))

(unless false (println "wibbly wobbly") (println "EXTERMINATE"))
(unless true (println "EXTERMINATE") (println "timey wimey"))


(defprotocol ADuck
  "The duck protocol."
  (walk [d steps] "Walk like a duck.")
  (talk [d what] [d what n] "Talk like a duck."))

(defrecord Daffy []
    ADuck
    (walk [_ steps] (clojure.string/join " " (take steps (repeat "waggle"))))
    (talk [_ what] (str what))
    (talk [_ what times] (clojure.string/join " " (take times (repeat what)))))

(def d (Daffy.))

(println (walk d 4))
(println (talk d "quack"))
(println (talk d "quack" 5))