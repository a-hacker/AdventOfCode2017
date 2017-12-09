module Tower where

import qualified Data.Map as Map
import Data.List

topoSort :: Map.Map String [String] -> [[String]] -> [[String]]
topoSort depMap done
    | (snd (Map.partition null depMap)) == Map.empty = (Map.keys (fst (Map.partition null depMap))) : done
    | otherwise                                      = topoSort (Map.map (\\ (Map.keys (fst (Map.partition null depMap)))) (snd (Map.partition null depMap))) ((Map.keys (fst (Map.partition null depMap))) : done)