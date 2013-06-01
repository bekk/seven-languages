module Main where

    -- How many different ways can you find to write allEven?

    allEven :: [Integer] -> [Integer]
    allEven [] = []
    allEven (h:t) = if even h then h:allEven t else allEven t

    allEven2 :: [Integer] -> [Integer]
    allEven2 = filter even

    allEven3 :: [Integer] -> [Integer]
    allEven3 items = [x | x <- items, even x]

    allEven4 :: [Integer] -> [Integer]
    allEven4 items
        | items == [] = []
        | even (head items) = (head items) : allEven4 (tail items)
        | otherwise = allEven4 (tail items)

    -- Write a function that takes a list and returns the same list in reverse

    reverseList :: [a] -> [a]
    reverseList [] = []
    reverseList (h:t) = reverseList t ++ [h]

    -- Write a function that builds two-tuples with all possible combinations
    -- of two of the colors black, white, blue, yellow and red. Note that you
    -- should include only one of (black, blue) and (blue, black).

    combinations :: [(String, String)]
    combinations = [(a,b) | a <- colors, b <- colors, a > b]
        where colors = ["black", "white", "blue", "yellow", "red"]

    -- Write a list comprehension to build a childhood multiplication table.
    -- The table would be a list of three-tuples where the first two are integers
    -- from 1-12 and the third is the product of the first two.

    table = [(x,y,x*y) | x <- [1..12], y <- [1..12]]

    -- Solve the map-coloring problem.

    coloring = [(("alabama", a), ("mississippi", m), ("georgia", g),
                ("tennessee", t), ("florida", f)) |
                    a <- colors, m <- colors, g <- colors, t <- colors, f <- colors,
                    m /= t, m /= a, a /= t, a /= g, a /= f, g /= f, g /= t]
        where colors = ["red", "green", "blue"]