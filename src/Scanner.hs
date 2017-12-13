module Scanner where

import qualified Data.Map as Map

navigateFirewall :: Map.Map Int Int -> Int -> Int -> Int
navigateFirewall scanners pos total
    | pos > (fst (Map.findMax scanners)) = total
    | Map.notMember pos scanners  = navigateFirewall scanners (pos + 1) total
    | otherwise                   = do
        let caught = pos `mod` (((scanners Map.! pos) - 1) * 2) == 0
        if caught
            then navigateFirewall scanners (pos + 1) (total + (scanners Map.! pos) * pos)
            else navigateFirewall scanners (pos + 1) total