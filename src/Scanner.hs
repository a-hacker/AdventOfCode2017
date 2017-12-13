module Scanner where

import qualified Data.Map as Map

navigateFirewall :: Map.Map Int Int -> Int -> Int -> Bool
navigateFirewall scanners pos sec
    | pos > (fst (Map.findMax scanners)) = True
    | Map.notMember pos scanners  = navigateFirewall scanners (pos + 1) (sec + 1)
    | otherwise                   = do
        let caught = sec `mod` (((scanners Map.! pos) - 1) * 2) == 0
        if caught
            then False
            else navigateFirewall scanners (pos + 1) (sec + 1)

attemptRun :: Map.Map Int Int -> Int -> Int
attemptRun scanners delay
    | navigateFirewall scanners 0 delay = delay
    | otherwise                         = attemptRun scanners (delay + 1)