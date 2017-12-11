module Main where

import Knot
import Data.List.Split
import Data.Char
import Data.Bits
import Numeric (showHex)
import qualified Data.Map as Map
import qualified Data.Set as Set

main :: IO ()
main = do
    input <- readFile "input.txt"
    let baseInstr = map ord input
    let instr = concat (replicate 64 (baseInstr ++ [17, 31, 73, 47, 23]))
    let knoted = getTwisted [0..255] instr 0 0
    let testNums = [65, 27, 9, 1, 4, 3, 40, 50, 91, 7, 6, 0, 2, 5, 68, 82]
    print $ hashKnot knoted ""
