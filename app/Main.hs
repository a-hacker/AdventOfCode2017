module Main where

import qualified Data.Map as Map
import Data.List.Split

import Virus
import Direction


main :: IO ()
main = do
    input <- readFile "input.txt"
    let baseGrid = createGrid (lines input) 0 Map.empty
    print $ scan baseGrid (North, (12, 12)) 0 0
