;; Use refs to create a vector of accounts in memory. Create debit and
;; credit functions to change the balance of an account.
(def accounts 
  [(ref 0)
   (ref 0)
   (ref 0)])

(defn debit [account amount]
  (dosync
    (alter account + amount)))

(defn credit [account amount]
  (debit account (- amount)))

(debit (first accounts) 100)
(credit (second accounts) 50)

(doseq [a accounts]
  (println @a))

;; Sleeping Barber - how many customers in 10 seconds?
(def queue-length 3)
(def prosessing-time 20)
(def arrival-time-span [10 30])

(def queue (ref []))
(def customers (atom 0))
(def doorman (agent 0))
(def barber (agent 0))

(defn give-haircut [_]
  (let [customer (dosync (pop @queue))]
  (do
    (swap! customers inc)
    (Thread/sleep prosessing-time))))

(defn wait-for-next-customer [_]
  (let [from (first arrival-time-span)
        to (+ (second arrival-time-span) 1)
        time-to-arrival (+ from (rand-int to))]
    (do
      (Thread/sleep time-to-arrival)
      (dosync
        (if (< (count @queue) queue-length)
          (alter queue conj :customer)
          (send barber give-haircut)))
      (send doorman wait-for-next-customer))))

(send doorman wait-for-next-customer)

(Thread/sleep 10000)
(shutdown-agents)

(println "Customer count: " @customers)
