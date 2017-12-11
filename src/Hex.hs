module Hex where

countDirs :: [Int] -> String -> Int -> Int
countDirs dirs "" maxVal  = maxVal
countDirs (x:y:z:[]) ('s':'e':path) maxVal = countDirs (x:y:(z-1):[]) (drop 1 path) (max maxVal (mathDirs (x:y:(z-1):[])))
countDirs (x:y:z:[]) ('n':'e':path) maxVal = countDirs (x:(y+1):z:[]) (drop 1 path) (max maxVal (mathDirs (x:(y+1):z:[])))
countDirs (x:y:z:[]) ('n':'w':path) maxVal = countDirs (x:y:(z+1):[]) (drop 1 path) (max maxVal (mathDirs (x:y:(z+1):[])))
countDirs (x:y:z:[]) ('s':'w':path) maxVal = countDirs (x:(y-1):z:[]) (drop 1 path) (max maxVal (mathDirs (x:(y-1):z:[])))
countDirs (x:y:z:[]) ('s':path) maxVal     = countDirs ((x-1):y:z:[]) (drop 1 path) (max maxVal (mathDirs ((x-1):y:z:[])))
countDirs (x:y:z:[]) ('n':path) maxVal     = countDirs ((x+1):y:z:[]) (drop 1 path) (max maxVal (mathDirs ((x+1):y:z:[])))

mathDirs :: [Int] -> Int
mathDirs (x:y:z:[]) = do
    maximum ((abs(redX + redY)):(abs redX):(abs redY):[])
    where
        redX = (x - z)
        redY = (y + z)
