module Main where

import Dance
import Data.List.Split
import qualified Data.Sequence as Seq

main :: IO ()
main = do
    input <- readFile "input.txt"
    let theDance = splitOn "," input
    --let dancingForever = concat (replicate 1000000000 theDance)
    print $ dance (Seq.fromList ['a'..'p']) theDance
