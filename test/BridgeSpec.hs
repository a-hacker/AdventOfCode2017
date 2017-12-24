module BridgeSpec where

import Test.Hspec
import qualified Data.Set as Set

import Bridge

main :: IO()
main = hspec spec

spec :: Spec
spec = do
    describe "build" $ do
        it "fetchs componenets only once" $ do
            snd (build (Set.fromList [(Component 0 1), (Component 1 1)]) (0, 0) 0) `shouldBe` 3
        it "returns longest, not strongest" $ do
            snd (build (Set.fromList [(Component 0 1), (Component 1 2), (Component 2 3), (Component 0 10)]) (0, 0) 0) `shouldBe` 9
        it "returns max" $ do
            snd (build (Set.fromList [(Component 0 1), (Component 0 2)]) (0, 0) 0) `shouldBe` 2
        it "returns max if not greedy" $ do
            snd (build (Set.fromList [(Component 0 1), (Component 0 2), (Component 1 8)]) (0, 0) 0) `shouldBe` 10
        it "matches on second port" $ do
            snd (build (Set.fromList [(Component 0 1), (Component 5 1)]) (0, 0) 0) `shouldBe` 7
        it "does the example" $ do
            snd (build (Set.fromList [(Component 0 2),
                                 (Component 2 2),
                                 (Component 2 3),
                                 (Component 3 4),
                                 (Component 3 5),
                                 (Component 0 1),
                                 (Component 10 1),
                                 (Component 9 10)]) (0, 0) 0) `shouldBe` 19