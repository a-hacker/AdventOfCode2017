module Main where

import qualified Data.Map as Map
import Data.List.Split

import Coprocessor


main :: IO ()
main = do
    input <- readFile "input.txt"
    let instructions = lines input
    print $ parseInstruction (SingleExec instructions 0 0 Map.empty)
