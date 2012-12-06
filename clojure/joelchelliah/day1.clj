; Implement a function called (big st n) that returns true if a string st is
; longer than n characters.

(defn big [st n] (> (count st) n))


; Write a function called (collection-type col) that returns :list, :map, or :vector
; based on the type of collection col.

(defn collection-type [col]
  (if (list? col) :col
    (if (map? col) :map
      (if (vector? col) :vector))))