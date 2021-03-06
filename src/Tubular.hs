module Tubular where

import Data.Array
import Data.Char
import Data.Tuple

import Direction

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


lengthTube :: Array Int (Array Int Char) -> Direction -> (Int, Int) -> Int -> Int
lengthTube tube dir pos@(x, y) len
    | (y < fst (bounds tube)) || (y > snd (bounds tube)) = len
    | (x < fst (bounds (tube ! 0))) || (x > snd (bounds (tube ! 0))) = len
    | isSpace tubeChar = len
    | tubeChar == '|' || tubeChar == '-' = lengthTube tube dir (updatePos dir pos) (len + 1)
    | isAlpha tubeChar = lengthTube tube dir (updatePos dir pos) (len + 1)
    | tubeChar == '+' = let (leftDir, leftPos@(xL, yL)) = (goLeft dir pos)
        in do
            if not $ isSpace ((tube ! yL) ! xL)
                then lengthTube tube leftDir leftPos (len + 1)
                else let (rightDir, rightPos@(xR, yR)) = (goRight dir pos)
                    in lengthTube tube rightDir rightPos (len + 1)
    where tubeChar = ((tube ! y) ! x)