module Defragmenter where

import qualified Data.Sequence as Seq

traverseRegion :: Seq.Seq (Seq.Seq Char) -> (Int, Int) -> Seq.Seq (Seq.Seq Char)
traverseRegion regionMap (x, y)
    | x < 0 = regionMap
    | y < 0 = regionMap
    | x > 127 = regionMap
    | y > 127 = regionMap
    | (Seq.index (Seq.index regionMap y) x) == '0' = regionMap
    | otherwise = do
        let adjacent = [(x + 1, y), (x - 1, y), (x, y + 1), (x, y - 1)]
        let zeroedSquare =  Seq.update y (Seq.update x '0' (Seq.index regionMap y)) regionMap
        --((take x (regionMap !! y)) ++ ('0' : (drop (x + 1) (regionMap !! y)))) : (drop (y + 1) regionMap))
        foldl traverseRegion zeroedSquare adjacent

countRegions :: Seq.Seq (Seq.Seq Char) -> Int -> Int
countRegions regionMap total
    | y > 127 = total
    | otherwise = do
        let x = length (Seq.takeWhileL (== '0') (Seq.index regionMap y))
        countRegions (traverseRegion regionMap (x, y)) (total + 1)
    where
        y = length (Seq.takeWhileL (all (== '0')) regionMap)