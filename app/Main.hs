module Main where

import Malloc
import qualified Data.Set as Set

main :: IO ()
main =
    let
        input = "0   14   13  12  11   10   8   8   6   6   5   3   3  2   1  10"
    in
        do print (massMalloc 0 Set.empty (inputToMap (map read (words input))))
--        do print (traverseMaze (inputToMap (map read (lines input))) 0 0)

inputToMap :: [Int] -> [(Int, Int)]
inputToMap xs = zip [0..] xs