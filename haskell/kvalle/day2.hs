module Main where

    -- Write a sort that takes a list and returns a sorted list.

    sort [] = []
    sort (pivot:rest) = sort smaller ++ [pivot] ++ sort greater
        where
            smaller = filter (\x -> x < pivot) rest
            greater = filter (\x -> x >= pivot) rest

    -- Write a sort that takes a list and a function that compares
    -- its two arguments and then returns a sorted list.

    sortBy fn [] = []
    sortBy fn (pivot:rest) = sortBy fn smaller ++ [pivot] ++ sortBy fn greater
        where
            smaller = filter (\x -> fn x pivot < 0) rest
            greater = filter (\x -> fn x pivot >= 0) rest

    -- Write a Haskell function to convert a string to a number.
    -- The String should be in the form of $2,345,678.99 and can
    -- possibly have leading zeros.

    readAmount :: String -> Float
    readAmount amt = read [d | d <- amt, d /= ',', d /= '$']

    -- Write a function that takes an argument x and returns a lazy
    -- sequence that has every third number, starting with x. Then,
    -- write a funciton that includes every fifth number, beginning
    -- with y. Combine these functions through composition to return
    -- every eight number, beginning with x + y.

    everyThird :: Integer -> [Integer]
    everyThird x = [x,x+3..]

    everyFifth :: Integer -> [Integer]
    everyFifth y = [y,y+5..]

    everyEight :: Integer -> Integer -> [Integer]
    everyEight x y = zipWith (+) (everyThird x) (everyFifth y)

    -- Use a partially applied function to define a function that
    -- will return half of a number and another that will append \n
    -- to the end of any string.

    half = (/ 2)

    newline = (++ "\n")

    -- OPTIONAL

    -- Write a function to determine the greates common denominator
    -- of two integers.

    myGcd :: Integer -> Integer -> Integer
    myGcd a 0 = a
    myGcd a b = myGcd b (a `mod` b)

    -- Create a lazy sequence of prime numbers.

    primes :: [Integer]
    primes = [n | n <- [2..], not (composite n)]
        where composite n = any (\d -> n `mod` d == 0) [2..n-1]

    -- Break a long string into individual lines at proper word boundaries.
    -- TODO

    -- Add line numbers to the previous exercise.
    -- TODO

    -- To the avove exercise, add functions to left, right, and fully
    -- justify the text with spaces (making both margins straight).
    -- TODO