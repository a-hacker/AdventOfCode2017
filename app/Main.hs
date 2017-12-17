module Main where

import Dance
import Data.List.Split
import qualified Data.Sequence as Seq

main :: IO ()
main = do
    input <- readFile "input.txt"
    let theDance = splitOn "," input
    let dancingForever = concat (replicate 40 theDance)
    print $ lastDance (danceOrders theDance (Seq.fromList ['a'..'p']) []) 1000000000

danceOrders :: [String] -> Seq.Seq Char -> [Seq.Seq Char] -> [Seq.Seq Char]
danceOrders danceStep currentOrder allOrders
    | newOrder `elem` allOrders = reverse allOrders
    | otherwise                 = danceOrders danceStep newOrder (newOrder:allOrders)
    where
        newOrder = dance currentOrder danceStep

lastDance :: [Seq.Seq Char] -> Int -> Seq.Seq Char
lastDance danceOrders danceIter = danceOrders !! ((danceIter - 1) `mod` (length danceOrders))
