module Main where

import Mem
import Data.Char
import qualified Data.Map as Map

main :: IO ()
main =
    let
        input = 1
    in
        do print (spiralVals (1, 0, 0, True, True, True, input, Map.empty))