;; Return whether or not st is more than n characters long
(defn big [st n]
  (> (count st) n))

;; Return :list, :map or :vector based on col type
(defn collection-type [col]
  (cond
    (list? col)   :list
    (map? col)    :map
    (vector? col) :vector))
