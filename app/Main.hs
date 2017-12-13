module Main where

import Scanner
import qualified Data.Map as Map

main :: IO ()
main = do
    input <- readFile "input.txt"
    let scanners = Map.fromList (map inputToTuple (map words (lines input)))
    print $ attemptRun scanners 0

inputToTuple :: [String] -> (Int, Int)
inputToTuple (key:val:[]) = ((read (init key)), (read val))

