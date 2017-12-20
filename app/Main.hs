module Main where

import Data.Array

import Tubular


main :: IO ()
main = do
    input <- readFile "input.txt"
    let tubeList = lines input
    let tube = listArray (0, (length tubeList - 1)) [listArray (0, (length x) - 1) x | x <- tubeList]
    --print $ [length (tube ! x) | x <- [1..200]]
    print $ lengthTube tube South (131, 0) 0

