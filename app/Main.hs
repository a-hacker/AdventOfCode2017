module Main where

import qualified Data.Set as Set
import Data.List.Split

import Bridge


main :: IO ()
main = do
    input <- readFile "input.txt"
    let components = Set.fromList (map inputToComponent (lines input))
    print $ build components (0, 0) 0

inputToComponent :: String -> Component
inputToComponent rawInput = (Component (read p1) (read p2))
    where (p1:p2:[]) = splitOn "/" rawInput
