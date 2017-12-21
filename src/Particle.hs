module Particle where

data Coordinate = Coordinate Int Int Int deriving (Show, Eq, Ord)

data Particle = Particle Coordinate Coordinate Coordinate deriving (Show)
instance Eq Particle where
    (Particle pos1 vel1 acc1) == (Particle pos2 vel2 acc2) = pos1 == pos2
instance Ord Particle where
    (Particle pos1 vel1 acc1) `compare` (Particle pos2 vel2 acc2) = pos1 `compare` pos2

getAcceleration :: Particle -> Coordinate
getAcceleration (Particle pos vel acc) = acc

getManhattanDist :: Coordinate -> Int
getManhattanDist (Coordinate x y z) = (abs x) + (abs y) + (abs z)

moveParticle :: Particle -> Particle
moveParticle (Particle (Coordinate xPos yPos zPos) (Coordinate xVel yVel zVel) acc@(Coordinate xAcc yAcc zAcc)) = do
    let xNVel = xVel + xAcc
    let yNVel = yVel + yAcc
    let zNVel = zVel + zAcc
    let newVel = (Coordinate xNVel yNVel zNVel)
    let newPos = (Coordinate (xPos + xNVel) (yPos + yNVel) (zPos + zNVel))
    (Particle newPos newVel acc)