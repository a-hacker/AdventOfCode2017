module FractalSpec where

import Test.Hspec
import Fractal
import qualified Data.Map as Map

main :: IO()
main = hspec spec

spec :: Spec
spec = do
    describe "convert 2x2" $ do
        it "converts regular input" $ do
            growFractal (Map.fromList [((TwoSquare ".." ".."), (ThreeSquare "###" "..." "#.#"))]) 4 [(TwoSquare ".." "..")] `shouldBe` 5
        it "converts rotateR input" $ do
            growFractal (Map.fromList [((TwoSquare "##" ".."), (ThreeSquare "###" "..." "#.#"))]) 4 [(TwoSquare ".#" ".#")] `shouldBe` 5
        it "converts rotateL input" $ do
            growFractal (Map.fromList [((TwoSquare "##" ".."), (ThreeSquare "###" "..." "#.#"))]) 4 [(TwoSquare "#." "#.")] `shouldBe` 5
        it "converts flipH input" $ do
            growFractal (Map.fromList [((TwoSquare "#." "#."), (ThreeSquare "###" "..." "#.#"))]) 4 [(TwoSquare ".#" ".#")] `shouldBe` 5
        it "converts flipV input" $ do
            growFractal (Map.fromList [((TwoSquare "##" ".."), (ThreeSquare "###" "..." "#.#"))]) 4 [(TwoSquare ".." "##")] `shouldBe` 5
    describe "convert 3x3" $ do
        it "converts regular input" $ do
            growFractal (Map.fromList [((ThreeSquare "..." "..." "..."), (FourSquare "###." "...." "#.#." "...."))]) 4 [(ThreeSquare "..." "..." "...")] `shouldBe` 5
        it "converts rotateR input" $ do
            growFractal (Map.fromList [((ThreeSquare ".##" "..." "..."), (FourSquare "###." "...." "#.#." "...."))]) 4 [(ThreeSquare "..." "..#" "..#")] `shouldBe` 5
        it "converts rotateL input" $ do
            growFractal (Map.fromList [((ThreeSquare ".##" "..." "..."), (FourSquare "###." "...." "#.#." "...."))]) 4 [(ThreeSquare "#.." "#.." "...")] `shouldBe` 5
        it "converts flipH input" $ do
            growFractal (Map.fromList [((ThreeSquare ".##" "..." "..."), (FourSquare "###." "...." "#.#." "...."))]) 4 [(ThreeSquare "..." "..." ".##")] `shouldBe` 5
        it "converts flipV input" $ do
            growFractal (Map.fromList [((ThreeSquare ".##" "..." "..."), (FourSquare "###." "...." "#.#." "...."))]) 4 [(ThreeSquare "##." "..." "...")] `shouldBe` 5
        it "converts double rotate input" $ do
            growFractal (Map.fromList [((ThreeSquare ".##" "..." "..."), (FourSquare "###." "...." "#.#." "...."))]) 4 [(ThreeSquare "..." "..." "##.")] `shouldBe` 5
        it "converts rotate then flip input" $ do
            growFractal (Map.fromList [((ThreeSquare ".##" "..." "..."), (FourSquare "###." "...." "#.#." "...."))]) 4 [(ThreeSquare "..#" "..#" "...")] `shouldBe` 5
--    describe "full program" $ do
--        it "does the example" $ do
--            growFractal (Map.fromList [((ThreeSquare ".##" "..." "..."), (FourSquare "###." "...." "#.#." "...."))]) 0 [(ThreeSquare "..#" "..#" "...")] `shouldBe` 5