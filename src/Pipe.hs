module Pipe where

import qualified Data.Map as Map
import qualified Data.Set as Set

traversePipes :: Map.Map Int (Set.Set Int) -> Int -> Set.Set Int-> Set.Set Int
traversePipes pipes pos traversed
    | traversed == posTraversed = posTraversed
    | otherwise                 = Set.foldr (traversePipes pipes) posTraversed (posTraversed Set.\\ traversed)
    where
        posTraversed = Set.union (pipes Map.! pos) traversed


countPipelines :: Map.Map Int (Set.Set Int) -> Int -> Int
countPipelines pipesLeft pipelineNum
    | Map.null pipesLeft = pipelineNum
    | otherwise          = do
        let aPipeline = traversePipes pipesLeft (head (Map.keys pipesLeft)) Set.empty
        countPipelines (Set.foldr Map.delete pipesLeft aPipeline) (pipelineNum + 1)