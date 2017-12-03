module Captcha
    ( sumDups
    ) where

getDups :: (Int, Int) -> Int
getDups (x, y) = if x == y then x else 0

shift :: ([Int], Int) -> [Int]
shift (xs, n) =  (drop n xs) ++ (take n xs)

--zipCirc xs = zip xs (shift (xs, 1))
zipCirc xs = zip xs (shift (xs, (length(xs) `div` 2)))

sumDups :: [Int] -> Int
sumDups [] = 0
sumDups xs = sum (map getDups (zipCirc xs))