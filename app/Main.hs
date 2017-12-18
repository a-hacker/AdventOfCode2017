module Main where

import Data.List.Split
import qualified Data.Map as Map

import Duet


main :: IO ()
main = do
    input <- readFile "input.txt"
    print $ runRegisters (PairedExec (lines input) 0 Map.empty []) (PairedExec (lines input) 0 (Map.fromList [('p', 1)]) []) (0, 0) False

