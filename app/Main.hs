module Main where

import Knot
import Data.Char
import Data.Bits
import qualified Data.Map as Map

main :: IO ()
main = do
    input <- readFile "input.txt"
    let allIn = map (postFix input) [0..127]
    let allHashes = map knotHash allIn
    print $ sum (map length (map (filter ((==) '1')) allHashes))

inputToTuple :: [String] -> (Int, Int)
inputToTuple (key:val:[]) = ((read (init key)), (read val))

knotHash :: String -> String
knotHash x = do
    let baseInstr = map ord x
    let instr = concat (replicate 64 (baseInstr ++ [17, 31, 73, 47, 23]))
    let knoted = getTwisted [0..255] instr 0 0
    hashKnot knoted ""


postFix :: String -> Int -> String
postFix baseStr postNum = baseStr ++ '-':(show postNum)

