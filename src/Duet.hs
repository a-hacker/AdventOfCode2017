module Duet where

import Data.Char
import qualified Data.Map as Map

parseInstruction :: [String] -> Int -> Int -> Map.Map Char Int -> Int
parseInstruction instructions currentPos lastSnd registers
    | instr == "snd" = parseInstruction instructions (currentPos + 1) (getFromMap registers val1) registers
    | instr == "rcv" = if ((getFromMap registers val1) == 0)
        then parseInstruction instructions (currentPos + 1) lastSnd registers
        else lastSnd
    | instr == "set" = parseInstruction instructions (currentPos + 1) lastSnd (Map.insert (head val1) (getFromMap registers val2) registers)
    | instr == "add" = parseInstruction instructions (currentPos + 1) lastSnd (Map.insert (head val1) ((getFromMap registers val1) + (getFromMap registers val2)) registers)
    | instr == "mul" = parseInstruction instructions (currentPos + 1) lastSnd (Map.insert (head val1) ((getFromMap registers val1) * (getFromMap registers val2)) registers)
    | instr == "mod" = parseInstruction instructions (currentPos + 1) lastSnd (Map.insert (head val1) ((getFromMap registers val1) `mod` (getFromMap registers val2)) registers)
    | instr == "jgz" = if getFromMap registers val1 == 0
        then parseInstruction instructions (currentPos + 1) lastSnd registers
        else parseInstruction instructions (currentPos + (getFromMap registers val2)) lastSnd registers
    | otherwise = undefined
    where
        (instr:val1:maybeVal2) = words (instructions !! currentPos)
        val2 = if null maybeVal2 then "" else head maybeVal2

getFromMap :: Map.Map Char Int -> String -> Int
getFromMap registers key
    | isDigit (last key) = read key
    | otherwise = Map.findWithDefault 0 (head key) registers