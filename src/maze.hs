module Maze where

import qualified Data.Map as Map

--traverseMaze :: [Int] -> Int -> Int -> Int
--traverseMaze xs curPos steps
--    | curPos >= length xs        = steps
--    | curPos < 0                 = steps
--    | otherwise                  = traverseMaze (incMaze xs curPos) (curPos + (xs !! curPos)) (steps + 1)
--
--incMaze :: [Int] -> Int -> [Int]
--incMaze xs n
-- | (xs !! n) < 3     = (take n xs) ++ (((xs !! n) + 1) : (tail (drop n xs)))
-- | otherwise = (take n xs) ++ (((xs !! n) - 1) : (tail (drop n xs)))
--
--traverseMazeGetMaze :: [Int] -> Int -> Int -> [Int]
--traverseMazeGetMaze xs curPos steps
--    | curPos >= length xs        = xs
--    | curPos < 0                 = xs
--    | otherwise                  = traverseMazeGetMaze (incMaze xs curPos) (curPos + (xs !! curPos)) (steps + 1)

traverseMaze :: Map.Map Int Int -> Int -> Int -> Int
traverseMaze xs curPos steps
    | curPos >= length xs        = steps
    | curPos < 0                 = steps
    | otherwise                  = traverseMaze (incMaze xs curPos) (curPos + (xs Map.! curPos)) (steps + 1)

incMaze :: Map.Map Int Int -> Int -> Map.Map Int Int
incMaze xs n
 | (xs Map.! n) < 3     = Map.insert n ((xs Map.! n) + 1) xs
 | otherwise        = Map.insert n ((xs Map.! n) - 1) xs

traverseMazeGetMaze :: Map.Map Int Int -> Int -> Int -> Map.Map Int Int
traverseMazeGetMaze xs curPos steps
    | curPos >= length xs        = xs
    | curPos < 0                 = xs
    | otherwise                  = traverseMazeGetMaze (incMaze xs curPos) (curPos + (xs Map.! curPos)) (steps + 1)