module Tower where

import qualified Data.Map as Map
import qualified Data.Set as Set
import Data.List

data Program = Program String Int [String] deriving (Show)

calcWeight :: Map.Map String Program -> Program -> Int
calcWeight _ (Program _ weight []) = weight
calcWeight mp (Program name weight depStrs)
    -- if all the weights of the children are the same, sum them with this program's weight
    | (Set.size (Set.fromList (map snd deps))) == 1 = weight + (sum (map snd deps))
    -- this is hacky but if the childrens sums don't add up, just error showing deps so I can compute by hand the value it should be
    | otherwise                                      = error (show deps)
        where deps = zip (map ((Map.!) mp) depStrs) (map (calcWeight mp) (map ((Map.!) mp) depStrs))

topoSort :: Map.Map String [String] -> [[String]] -> [[String]]
topoSort depMap done
    | (snd (Map.partition null depMap)) == Map.empty = (Map.keys (fst (Map.partition null depMap))) : done
    | otherwise                                      = topoSort (Map.map (\\ (Map.keys (fst (Map.partition null depMap)))) (snd (Map.partition null depMap))) ((Map.keys (fst (Map.partition null depMap))) : done)