module Main where

import Data.List.Split
import Data.List

import Particle


main :: IO ()
main = do
    input <- readFile "input.txt"
    let particles = map parseParticle (lines input)
    let particlesLeft = foldl runParticles particles [0..300]
    print $ length particlesLeft

parseParticle :: String -> Particle
parseParticle partDef = do
    let partialStrs = splitOn ", " partDef
    let (pos:vel:acc:[]) = map getNums partialStrs
    (Particle pos vel acc)

getNums :: String -> Coordinate
getNums coordStr = do
    let (x:y:z:_) = splitOn "," (drop 3 (take ((length coordStr) - 1) coordStr))
    (Coordinate (read x :: Int) (read y :: Int) (read z :: Int))

removeCollidingParticles :: [Particle] -> [Particle]
removeCollidingParticles particles = concat [x | x <- group (sort particles), (length x) == 1]

runParticles :: [Particle] -> Int -> [Particle]
runParticles particles _ = map moveParticle (removeCollidingParticles particles)
