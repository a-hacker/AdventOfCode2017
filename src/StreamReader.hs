module StreamReader where

parseGroup :: String -> Int -> (String, Int)
parseGroup stream total
    | (head stream) == '}' = ((tail stream), total)
    | (head stream) == '!' = parseGroup (drop 2 stream) total
    | (head stream) == '<' = let garbage = parseGarbage (tail stream) total in
        parseGroup (fst garbage) (snd garbage)
    | (head stream) == '{' = let subGroup = parseGroup (tail stream) total in
        parseGroup (fst subGroup) (snd subGroup)
    | otherwise            = parseGroup (tail stream) total

parseGarbage :: String -> Int -> (String, Int)
parseGarbage stream total
    | (head stream) == '>' = ((tail stream), total)
    | (head stream) == '!' = parseGarbage (drop 2 stream) total
    | otherwise            = parseGarbage (tail stream) (total + 1)