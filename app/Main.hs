module Main where

import qualified Data.Set as Set
import Data.List.Split
import Data.Numbers.Primes

import Bridge


main :: IO ()
main = do
    input <- readFile "input.txt"
    let numbers = [109300, 109317..126300]
    print $ (length numbers) - length (filter isPrime numbers)

inputToComponent :: String -> Component
inputToComponent rawInput = (Component (read p1) (read p2))
    where (p1:p2:[]) = splitOn "/" rawInput
