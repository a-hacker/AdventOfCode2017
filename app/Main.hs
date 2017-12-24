module Main where

import qualified Data.Map as Map
import Data.List.Split

import Fractal


main :: IO ()
main = do
    input <- readFile "input.txt"
    let rules = Map.fromList (map parseRule (lines input))
    print $ growFractal rules 0 ".#./..#/###"

parseRule :: String -> (String, String)
parseRule rule = let spltStr = splitOn " => " rule in ((head spltStr), (last spltStr))
