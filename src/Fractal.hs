module Fractal where

import qualified Data.Map as Map

growFractal :: Map.Map String String -> Int -> String -> Int
growFractal _ 5 square = sumOn square
growFractal rules depth square@(a1:a2:'/':b1:b2:[]) = growFractal rules (depth + 1) (rules Map.! squareKey)
    where squareKey = findFractalKey rules square
growFractal rules depth square@(a1:a2:a3:'/':b1:b2:b3:'/':c1:c2:c3:[]) = sum (map (growFractal rules (depth + 1)) (getSubFractals rules squareKey))
    where squareKey = findFractalKey rules square
growFractal rules depth square = error square

findFractalKey :: Map.Map String String -> String -> String
findFractalKey rules square@(a1:a2:'/':b1:b2:[])
    | Map.member square rules = square
    | Map.member (b1:b2:'/':a1:a2:[]) rules = (b1:b2:'/':a1:a2:[])
    | Map.member (a2:a1:'/':b2:b1:[]) rules = (a2:a1:'/':b2:b1:[])
    | Map.member (b1:a1:'/':b2:a2:[]) rules = (b1:a1:'/':b2:a2:[])
    | Map.member (a2:b2:'/':a1:b1:[]) rules = (a2:b2:'/':a1:b1:[])
    | Map.member (b2:b1:'/':a2:a1:[]) rules = (b2:b1:'/':a2:a1:[])
findFractalKey rules square@(a1:a2:a3:'/':b1:b2:b3:'/':c1:c2:c3:[])
    | Map.member square rules = square
    | Map.member (c1:c2:c3:'/':b1:b2:b3:'/':a1:a2:a3:[]) rules = (c1:c2:c3:'/':b1:b2:b3:'/':a1:a2:a3:[])
    | Map.member (a3:a2:a1:'/':b3:b2:b1:'/':c3:c2:c1:[]) rules = (a3:a2:a1:'/':b3:b2:b1:'/':c3:c2:c1:[])
    | Map.member (c1:b1:a1:'/':c2:b2:a2:'/':c3:b3:a3:[]) rules = (c1:b1:a1:'/':c2:b2:a2:'/':c3:b3:a3:[])
    | Map.member (a3:b3:c3:'/':a2:b2:c2:'/':a1:b1:c1:[]) rules = (a3:b3:c3:'/':a2:b2:c2:'/':a1:b1:c1:[])
    | Map.member (c3:c2:c1:'/':b3:b2:b1:'/':a3:a2:a1:[]) rules = (c3:c2:c1:'/':b3:b2:b1:'/':a3:a2:a1:[])
    | otherwise = findFractalKey rules (c1:b1:a1:'/':c2:b2:a2:'/':c3:b3:a3:[])

sumOn :: String -> Int
sumOn square = length [x | x <- square, x == '#']

getSubFractals :: Map.Map String String -> String -> [String]
getSubFractals rules square = do
    let (a1:a2:a3:a4:'/':b1:b2:b3:b4:'/':c1:c2:c3:c4:'/':d1:d2:d3:d4:[]) = rules Map.! square
    [a1:a2:'/':b1:b2:[], a3:a4:'/':b3:b4:[], c1:c2:'/':d1:d2:[], c3:c4:'/':d3:d4:[]]