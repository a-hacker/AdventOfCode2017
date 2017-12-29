module Main where

import qualified Data.Map as Map
import Data.List.Split

import Fractal


main :: IO ()
main = do
    input <- readFile "input.txt"
    let rules = Map.fromList (map parseRule (lines input))
    print $ growFractal rules 0 [(ThreeSquare ".#." "..#" "###")]

parseRule :: String -> (Square, Square)
parseRule rule = do
    let spltStr = splitOn " => " rule
    let (keySquareStr:valSquareStr:[]) = map (splitOn "/") (spltStr)
    if (length keySquareStr == 2)
        then ((TwoSquare (head keySquareStr) (last keySquareStr)), (ThreeSquare (head valSquareStr) (head (tail valSquareStr)) (last valSquareStr)))
        else ((ThreeSquare (head keySquareStr) (head (tail keySquareStr)) (last keySquareStr)), (FourSquare (head valSquareStr) (head (tail valSquareStr)) (last (init valSquareStr)) (last valSquareStr)))
