module Particle where

data Coordinate = Coordinate Int Int Int deriving (Show)

data Particle = Particle Coordinate Coordinate Coordinate deriving (Show)

getAcceleration :: Particle -> Coordinate
getAcceleration (Particle pos vel acc) = acc

getManhattanDist :: Coordinate -> Int
getManhattanDist (Coordinate x y z) = (abs x) + (abs y) + (abs z)