; Use refs to create a vector of accounts in memory.
; Create debit and credit functions to change the balance of an account.

(defn debit [accounts nr amount]
    (assoc accounts nr (+ (nth accounts nr) amount)))

(defn credit [accounts nr amount]
    (assoc accounts nr (- (nth accounts nr) amount)))

(def accounts (ref [0 0 0 0]))
(dosync
    (alter accounts debit 2 100)
    (alter accounts credit 0 1000)
    (alter accounts credit 2 58)
    (alter accounts debit 3 2.5))

(println (str "final accounts: " @accounts))


; Dijkstra's 'sleeping barber' problem.

(def barber (agent 0))
(def waiting-room (agent 0))

(defn cut-hair [cuts]
    (if (< 0 @waiting-room)
        (do
            (send waiting-room dec)
            (Thread/sleep 20)
            (send barber cut-hair)
            (inc cuts))
        (do
            (send barber cut-hair)
            cuts)))

(defn await-customers [customers]
    (do
        (Thread/sleep (+ 10 (rand-int 30)))
        (send waiting-room await-customers)
        (min 3 (inc customers))))

(send barber cut-hair)
(send waiting-room await-customers)

(Thread/sleep 10000)

(println (str "The barber had " @barber " customers"))