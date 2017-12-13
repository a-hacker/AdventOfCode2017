module Main where

import Pipe
import Data.List.Split
import qualified Data.Set as Set
import qualified Data.Map as Map

main :: IO ()
main = do
    input <- readFile "input.txt"
    let pipes = Map.fromList (map inputToTuple (map words (lines input)))
    --print $ (Set.fromList [0, 2, 3, 4]) Set.\\ (pipes Map.! 0)
    print $ countPipelines pipes 0

inputToTuple :: [String] -> (Int, Set.Set Int)
inputToTuple (key:"<->":vals) = ((read key), (Set.map read (Set.fromList vals)))

