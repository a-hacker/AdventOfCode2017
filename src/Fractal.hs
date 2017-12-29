module Fractal where

import qualified Data.Map as Map
import Data.List

data Square = TwoSquare String String | ThreeSquare String String String | FourSquare String String String String deriving (Show, Ord, Eq)

growFractal :: Map.Map Square Square -> Int -> [Square] -> Int
growFractal _ 18 squares = sum $ map sumOn squares
growFractal rules depth squares
    | depth `mod` 3 == 0 = growFractal rules (depth + 1) (concat (map (getSubFractals rules) (map (findFractalKey rules) squares)))
    | depth `mod` 3 == 1 = growFractal rules (depth + 1) (map ((Map.!) rules) (map (findFractalKey rules) squares))
    | otherwise = growFractal rules (depth + 1) (map ((Map.!) rules) (map (findFractalKey rules) (convertThreeSquares squares [])))

findFractalKey :: Map.Map Square Square -> Square -> Square
findFractalKey rules square@(TwoSquare (a1:a2:[]) (b1:b2:[]))
    | Map.member square rules = square
    | Map.member (TwoSquare (b1:b2:[]) (a1:a2:[])) rules = (TwoSquare (b1:b2:[]) (a1:a2:[]))
    | Map.member (TwoSquare (a2:a1:[]) (b2:b1:[])) rules = (TwoSquare (a2:a1:[]) (b2:b1:[]))
    | Map.member (TwoSquare (b1:a1:[]) (b2:a2:[])) rules = (TwoSquare (b1:a1:[]) (b2:a2:[]))
    | Map.member (TwoSquare (a2:b2:[]) (a1:b1:[])) rules = (TwoSquare (a2:b2:[]) (a1:b1:[]))
    | Map.member (TwoSquare (b2:b1:[]) (a2:a1:[])) rules = (TwoSquare (b2:b1:[]) (a2:a1:[]))
findFractalKey rules square@(ThreeSquare (a1:a2:a3:[]) (b1:b2:b3:[]) (c1:c2:c3:[]))
    | Map.member square rules = square
    | Map.member (ThreeSquare (c1:c2:c3:[]) (b1:b2:b3:[]) (a1:a2:a3:[])) rules = (ThreeSquare (c1:c2:c3:[]) (b1:b2:b3:[]) (a1:a2:a3:[]))
    | Map.member (ThreeSquare (a3:a2:a1:[]) (b3:b2:b1:[]) (c3:c2:c1:[])) rules = (ThreeSquare (a3:a2:a1:[]) (b3:b2:b1:[]) (c3:c2:c1:[]))
    | Map.member (ThreeSquare (c1:b1:a1:[]) (c2:b2:a2:[]) (c3:b3:a3:[])) rules = (ThreeSquare (c1:b1:a1:[]) (c2:b2:a2:[]) (c3:b3:a3:[]))
    | Map.member (ThreeSquare (a3:b3:c3:[]) (a2:b2:c2:[]) (a1:b1:c1:[])) rules = (ThreeSquare (a3:b3:c3:[]) (a2:b2:c2:[]) (a1:b1:c1:[]))
    | Map.member (ThreeSquare (c3:c2:c1:[]) (b3:b2:b1:[]) (a3:a2:a1:[])) rules = (ThreeSquare (c3:c2:c1:[]) (b3:b2:b1:[]) (a3:a2:a1:[]))
    | otherwise = findFractalKey rules (ThreeSquare (c1:b1:a1:[]) (c2:b2:a2:[]) (c3:b3:a3:[]))

sumOn :: Square -> Int
sumOn square = length [x | x <- (show square), x == '#']

getSubFractals :: Map.Map Square Square -> Square -> [Square]
getSubFractals rules square = do
    let (FourSquare (a1:a2:a3:a4:[]) (b1:b2:b3:b4:[]) (c1:c2:c3:c4:[]) (d1:d2:d3:d4:[])) = rules Map.! square
    [(TwoSquare (a1:a2:[]) (b1:b2:[])), (TwoSquare (a3:a4:[]) (b3:b4:[])), (TwoSquare (c1:c2:[]) (d1:d2:[])), (TwoSquare (c3:c4:[]) (d3:d4:[]))]

-- a11 a12 | a13 a21 | a22 a23
-- b11 b12 | b13 b21 | b22 b23
-- ---------------------------
-- c11 c12 | c13 c21 | c22 c23
-- a31 a32 | a33 a41 | a42 a43
-- ---------------------------
-- b31 b32 | b33 b41 | b42 b43
-- c31 c32 | c33 c41 | c42 c43
convertThreeSquares :: [Square] -> [Square] -> [Square]
convertThreeSquares [] converted = converted
convertThreeSquares ((ThreeSquare (a11:a12:a13:[]) (b11:b12:b13:[]) (c11:c12:c13:[])):
                    (ThreeSquare (a21:a22:a23:[]) (b21:b22:b23:[]) (c21:c22:c23:[])):
                    (ThreeSquare (a31:a32:a33:[]) (b31:b32:b33:[]) (c31:c32:c33:[])):
                    (ThreeSquare (a41:a42:a43:[]) (b41:b42:b43:[]) (c41:c42:c43:[])):xs) converted = do
    let x1 = (TwoSquare (a11:a12:[]) (b11:b12:[]))
    let x2 = (TwoSquare (a13:a21:[]) (b13:b21:[]))
    let x3 = (TwoSquare (a22:a23:[]) (b22:b23:[]))
    let x4 = (TwoSquare (c11:c12:[]) (a31:a32:[]))
    let x5 = (TwoSquare (c13:c21:[]) (a33:a41:[]))
    let x6 = (TwoSquare (c22:c23:[]) (a42:a43:[]))
    let x7 = (TwoSquare (b31:b32:[]) (c31:c32:[]))
    let x8 = (TwoSquare (b33:b41:[]) (c33:c41:[]))
    let x9 = (TwoSquare (b42:b43:[]) (c42:c43:[]))
    convertThreeSquares xs (x1:x2:x3:x4:x5:x6:x7:x8:x9:converted)