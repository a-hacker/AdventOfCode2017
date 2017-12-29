module VirusSpec where

import Test.Hspec
import qualified Data.Map as Map

import Virus
import Direction

main :: IO()
main = hspec spec

spec :: Spec
spec = do
    describe "scan" $ do
        it "clean infected squares" $ do
            scan (Map.fromList [((0, 0), 2)]) (North, (0, 0)) 9999999  0 `shouldBe` 0
        it "infect clean squares" $ do
            scan (Map.fromList [((0, 0), 1)]) (North, (0, 0)) 9999999 0 `shouldBe` 1
        it "turn left on clean nodes" $ do
            scan (Map.fromList [((0, 0), 0), ((-1, 0), 1)]) (North, (0, 0)) 9999998 0 `shouldBe` 1
        it "turn right on infected nodes" $ do
            scan (Map.fromList [((0, 0), 2), ((1, 0), 2)]) (North, (0, 0)) 9999998 0 `shouldBe` 0
--        it "do the example" $ do
--            scan (Map.fromList [((-1, -1), 0),
--                                ((0, -1), 0),
--                                ((1, -1), 2),
--                                ((-1, 0), 2),
--                                ((0, 0), 0),
--                                ((1, 0), 0),
--                                ((-1, 1), 0),
--                                ((0, 1), 0),
--                                ((1, 1), 0)]) (North, (0, 0)) 0 0 `shouldBe` 5587