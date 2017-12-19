module Tubular where

import Data.Array
import Data.Char
import Data.Tuple

data Direction = North | South | East | West deriving (Enum, Eq)

updatePos :: Direction -> (Int, Int) -> (Int, Int)
updatePos dir (x, y)
    | dir == North = (x, y - 1)
    | dir == South = (x, y + 1)
    | dir == East = (x + 1, y)
    | dir == West = (x - 1, y)

goLeft :: Direction -> (Int, Int) -> (Direction, (Int, Int))
goLeft dir pos
    | dir == North = (West, updatePos West pos)
    | dir == South = (East, updatePos East pos)
    | dir == East = (North, updatePos North pos)
    | dir == West = (South, updatePos South pos)

goRight :: Direction -> (Int, Int) -> (Direction, (Int, Int))
goRight dir pos
    | dir == North = (East, updatePos East pos)
    | dir == South = (West, updatePos West pos)
    | dir == East = (South, updatePos South pos)
    | dir == West = (North, updatePos North pos)

parseTube :: Array Int (Array Int Char) -> Direction -> (Int, Int) -> String -> String
parseTube tube dir pos@(x, y) markers
    | (y < fst (bounds tube)) || (y > snd (bounds tube)) = reverse markers
    | (x < fst (bounds (tube ! 0))) || (x > snd (bounds (tube ! 0))) = reverse markers
    | isSpace tubeChar = reverse markers
    | tubeChar == '|' || tubeChar == '-' = parseTube tube dir (updatePos dir pos) markers
    | isAlpha tubeChar = parseTube tube dir (updatePos dir pos) (tubeChar:markers)
    | tubeChar == '+' = let (leftDir, leftPos@(xL, yL)) = (goLeft dir pos)
        in do
            if not $ isSpace ((tube ! yL) ! xL)
                then parseTube tube leftDir leftPos markers
                else let (rightDir, rightPos@(xR, yR)) = (goRight dir pos)
                    in parseTube tube rightDir rightPos markers
    where tubeChar = ((tube ! y) ! x)