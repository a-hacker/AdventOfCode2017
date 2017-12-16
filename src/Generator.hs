module Generator where

import Numeric (showIntAtBase)
import Data.Char (intToDigit)

runGenerators :: Int -> Int -> Int -> Int -> Int
runGenerators _ _ 5000000 matches = matches
runGenerators aVal bVal step matches
    | matchBinary aNewVal bNewVal = runGenerators aNewVal bNewVal (step + 1) (matches + 1)
    | otherwise                   = runGenerators aNewVal bNewVal (step + 1) matches
    where
        aNewVal = calcNextVal 16807 4 aVal
        bNewVal = calcNextVal 48271 8 bVal

matchBinary :: Int -> Int -> Bool
matchBinary x y = (drop ((length xBin) - 16) xBin) == (drop ((length yBin) - 16) yBin)
    where
        xBin = leadZeroes $ showIntAtBase 2 intToDigit x ""
        yBin = leadZeroes $ showIntAtBase 2 intToDigit y ""


leadZeroes :: String -> String
leadZeroes x
    | (length x) < 16 = leadZeroes ('0':x)
    | otherwise = x

calcNextVal :: Int -> Int -> Int -> Int
calcNextVal factor filterNum x
    | (nextVal `mod` filterNum) == 0 = nextVal
    | otherwise                      = calcNextVal factor filterNum nextVal
    where
        nextVal = (x * factor) `mod` 2147483647