module DanceSpec where

import Test.Hspec
import qualified Data.Sequence as Seq
import Dance

main :: IO()
main = hspec spec

spec :: Spec
spec = do
    describe "spin" $ do
        it "moves elements from back to head" $ do
            dance (Seq.fromList ['a'..'p']) ["s1"] `shouldBe` Seq.fromList ('p':['a'..'o'])

        it "maintains originial order" $ do
            dance (Seq.fromList ['a'..'p']) ["s3"] `shouldBe` Seq.fromList ("nop" ++ ['a'..'m'])

        it "understand two-digit numbers" $ do
            dance (Seq.fromList ['a'..'p']) ["s11"] `shouldBe` Seq.fromList (['f'..'p'] ++ ['a'..'e'])

        it "doesn't change anything on 0" $ do
            dance (Seq.fromList ['a'..'p']) ["s0"] `shouldBe` Seq.fromList (['a'..'p'])

    describe "exchange" $ do
        it "swaps elements with positional arguments" $ do
            dance (Seq.fromList ['a'..'p']) ["x1/3"] `shouldBe` Seq.fromList ('a':'d':'c':'b':['e'..'p'])

        it "can swap the head" $ do
            dance (Seq.fromList ['a'..'p']) ["x0/3"] `shouldBe` Seq.fromList ('d':'b':'c':'a':['e'..'p'])

        it "can swap the last elem" $ do
            dance (Seq.fromList ['a'..'e']) ["x4/2"] `shouldBe` Seq.fromList ('a':'b':'e':'d':'c':[])

        it "understands when the greater arg is first" $ do
            dance (Seq.fromList ['a'..'p']) ["x3/0"] `shouldBe` Seq.fromList ('d':'b':'c':'a':['e'..'p'])

        it "recognizes two-digit numbers" $ do
            dance (Seq.fromList ['a'..'p']) ["x10/12"] `shouldBe`  Seq.fromList (['a'..'j'] ++ 'm':'l':'k':['n'..'p'])

        it "doesn't change anything on A/A" $ do
            dance (Seq.fromList ['a'..'p']) ["x2/2"] `shouldBe` Seq.fromList ['a'..'p']

    describe "partner" $ do
        it "swaps elements with program names" $ do
            dance (Seq.fromList ['a'..'p']) ["pb/d"] `shouldBe` Seq.fromList ('a':'d':'c':'b':['e'..'p'])

        it "understands when the greater arg is first" $ do
            dance (Seq.fromList ['a'..'p']) ["pc/a"] `shouldBe` Seq.fromList ('c':'b':'a':['d'..'p'])

        it "can swap the head" $ do
            dance (Seq.fromList ['a'..'p']) ["pa/d"] `shouldBe` Seq.fromList ('d':'b':'c':'a':['e'..'p'])

        it "can swap the last elem" $ do
            dance (Seq.fromList ['a'..'p']) ["pp/n"] `shouldBe` Seq.fromList (['a'..'m'] ++ "pon")

        it "doesn't change anything on A/A" $ do
            dance (Seq.fromList ['a'..'p']) ["pc/c"] `shouldBe` Seq.fromList ['a'..'p']