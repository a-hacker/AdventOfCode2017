module Passphrase
    ( uniqueAnagrams
    ) where

import qualified Data.Set as Set
import qualified Data.Map as Map

uniquePhrases :: [String] -> Bool
uniquePhrases xs = Set.size (Set.fromList xs) == length xs

uniqueAnagrams :: [String] -> Bool
uniqueAnagrams xs = Set.size (Set.fromList (map stringsToParts xs)) == length (map stringsToParts xs)

stringsToParts :: String -> Map.Map Char Int
stringsToParts "" = Map.empty
stringsToParts str = counterInsert (head str) (stringsToParts (tail str))

counterInsert :: Char -> Map.Map Char Int -> Map.Map Char Int
counterInsert x mp = Map.insert x ((Map.findWithDefault 0 x mp) + 1) mp

