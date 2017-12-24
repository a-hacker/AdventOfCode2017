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
            scan (Map.fromList [((0, 0), True)]) (North, (0, 0)) 9999 0 `shouldBe` 0
        it "infect clean squares" $ do
            scan (Map.fromList [((0, 0), False)]) (North, (0, 0)) 9999 0 `shouldBe` 1
        it "turn left on clean nodes" $ do
            scan (Map.fromList [((0, 0), False), ((-1, 0), True)]) (North, (0, 0)) 9998 0 `shouldBe` 1
        it "turn right on infected nodes" $ do
            scan (Map.fromList [((0, 0), True), ((1, 0), True)]) (North, (0, 0)) 9998 0 `shouldBe` 0
        it "do the example" $ do
            scan (Map.fromList [((-1, -1), False),
                                ((0, -1), False),
                                ((1, -1), True),
                                ((-1, 0), True),
                                ((0, 0), False),
                                ((1, 0), False),
                                ((-1, 1), False),
                                ((0, 1), False),
                                ((1, 1), False)]) (North, (0, 0)) 0 0 `shouldBe` 5587