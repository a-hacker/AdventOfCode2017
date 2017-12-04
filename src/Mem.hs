module Mem
    ( spiralVals
    ) where

import qualified Data.Map as Map
import Data.Maybe

spiralDist :: (Int, Int, Int, Bool, Bool, Bool, Int) -> Int
spiralDist (curPos, xPos, yPos, isRight, isUp, curX, maxVal)
    | curPos == maxVal                                   = (abs xPos) + (abs yPos)
    | (abs xPos) == (abs yPos) + 1 && curX && isRight    = spiralDist (curPos + 1, xPos, yPos + 1, not isRight, isUp, not curX, maxVal)
    | (abs xPos) == (abs yPos) && curX && not isRight    = spiralDist (curPos + 1, xPos, yPos - 1, not isRight, isUp, not curX, maxVal)
    | (abs xPos) == (abs yPos) && isUp && not curX       = spiralDist (curPos + 1, xPos - 1, yPos, isRight, not isUp, not curX, maxVal)
    | (abs xPos) == (abs yPos) && not isUp && not curX   = spiralDist (curPos + 1, xPos + 1, yPos, isRight, not isUp, not curX, maxVal)
    | curX && isRight                                    = spiralDist (curPos + 1, xPos + 1, yPos, isRight, isUp, curX, maxVal)
    | curX                                               = spiralDist (curPos + 1, xPos - 1, yPos, isRight, isUp, curX, maxVal)
    | isUp                                               = spiralDist (curPos + 1, xPos, yPos + 1, isRight, isUp, curX, maxVal)
    | otherwise                                          = spiralDist (curPos + 1, xPos, yPos - 1, isRight, isUp, curX, maxVal)

spiralVals :: (Int, Int, Int, Bool, Bool, Bool, Int, Map.Map (Int, Int) Int) -> Int
spiralVals (curPos, xPos, yPos, isRight, isUp, curX, maxVal, prevVals)
    | calcVal (xPos, yPos, prevVals) > maxVal            = calcVal (xPos, yPos, prevVals)
    | (abs xPos) == (abs yPos) + 1 && curX && isRight    = spiralVals (curPos + 1, xPos, yPos + 1, not isRight, isUp, not curX, maxVal
                                                                       , Map.insert (xPos, yPos) (calcVal (xPos, yPos, prevVals)) prevVals)
    | (abs xPos) == (abs yPos) && curX && not isRight    = spiralVals (curPos + 1, xPos, yPos - 1, not isRight, isUp, not curX, maxVal
                                                                       , Map.insert (xPos, yPos) (calcVal (xPos, yPos, prevVals)) prevVals)
    | (abs xPos) == (abs yPos) && isUp && not curX       = spiralVals (curPos + 1, xPos - 1, yPos, isRight, not isUp, not curX, maxVal
                                                                       , Map.insert (xPos, yPos) (calcVal (xPos, yPos, prevVals)) prevVals)
    | (abs xPos) == (abs yPos) && not isUp && not curX   = spiralVals (curPos + 1, xPos + 1, yPos, isRight, not isUp, not curX, maxVal
                                                                       , Map.insert (xPos, yPos) (calcVal (xPos, yPos, prevVals)) prevVals)
    | curX && isRight                                    = spiralVals (curPos + 1, xPos + 1, yPos, isRight, isUp, curX, maxVal
                                                                       , Map.insert (xPos, yPos) (calcVal (xPos, yPos, prevVals)) prevVals)
    | curX                                               = spiralVals (curPos + 1, xPos - 1, yPos, isRight, isUp, curX, maxVal
                                                                       , Map.insert (xPos, yPos) (calcVal (xPos, yPos, prevVals)) prevVals)
    | isUp                                               = spiralVals (curPos + 1, xPos, yPos + 1, isRight, isUp, curX, maxVal
                                                                       , Map.insert (xPos, yPos) (calcVal (xPos, yPos, prevVals)) prevVals)
    | otherwise                                          = spiralVals (curPos + 1, xPos, yPos - 1, isRight, isUp, curX, maxVal
                                                                       , Map.insert (xPos, yPos) (calcVal (xPos, yPos, prevVals)) prevVals)

calcVal :: (Int, Int, Map.Map (Int, Int) Int) -> Int
calcVal (0, 0, _) = 1
calcVal (xPos, yPos, prevVals) = sum [ fromMaybe 0 x | x <- [
    Map.lookup (xPos - 1, yPos - 1) prevVals,
    Map.lookup (xPos - 1, yPos + 1) prevVals,
    Map.lookup (xPos - 1, yPos) prevVals,
    Map.lookup (xPos, yPos - 1) prevVals,
    Map.lookup (xPos, yPos + 1) prevVals,
    Map.lookup (xPos + 1, yPos - 1) prevVals,
    Map.lookup (xPos + 1, yPos + 1) prevVals,
    Map.lookup (xPos + 1, yPos) prevVals
    ]]