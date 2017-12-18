module Spinlock where

import Data.Maybe
import qualified Data.Sequence as Seq

whirl :: Int -> Seq.Seq Int -> Int -> (Seq.Seq Int, Int)
whirl stepSize buf lastPos = ((Seq.insertAt ((lastPos + stepSize + 1) `mod` bufSize) bufSize buf), ((lastPos + stepSize + 1) `mod` bufSize))
    where
        bufSize = Seq.length buf

scVal :: Int -> Int -> Seq.Seq Int -> Int
scVal 50000000 pos buf = Seq.index buf (((fromJust $ Seq.elemIndexL (0) buf) + 1) `mod` (Seq.length buf))
scVal iter pos buf = scVal (iter + 1) newPos newBuf
    where (newBuf, newPos) = whirl 337 buf pos