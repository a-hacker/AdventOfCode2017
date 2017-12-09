module StreamReader where

parseGroup :: String -> Int -> Int -> (String, Int)
parseGroup stream total curVal
    | (head stream) == '}' = ((tail stream), (total + curVal))
    | (head stream) == '!' = parseGroup (drop 2 stream) total curVal
    | (head stream) == '<' = parseGroup (parseGarbage (tail stream)) total curVal
    | (head stream) == '{' = let subGroup = parseGroup (tail stream) total (curVal + 1) in
        parseGroup (fst subGroup) (snd subGroup) curVal
    | otherwise            = parseGroup (tail stream) total curVal

parseGarbage :: String -> String
parseGarbage stream
    | (head stream) == '>' = tail stream
    | (head stream) == '!' = parseGarbage (drop 2 stream)
    | otherwise            = parseGarbage (tail stream)