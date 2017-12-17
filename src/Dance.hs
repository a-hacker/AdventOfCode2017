module Dance where

import Data.Tuple
import qualified Data.Sequence as Seq
import Data.List
import Data.Maybe
import Data.List.Split

dance :: Seq.Seq Char -> [String] -> Seq.Seq Char
dance dancers [] = dancers
dance dancers ((baseMove:pos):moves)
    | baseMove == 's' = do
        let newDancers = (uncurry (Seq.><)) (swap (Seq.splitAt ((Seq.length dancers) - (read pos)) dancers))
        dance newDancers moves
    | baseMove == 'x' = do
        let parsedPos = splitOn "/" pos
        let fPos = read $ head parsedPos; sPos = read $ last parsedPos
        let fElem = Seq.index dancers fPos; sElem = Seq.index dancers sPos
        let newDancers = Seq.update sPos fElem (Seq.update fPos sElem dancers)
        dance newDancers moves
    | baseMove == 'p' = do
        let parsedPos = splitOn "/" pos
        let fElem = head $ head parsedPos; sElem = head $ last parsedPos
        let fPos = fromJust $ Seq.elemIndexL fElem dancers; sPos = fromJust $ Seq.elemIndexL sElem dancers;
        let newDancers = Seq.update sPos fElem (Seq.update fPos sElem dancers)
        dance newDancers moves