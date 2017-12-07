module Malloc where

import Data.List
import Data.Maybe
import Data.Ord (compare)
import Data.Function (on)
import qualified Data.Set as Set

massMalloc :: Int -> Set.Set [(Int, Int)] -> [(Int, Int)] -> Int
massMalloc steps seen banks
    | Set.member banks seen        = steps
    | otherwise                    = massMalloc (steps + 1) (Set.insert banks seen) (malloc banks)

malloc :: [(Int, Int)] -> [(Int, Int)]
malloc xs = let maxPos = (fst (maximumBy compareBank xs)) in
    map (calcDist (maxPos, (fromJust (lookup maxPos xs))) (length xs)) ((take maxPos xs) ++ ((maxPos, 0) : (drop (maxPos + 1) xs)))

calcDist :: (Int, Int) -> Int -> (Int, Int) -> (Int, Int)
calcDist (maxPos, max) len (ind, y)
    | (((ind + len - 1) - maxPos) `mod` len) < (max `mod` len)   = (ind, (max `div` len) + y + 1)
    | otherwise                                                  = (ind, (max `div` len) + y)

compareBank :: (Int, Int) -> (Int, Int) -> Ordering
compareBank (k1, v1) (k2, v2)
    | v1 > v2 = GT   -- First compare the length of the strings
    | v1 < v2 = LT
    | k1 < k2 = GT       -- If they are equal, compare the indices
    | k1 > k2 = LT       -- (mind the reversed order, since you want the lowest index)
    | otherwise = EQ

