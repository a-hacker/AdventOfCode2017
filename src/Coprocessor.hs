module Coprocessor where

import Data.Char
import qualified Data.Map as Map

data Executor = SingleExec [String] Int Int (Map.Map Char Int) | PairedExec [String] Int (Map.Map Char Int) [Int] deriving (Show, Eq)

parseInstruction :: Executor -> Int
parseInstruction exec@(SingleExec instructions currentPos mults registers)
    | currentPos >= (length instructions) = (registers Map.! 'h')
    | instr == "set" = parseInstruction (SingleExec instructions (currentPos + 1) mults (Map.insert (head val1) (getFromMap registers val2) registers))
    | instr == "sub" = parseInstruction (SingleExec instructions (currentPos + 1) mults (Map.insert (head val1) ((getFromMap registers val1) - (getFromMap registers val2)) registers))
    | instr == "mul" = parseInstruction (SingleExec instructions (currentPos + 1) (mults + 1) (Map.insert (head val1) ((getFromMap registers val1) * (getFromMap registers val2)) registers))
    | instr == "jnz" = if getFromMap registers val1 == 0
        then parseInstruction (SingleExec instructions (currentPos + 1) mults registers)
        else parseInstruction (SingleExec instructions (currentPos + (getFromMap registers val2)) mults registers)
    | otherwise = undefined
    where
        (instr:val1:maybeVal2) = words (instructions !! currentPos)
        val2 = if null maybeVal2 then "" else head maybeVal2

getFromMap :: Map.Map Char Int -> String -> Int
getFromMap registers key
    | isDigit (last key) = read key
    | otherwise = Map.findWithDefault 0 (head key) registers