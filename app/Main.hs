module Main where

import Data.List.Split
import Data.List

import Particle


main :: IO ()
main = do
    input <- readFile "input.txt"
    let particles = (map parseParticle (lines input))
    let particleMap = zip (map getManhattanDist (map getAcceleration particles)) [0..(length particles)]
    print $ [x | x <- particleMap, ((fst x) == (fst(minimum particleMap)))]

parseParticle :: String -> Particle
parseParticle partDef = do
    let partialStrs = splitOn ", " partDef
    let (pos:vel:acc:[]) = map getNums partialStrs
    (Particle pos vel acc)

getNums :: String -> Coordinate
getNums coordStr = do
    let (x:y:z:_) = splitOn "," (drop 3 (take ((length coordStr) - 1) coordStr))
    (Coordinate (read x :: Int) (read y :: Int) (read z :: Int))
