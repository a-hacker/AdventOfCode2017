module Knot where

import Data.List
import Data.Bits
import Numeric (showIntAtBase)
import Data.Char (intToDigit)

getTwisted :: [Int] -> [Int] -> Int -> Int -> [Int]
getTwisted knot [] offset pos = knot
getTwisted knot twistLengths offset pos = do
    let twistedKnot = twistKnot knot pos (head twistLengths)
    let nextPos = (pos + (head twistLengths) + offset) `mod` (length knot)
    getTwisted twistedKnot (tail twistLengths) (offset + 1) nextPos

twistKnot :: [Int] -> Int -> Int -> [Int]
twistKnot knot pos len
    | (pos + len) > (length knot) = do
        let (restKnot, beginLoop) = splitAt pos knot
        let (endLoop, midKnot) = splitAt (len + pos - (length knot)) restKnot
        let loopedLoop = reverse (beginLoop ++ endLoop)
        (drop ((length beginLoop)) loopedLoop) ++ midKnot ++ (take (length beginLoop) loopedLoop)
    | otherwise                   = do
        let (preKnot, restKnot) = splitAt pos knot
        let (loop, postKnot) = splitAt len restKnot
        preKnot ++ (reverse loop) ++ postKnot

hashKnot :: [Int] -> String -> String
hashKnot [] hash = hash
hashKnot knot hash = hashKnot (drop 16 knot) (hash ++ leadZeroes(hashSixteen))
    where
        hashSixteen = showIntAtBase 2 intToDigit (foldl (xor) 0 (take 16 knot)) ""

leadZeroes :: String -> String
leadZeroes x
    | (length x) < 8 = leadZeroes ('0':x)
    | otherwise = x


