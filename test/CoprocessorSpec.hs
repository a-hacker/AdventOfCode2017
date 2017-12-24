module CoprocessorSpec where

import Test.Hspec

import Coprocessor

main :: IO()
main = hspec spec

spec :: Spec
spec = do
    describe "set" $ do
        it "sets a register by a value" $ do
            True `shouldBe` True
