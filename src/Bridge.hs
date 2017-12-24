module Bridge where

import qualified Data.Set as Set

data Component = Component Int Int deriving (Eq, Show, Ord)

hasPort :: Int -> Component -> Bool
hasPort port comp@(Component p1 p2) = port == p1 || port == p2

getAdjacentPort :: Int -> Component -> Int
getAdjacentPort port comp@(Component p1 p2)
    | port == p1 = p2
    | port == p2 = p1
    | otherwise = error ((show comp) ++ " lacks port " ++ (show port))

preBuild :: Set.Set Component -> (Int, Int) -> Int -> Component -> (Int, Int)
preBuild availableComps (length, strength) openPort comp@(Component p1 p2) = build (Set.delete comp availableComps) (length + 1, strength + p1 + p2) (getAdjacentPort openPort comp)

build :: Set.Set Component -> (Int, Int) -> Int -> (Int, Int)
build availableComps length openPort
    | Set.null possibleComps = length
    | otherwise = Set.findMax (Set.map (preBuild availableComps length openPort) possibleComps)
    where possibleComps = Set.filter (hasPort openPort) availableComps