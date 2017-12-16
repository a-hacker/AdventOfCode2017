module Main where

import Generator

main :: IO ()
main = do
    input <- readFile "input.txt"
    print $ runGenerators 289 629 0 0
