module Virus where

import qualified Data.Map as Map

import Direction

scan :: Map.Map (Int, Int) Bool -> (Direction, (Int, Int)) -> Int -> Int -> Int
scan grid (dir, pos@(x, y)) 10000 infected = infected
scan grid (dir, pos@(x, y)) burst infected
    | posStatus = scan (Map.insert pos (not posStatus) grid) (goRight dir pos) (burst + 1) infected
    | otherwise = scan (Map.insert pos (not posStatus) grid) (goLeft dir pos) (burst + 1) (infected + 1)
    where
        posStatus = Map.findWithDefault False pos grid

createGrid :: [String] -> Int -> Map.Map (Int, Int) Bool -> Map.Map (Int, Int) Bool
createGrid [] _ parsedGrid = parsedGrid
createGrid rawGrid yVal parsedGrid = createGrid (tail rawGrid) (yVal + 1) (foldl (parseSpace yVal (length (head rawGrid))) parsedGrid (head rawGrid))

parseSpace :: Int -> Int -> Map.Map (Int, Int) Bool -> Char -> Map.Map (Int, Int) Bool
parseSpace yVal xLen grid status = (Map.insert (((Map.size grid) `mod` xLen), yVal) (status == '#') grid)
