module DuetSpec where

import Test.Hspec
import qualified Data.Map as Map

import Duet

main :: IO()
main = hspec spec

spec :: Spec
spec = do
    describe "snd" $ do
        it "plays a register's value" $ do
            parseInstruction ["snd a", "rcv a"] 0 0 (Map.fromList [('a', 3)]) `shouldBe` 3
        it "0 if the register doesn't exist" $ do
            parseInstruction ["snd a", "rcv a", "add a 1", "snd a", "rcv a"] 0 0 Map.empty `shouldBe` 1
    describe "set" $ do
        it "sets a register" $ do
            parseInstruction ["set a 3", "snd a", "rcv a"] 0 0 Map.empty `shouldBe` 3
        it "resets a register" $ do
            parseInstruction ["set a 3", "snd a", "rcv a"] 0 0 (Map.fromList [('a', 5)]) `shouldBe` 3
        it "sets a register given a register" $ do
            parseInstruction ["set a b", "snd a", "rcv a"] 0 0 (Map.fromList [('b', 5)]) `shouldBe` 5
    describe "add" $ do
        it "increases a register" $ do
            parseInstruction ["add a 1", "snd a", "rcv a"] 0 0 (Map.fromList [('a', 3)]) `shouldBe` 4
        it "increases an unknown register" $ do
            parseInstruction ["add a 1", "snd a", "rcv a"] 0 0 Map.empty `shouldBe` 1
        it "descreases a register if negative" $ do
            parseInstruction ["add a -1", "snd a", "rcv a"] 0 0 (Map.fromList [('a', 3)]) `shouldBe` 2
        it "adds two registers" $ do
            parseInstruction ["add a b", "snd a", "rcv a"] 0 0 (Map.fromList [('a', 2), ('b', 5)]) `shouldBe` 7
    describe "mul" $ do
        it "multiplies a register" $ do
            parseInstruction ["mul a 2", "snd a", "rcv a"] 0 0 (Map.fromList [('a', 3)]) `shouldBe` 6
        it "multiplies an unknown register" $ do
            parseInstruction ["mul a 2", "add a 1", "snd a", "rcv a"] 0 0 Map.empty `shouldBe` 1
        it "multiplies a register by a negative value" $ do
            parseInstruction ["mul a -2", "snd a", "rcv a"] 0 0 (Map.fromList [('a', 3)]) `shouldBe` -6
        it "multiplies two registers" $ do
            parseInstruction ["mul a b", "snd a", "rcv a"] 0 0 (Map.fromList [('a', 2), ('b', 5)]) `shouldBe` 10
    describe "mod" $ do
        it "takes the remainder value of a register" $ do
            parseInstruction ["mod a 2", "snd a", "rcv a"] 0 0 (Map.fromList [('a', 3)]) `shouldBe` 1
        it "mods an unknown value" $ do
            parseInstruction ["mod a 2", "add a 1", "snd a", "rcv a"] 0 0 Map.empty `shouldBe` 1
        it "mods a register by another register" $ do
            parseInstruction ["mod a b", "snd a", "rcv a"] 0 0 (Map.fromList [('a', 7), ('b', 5)]) `shouldBe` 2
    describe "rcv" $ do
        it "gets the last value played if not 0" $ do
            parseInstruction ["snd a", "rcv a"] 0 0 (Map.fromList [('a', 3)]) `shouldBe` 3
        it "doesn't return on 0" $ do
            parseInstruction ["snd b", "rcv b", "snd a", "rcv a"] 0 0 (Map.fromList [('a', 3), ('b', 0)]) `shouldBe` 3
    describe "jgz" $ do
        it "skips instructions" $ do
            parseInstruction ["jgz 1 2", "add 1 b", "snd b", "rcv b", "snd a", "rcv a"] 0 0 (Map.fromList [('a', 3), ('b', 0)]) `shouldBe` 3
        it "goes back an instruction" $ do
            parseInstruction ["rcv a", "jgz 1 -1", "snd b", "rcv b"] 1 3 (Map.fromList [('a', 3), ('b', 1)]) `shouldBe` 3
        it "is ignored if x is 0" $ do
            parseInstruction ["rcv a", "jgz 0 -1", "snd b", "rcv b"] 1 3 (Map.fromList [('a', 3), ('b', 1)]) `shouldBe` 1
        it "can take a register in x or y" $ do
            parseInstruction ["rcv a", "jgz a b", "snd b", "rcv b"] 1 3 (Map.fromList [('a', 3), ('b', -1)]) `shouldBe` 3
