module Hash where

    -- Write a function that looks up a hash table value that uses
    -- the Maybe monad. Write a hash that stores other hashes, several
    -- levels deep. Use that Maybe monad to retrieve an element for
    -- a hash key several levels deep.

    fetch key [] = Nothing
    fetch key ((k,value):rest)
        | key == k  = Just value
        | otherwise = fetch key rest

    hashes = [("key1",
                    [("key11", "a value!"),
                     ("key12", "another value")]),
              ("key2",
                    [("key21", "adsf"),
                     ("key22", "foobarbaz")])]

    value = fetch "key2" hashes >>= fetch "key21"

