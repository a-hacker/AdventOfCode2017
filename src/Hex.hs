module Hex where

countDirs :: [Int] -> String -> [Int]
countDirs dirs "" = dirs
countDirs (x:y:z:[]) ('s':'e':path) = countDirs (x:y:(z-1):[]) (drop 1 path)
countDirs (x:y:z:[]) ('n':'e':path) = countDirs (x:(y+1):z:[]) (drop 1 path)
countDirs (x:y:z:[]) ('n':'w':path) = countDirs (x:y:(z+1):[]) (drop 1 path)
countDirs (x:y:z:[]) ('s':'w':path) = countDirs (x:(y-1):z:[]) (drop 1 path)
countDirs (x:y:z:[]) ('s':path)     = countDirs ((x-1):y:z:[]) (drop 1 path)
countDirs (x:y:z:[]) ('n':path)     = countDirs ((x+1):y:z:[]) (drop 1 path)

mathDirs :: [Int] -> Int
mathDirs (x:y:z:[]) = do
    maximum ((abs(redX + redY)):(abs redX):(abs redY):[])
    where
        redX = (x - z)
        redY = (y + z)
