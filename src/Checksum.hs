module Checksum
    ( colLCM
    ) where

import Data.List

colDiff :: [Int] -> Int
colDiff xs = (last (sort xs)) - (head (sort xs))

colLCM :: [Int] -> Int
colLCM xs = head (head [z | z <- [ [y `div` x | y <- xs, lcm x y  == y, x /= y] | x <- sort xs], not (null z)])

allThings :: [Int] -> [[Int]]
allThings xs =  [z | z <- [ [y `div` x | y <- xs, lcm x y  == y, x /= y] | x <- sort xs], not (null z)]

allDifferent :: (Eq a) => [a] -> Bool
allDifferent list = case list of
    []      -> True
    (x:xs)  -> if x `elem` xs then False else allDifferent xs