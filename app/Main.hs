module Main where

import Data.List.Split
import qualified Data.Map as Map

import Duet


main :: IO ()
main = do
    input <- readFile "input.txt"
    print $ parseInstruction (lines input) 0 0 Map.empty

