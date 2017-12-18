module Main where

import Data.List.Split
import qualified Data.Sequence as Seq

import Spinlock


main :: IO ()
main = do
    input <- readFile "input.txt"
    print $ scVal 0 (Seq.fromList [0])

