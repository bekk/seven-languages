module Main where

-- Write a function that looks up a hash table value that uses the
-- Maybe monad. Write a hash that stores other hashes, several levels deep.
-- Use the Maybe monad to retrieve an element for a hash key several levels deep.

hashesNstuff = [(1, [(3, "apple")]), (2, [(4, "orange")])]

findInHash x [] = Nothing
findInHash x ((key, value):t)
  | key == x = Just value
  | otherwise = findInHash x t
