(defn big [st n]
    (> (count st) n))

(defn collection-type [col]
    (cond
        (vector? col) :vector
        (map? col) :map
        (list? col) :list
        :else :unknown))

; TESTS
(use '[clojure.string :only (join)])

(def ts (list
    '( 1 2 3)
    {:foo :lol, :bar :wtf}
    [:x :y :z]
    #{1 2 3}))

(println (big "foo bar" 4))
(println (big "foo bar" 14))

(println (join "\n"
    (map (fn [t] (str t " has type " (collection-type t) ".")) ts)))
