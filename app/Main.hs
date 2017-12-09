module Main where

import StreamReader
import Data.List.Split
import qualified Data.Map as Map
import qualified Data.Set as Set

main :: IO ()
main = do
        input <- readFile "input.txt"
        print (parseGroup (tail input) 0 1)
