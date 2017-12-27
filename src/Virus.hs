module Virus where

import qualified Data.Map as Map

import Direction

--0 = clean, 1 = weakened, 2 = infected, 3 = flagged
scan :: Map.Map (Int, Int) Int -> (Direction, (Int, Int)) -> Int -> Int -> Int
scan grid (dir, pos@(x, y)) 10000000 infected = infected
scan grid (dir, pos@(x, y)) burst infected
    | posStatus == 0 = scan (Map.insert pos 1 grid) (goLeft dir pos) (burst + 1) infected
    | posStatus == 1 = scan (Map.insert pos 2 grid) (dir, updatePos dir pos) (burst + 1) (infected + 1)
    | posStatus == 2 = scan (Map.insert pos 3 grid) (goRight dir pos) (burst + 1) infected
    | posStatus == 3 = scan (Map.insert pos 0 grid) (goBack dir pos) (burst + 1) infected
    where
        posStatus = Map.findWithDefault 0 pos grid

createGrid :: [String] -> Int -> Map.Map (Int, Int) Int -> Map.Map (Int, Int) Int
createGrid [] _ parsedGrid = parsedGrid
createGrid rawGrid yVal parsedGrid = createGrid (tail rawGrid) (yVal + 1) (foldl (parseSpace yVal (length (head rawGrid))) parsedGrid (head rawGrid))

parseSpace :: Int -> Int -> Map.Map (Int, Int) Int -> Char -> Map.Map (Int, Int) Int
parseSpace yVal xLen grid status = (Map.insert (((Map.size grid) `mod` xLen), yVal) (if status == '#' then 2 else 0) grid)
