module TubularSpec where

import Test.Hspec
import Data.Array

import Tubular
import Direction

main :: IO()
main = hspec spec

tubeToArray tube = listArray (0, (length tube - 1)) [listArray (0, (length x) - 1) x | x <- tube]

spec :: Spec
spec = do
    describe "straight tubes" $ do
        it "can be traversed down" $ do
            let tube = tubeToArray [" | ",
                                    " | ",
                                    " X ",
                                    " | "]
            parseTube tube (South) (1, 0) "" `shouldBe` "X"

        it "can be traversed up" $ do
            let tube = tubeToArray [" | ",
                                    " | ",
                                    " X ",
                                    " | "]
            parseTube tube (North) (1, 3) "" `shouldBe` "X"

        it "can be traversed left" $ do
            let tube = tubeToArray ["      ",
                                    "---Y--",
                                    "      "]
            parseTube tube (West) (5, 1) "" `shouldBe` "Y"

        it "can be traversed right" $ do
            let tube = tubeToArray ["      ",
                                    "---Y--",
                                    "      "]
            parseTube tube (East) (0, 1) "" `shouldBe` "Y"

    describe "bent tubes" $ do
        it "can turn left" $ do
            let tube = tubeToArray [" |    ",
                                    " X    ",
                                    " +-Y--",
                                    "      "]
            parseTube tube (South) (1, 0) "" `shouldBe` "XY"

        it "can turn right" $ do
            let tube = tubeToArray [" |    ",
                                    " X    ",
                                    " +-Y--",
                                    "      "]
            parseTube tube (West) (5, 2) "" `shouldBe` "YX"

        it "can turn on bounds" $ do
            let tube = tubeToArray [" |    | ",
                                    " X    Z ",
                                    " |    | ",
                                    " +-Y--+ "]
            parseTube tube (South) (1, 0) "" `shouldBe` "XYZ"

    describe "looped tubes" $ do
        it "can loop counterclockwise left" $ do
            let tube = tubeToArray ["     |        ",
                                    "     X        ",
                                    "     |        ",
                                    "---Z-|----+   ",
                                    "     |    |   ",
                                    "     +-Y--+   ",
                                    "              "]
            parseTube tube (South) (5, 0) "" `shouldBe` "XYZ"

        it "can turn right" $ do
            let tube = tubeToArray ["     |        ",
                                    "     X        ",
                                    "     |        ",
                                    "---Z-|----+   ",
                                    "     |    |   ",
                                    "     +-Y--+   ",
                                    "              "]
            parseTube tube (East) (0, 3) "" `shouldBe` "ZYX"