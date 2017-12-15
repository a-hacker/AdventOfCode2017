module Main where

import Knot
import Defragmenter
import Data.Char
import Data.Bits
import qualified Data.Sequence as Seq
import qualified Data.Map as Map

main :: IO ()
main = do
    input <- readFile "input.txt"
    let allIn = map (postFix input) [0..127]
    let allHashes = Seq.fromList (map Seq.fromList (map knotHash allIn))
    print $ countRegions allHashes 0
