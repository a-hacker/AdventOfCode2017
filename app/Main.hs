module Main where

import Hex

main :: IO ()
main = do
    input <- readFile "input.txt"
    print $ mathDirs (countDirs [0, 0, 0] input)
