module Register where

import qualified Data.Map as Map
import Data.List
import Data.Maybe

updateRegisters :: [[String]] -> Map.Map String Int -> Int
updateRegisters [] mp = mp Map.! "??highest"
updateRegisters xxs mp = updateRegisters (tail xxs) (computeInstruction (head xxs) mp)

computeInstruction :: [String] -> Map.Map String Int -> Map.Map String Int
computeInstruction (target:instr:offset:"if":reg:op:val:[]) mp
 | computed > (mp Map.! "??highest") = Map.insert "??highest" computed (Map.insert target computed mp)
 | otherwise                         = Map.insert target computed mp
    where
    computed = ((parseInstr instr) (Map.findWithDefault 0 target mp) (parseOffset offset reg op val mp))

parseInstr :: String -> (Int -> Int -> Int)
parseInstr "inc" = (+)
parseInstr "dec" = (-)

parseOffset :: String -> String -> String -> String -> Map.Map String Int -> Int
parseOffset offset reg op val mp
    | (evalCond (Map.findWithDefault 0 reg mp) (read val) op) = (read offset)
    | otherwise                                               = 0

evalCond :: Int -> Int -> String -> Bool
evalCond leftVal rightVal op
    | op == ">"  = leftVal > rightVal
    | op == ">=" = leftVal >= rightVal
    | op == "<"  = leftVal < rightVal
    | op == "<=" = leftVal <= rightVal
    | op == "=="  = leftVal == rightVal
    | op == "!=" = leftVal /= rightVal