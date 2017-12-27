module Main where

import qualified Data.Map as Map
import Data.List.Split

import Turing


main :: IO ()
main = do
    input <- readFile "input.txt"
    print $ runA Map.empty 0 0
