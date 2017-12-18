module Duet where

import Data.Char
import qualified Data.Map as Map

data Executor = SingleExec [String] Int Int (Map.Map Char Int) | PairedExec [String] Int (Map.Map Char Int) [Int] deriving (Show, Eq)

parseInstruction :: Executor -> (Int, Executor)
parseInstruction exec@(SingleExec instructions currentPos lastSnd registers)
    | instr == "snd" = parseInstruction (SingleExec instructions (currentPos + 1) (getFromMap registers val1) registers)
    | instr == "rcv" = if ((getFromMap registers val1) == 0)
        then parseInstruction (SingleExec instructions (currentPos + 1) lastSnd registers)
        else (lastSnd, exec)
    | instr == "set" = parseInstruction (SingleExec instructions (currentPos + 1) lastSnd (Map.insert (head val1) (getFromMap registers val2) registers))
    | instr == "add" = parseInstruction (SingleExec instructions (currentPos + 1) lastSnd (Map.insert (head val1) ((getFromMap registers val1) + (getFromMap registers val2)) registers))
    | instr == "mul" = parseInstruction (SingleExec instructions (currentPos + 1) lastSnd (Map.insert (head val1) ((getFromMap registers val1) * (getFromMap registers val2)) registers))
    | instr == "mod" = parseInstruction (SingleExec instructions (currentPos + 1) lastSnd (Map.insert (head val1) ((getFromMap registers val1) `mod` (getFromMap registers val2)) registers))
    | instr == "jgz" = if getFromMap registers val1 == 0
        then parseInstruction (SingleExec instructions (currentPos + 1) lastSnd registers)
        else parseInstruction (SingleExec instructions (currentPos + (getFromMap registers val2)) lastSnd registers)
    | otherwise = undefined
    where
        (instr:val1:maybeVal2) = words (instructions !! currentPos)
        val2 = if null maybeVal2 then "" else head maybeVal2

parseInstruction exec@(PairedExec instructions currentPos registers queue)
    | instr == "snd" = (getFromMap registers val1, (PairedExec instructions (currentPos + 1) registers queue))
    | instr == "rcv" = if (null queue)
        then ((maxBound :: Int), exec)
        else parseInstruction (PairedExec instructions (currentPos + 1) (Map.insert (head val1) (getFromMap registers (show (last queue))) registers) (init queue))
    | instr == "set" = parseInstruction (PairedExec instructions (currentPos + 1) (Map.insert (head val1) (getFromMap registers val2) registers) queue)
    | instr == "add" = parseInstruction (PairedExec instructions (currentPos + 1) (Map.insert (head val1) ((getFromMap registers val1) + (getFromMap registers val2)) registers) queue)
    | instr == "mul" = parseInstruction (PairedExec instructions (currentPos + 1) (Map.insert (head val1) ((getFromMap registers val1) * (getFromMap registers val2)) registers) queue)
    | instr == "mod" = parseInstruction (PairedExec instructions (currentPos + 1) (Map.insert (head val1) ((getFromMap registers val1) `mod` (getFromMap registers val2)) registers) queue)
    | instr == "jgz" = if getFromMap registers val1 <= 0
        then parseInstruction (PairedExec instructions (currentPos + 1) registers queue)
        else parseInstruction (PairedExec instructions (currentPos + (getFromMap registers val2)) registers queue)
    | otherwise = undefined
    where
        (instr:val1:maybeVal2) = words (instructions !! currentPos)
        val2 = if null maybeVal2 then "" else head maybeVal2

getFromMap :: Map.Map Char Int -> String -> Int
getFromMap registers key
    | isDigit (last key) = read key
    | otherwise = Map.findWithDefault 0 (head key) registers

runRegisters :: Executor -> Executor -> (Int, Int) -> Bool -> (Int, Int)
runRegisters exec1 exec2@(PairedExec instructions currentPos registers queue) snds@(snd1, snd2) waiting
    | regVal == (maxBound :: Int) && waiting = snds
    | regVal == (maxBound :: Int) = runRegisters exec2 exec (snd2, snd1) True
    | otherwise = runRegisters exec (PairedExec instructions currentPos registers (regVal:queue)) (snd1 + 1, snd2) False
    where (regVal, exec) = parseInstruction exec1