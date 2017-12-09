module Main where

import Register
import Data.List.Split
import qualified Data.Map as Map

main :: IO ()
main = do
        input <- readFile "input.txt"
        print (updateRegisters (map words (lines input)) (Map.fromList [("??highest", 0)]))

inputToMap :: String -> (String, [String])
inputToMap x = let spltStr = (splitOn "-> " x) in
    do
        if 1 == (length spltStr)
            then ((head (words (head spltStr))), [])
            else ((head (words (head spltStr))), (splitOn ", " (last (tail spltStr))))