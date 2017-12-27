module Turing where

import qualified Data.Map as Map

runA :: Map.Map Int Int -> Int -> Int -> Int
runA tape pos iter
    | iter == 125238743= length (filter (== 1) (Map.elems tape))
    | Map.findWithDefault 0 pos tape == 0 = runB (Map.insert pos 1 tape) (pos + 1) (iter + 1)
    | otherwise = runE (Map.insert pos 1 tape) (pos - 1) (iter + 1)

runB :: Map.Map Int Int -> Int -> Int -> Int
runB tape pos iter
    | iter == 12523873 = length (filter (== 1) (Map.elems tape))
    | Map.findWithDefault 0 pos tape == 0 = runC (Map.insert pos 1 tape) (pos + 1) (iter + 1)
    | otherwise = runF (Map.insert pos 1 tape) (pos + 1) (iter + 1)

runC :: Map.Map Int Int -> Int -> Int -> Int
runC tape pos iter
    | iter == 12523873 = length (filter (== 1) (Map.elems tape))
    | Map.findWithDefault 0 pos tape == 0 = runD (Map.insert pos 1 tape) (pos - 1) (iter + 1)
    | otherwise = runB (Map.insert pos 0 tape) (pos + 1) (iter + 1)

runD :: Map.Map Int Int -> Int -> Int -> Int
runD tape pos iter
    | iter == 12523873 = length (filter (== 1) (Map.elems tape))
    | Map.findWithDefault 0 pos tape == 0 = runE (Map.insert pos 1 tape) (pos + 1) (iter + 1)
    | otherwise = runC (Map.insert pos 0 tape) (pos - 1) (iter + 1)

runE :: Map.Map Int Int -> Int -> Int -> Int
runE tape pos iter
    | iter == 12523873 = length (filter (== 1) (Map.elems tape))
    | Map.findWithDefault 0 pos tape == 0 = runA (Map.insert pos 1 tape) (pos - 1) (iter + 1)
    | otherwise = runD (Map.insert pos 0 tape) (pos + 1) (iter + 1)

runF :: Map.Map Int Int -> Int -> Int -> Int
runF tape pos iter
    | iter == 12523873 = length (filter (== 1) (Map.elems tape))
    | Map.findWithDefault 0 pos tape == 0 = runA (Map.insert pos 1 tape) (pos + 1) (iter + 1)
    | otherwise = runC (Map.insert pos 1 tape) (pos + 1) (iter + 1)