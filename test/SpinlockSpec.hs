module SpinlockSpec where

import Test.Hspec
import qualified Data.Sequence as Seq
import Spinlock

main :: IO()
main = hspec spec

spec :: Spec
spec = do
    describe "whirl" $ do
        it "inserts value after X moves" $ do
            whirl 3 (Seq.fromList [4, 0, 1, 2, 3]) 0 `shouldBe` (Seq.fromList([4, 0, 1, 2, 5, 3]), 4)

        it "wraps to end of list" $ do
            whirl 3 (Seq.fromList [0, 1, 2, 4, 3]) 3 `shouldBe` (Seq.fromList([0, 1, 5, 2, 4, 3]), 2)

        it "can insert at the end of the list" $ do
            whirl 1 (Seq.fromList [0, 1, 2, 4, 3]) 3 `shouldBe` (Seq.fromList([5, 0, 1, 2, 4, 3]), 0)