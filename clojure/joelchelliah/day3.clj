; Use refs to create a vector of accounts in memory.

(def accs [(ref 0) (ref 50) (ref 250) (ref 1250)])


; Create debit and credit functions to change the balance of an account.

(defn debit  [acc amount] (dosync (alter acc + amount)))

(defn credit [acc amount] (dosync (alter acc - amount)))



; Write a multithreaded program to determine how many haircuts a barber can give in ten seconds.

(def customer-arrival-min 10)
(def customer-arrival-max 31)
(def average-haircut-time 20)
(def num-chairs 3)

(def room (agent 0))
(def barber (agent 0))

(defn cut-hair [hair-cuts]
  (if (> @room 0)
    (do
      (send room dec)
      (Thread/sleep average-haircut-time)
      (send barber cut-hair)
      (inc hair-cuts))
    (do
      (send barber cut-hair)
      hair-cuts)))

(defn open-for-business [queue] (do
  (Thread/sleep (+ customer-arrival-min (rand-int (- customer-arrival-max customer-arrival-min))))
  (send room open-for-business)
  (if (< queue num-chairs) (inc queue) queue)))

(send room open-for-business)
(send barber cut-hair)

(Thread/sleep 10000)
(shutdown-agents)

(println "Number of haircuts in 10 seconds: "@barber"!")