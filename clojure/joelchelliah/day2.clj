; Implement an unless with an else condition using macros.

(defmacro unless [test fBody tBody]
  (list 'if-not test fBody tBody))



; Write a type using defrecord that implements a protocol.

(defprotocol Animal
  (eat [a food])
  (puke [a])
)

(defrecord Rabbit [isFull] Animal
  (eat [_ food] (if isFull (println "NO!") (do (println "Omnomnom..." food) (Rabbit. true))))
  (puke [_] (if-not isFull (println "NO!") (do (println "Blaaaaaauuuuuuh") (Rabbit. false))))
)