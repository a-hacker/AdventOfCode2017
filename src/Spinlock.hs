module Spinlock where

import Data.Maybe
import qualified Data.Sequence as Seq

whirl :: Int -> Seq.Seq Int -> Seq.Seq Int
whirl stepSize buf = Seq.insertAt ((lastPos + stepSize + 1) `mod` bufSize) bufSize buf
    where
        bufSize = Seq.length buf
        lastPos = fromJust $ Seq.elemIndexL (bufSize - 1) buf

scVal :: Int -> Seq.Seq Int -> Int
scVal 2017 buf = Seq.index buf ((fromJust $ Seq.elemIndexL (2017) buf) + 1)
scVal iter buf = scVal (iter + 1) (whirl 3 buf)