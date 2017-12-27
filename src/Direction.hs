module Direction where

data Direction = North | South | East | West deriving (Enum, Eq)

updatePos :: Direction -> (Int, Int) -> (Int, Int)
updatePos dir (x, y)
    | dir == North = (x, y - 1)
    | dir == South = (x, y + 1)
    | dir == East = (x + 1, y)
    | dir == West = (x - 1, y)

goLeft :: Direction -> (Int, Int) -> (Direction, (Int, Int))
goLeft dir pos
    | dir == North = (West, updatePos West pos)
    | dir == South = (East, updatePos East pos)
    | dir == East = (North, updatePos North pos)
    | dir == West = (South, updatePos South pos)

goRight :: Direction -> (Int, Int) -> (Direction, (Int, Int))
goRight dir pos
    | dir == North = (East, updatePos East pos)
    | dir == South = (West, updatePos West pos)
    | dir == East = (South, updatePos South pos)
    | dir == West = (North, updatePos North pos)

goBack :: Direction -> (Int, Int) -> (Direction, (Int, Int))
goBack dir pos
    | dir == North = (South, updatePos South pos)
    | dir == South = (North, updatePos North pos)
    | dir == East = (West, updatePos West pos)
    | dir == West = (East, updatePos East pos)