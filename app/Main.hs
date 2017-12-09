module Main where

import Tower
import Data.List.Split
import qualified Data.Map as Map
import qualified Data.Set as Set

main :: IO ()
main = do
        input <- readFile "input.txt"
        let progMap = Map.fromList (map inputToProgram (lines input))
        print (calcWeight progMap (progMap Map.! "wiapj"))

inputToProgram :: String -> (String, Program)
inputToProgram x = do
    let splitStr = (splitOn "-> " x)
    let name = head (words (head splitStr))
    let size = read ((words (head splitStr)) !! 1)
    if 1 == (length splitStr)
        then (name, (Program name size []))
        else (name, (Program name size (splitOn ", " (last (tail splitStr)))))
