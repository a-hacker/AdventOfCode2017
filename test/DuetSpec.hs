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
            (fst $ parseInstruction (SingleExec ["snd a", "rcv a"] 0 0 (Map.fromList [('a', 3)]))) `shouldBe` 3
        it "0 if the register doesn't exist" $ do
            (fst $ parseInstruction (SingleExec ["snd a", "rcv a", "add a 1", "snd a", "rcv a"] 0 0 Map.empty)) `shouldBe` 1
        it "returns if pairedExec" $ do
            (fst $ parseInstruction (PairedExec ["snd a"] 0 (Map.fromList [('a', 3)]) [])) `shouldBe` 3
    describe "set" $ do
        it "sets a register" $ do
            (fst $ parseInstruction (SingleExec ["set a 3", "snd a", "rcv a"] 0 0 Map.empty)) `shouldBe` 3
        it "resets a register" $ do
            (fst $ parseInstruction (SingleExec ["set a 3", "snd a", "rcv a"] 0 0 (Map.fromList [('a', 5)]))) `shouldBe` 3
        it "sets a register given a register" $ do
            (fst $ parseInstruction (SingleExec ["set a b", "snd a", "rcv a"] 0 0 (Map.fromList [('b', 5)]))) `shouldBe` 5
    describe "add" $ do
        it "increases a register" $ do
            (fst $ parseInstruction (SingleExec ["add a 1", "snd a", "rcv a"] 0 0 (Map.fromList [('a', 3)]))) `shouldBe` 4
        it "increases an unknown register" $ do
            (fst $ parseInstruction (SingleExec ["add a 1", "snd a", "rcv a"] 0 0 Map.empty)) `shouldBe` 1
        it "descreases a register if negative" $ do
            (fst $ parseInstruction (SingleExec ["add a -1", "snd a", "rcv a"] 0 0 (Map.fromList [('a', 3)]))) `shouldBe` 2
        it "adds two registers" $ do
            (fst $ parseInstruction (SingleExec ["add a b", "snd a", "rcv a"] 0 0 (Map.fromList [('a', 2), ('b', 5)]))) `shouldBe` 7
    describe "mul" $ do
        it "multiplies a register" $ do
            (fst $ parseInstruction (SingleExec ["mul a 2", "snd a", "rcv a"] 0 0 (Map.fromList [('a', 3)]))) `shouldBe` 6
        it "multiplies an unknown register" $ do
            (fst $ parseInstruction (SingleExec ["mul a 2", "add a 1", "snd a", "rcv a"] 0 0 Map.empty)) `shouldBe` 1
        it "multiplies a register by a negative value" $ do
            (fst $ parseInstruction (SingleExec ["mul a -2", "snd a", "rcv a"] 0 0 (Map.fromList [('a', 3)]))) `shouldBe` -6
        it "multiplies two registers" $ do
            (fst $ parseInstruction (SingleExec ["mul a b", "snd a", "rcv a"] 0 0 (Map.fromList [('a', 2), ('b', 5)]))) `shouldBe` 10
    describe "mod" $ do
        it "takes the remainder value of a register" $ do
            (fst $ parseInstruction (SingleExec ["mod a 2", "snd a", "rcv a"] 0 0 (Map.fromList [('a', 3)]))) `shouldBe` 1
        it "mods an unknown value" $ do
            (fst $ parseInstruction (SingleExec ["mod a 2", "add a 1", "snd a", "rcv a"] 0 0 Map.empty)) `shouldBe` 1
        it "mods a register by another register" $ do
            (fst $ parseInstruction (SingleExec ["mod a b", "snd a", "rcv a"] 0 0 (Map.fromList [('a', 7), ('b', 5)]))) `shouldBe` 2
    describe "rcv" $ do
        it "gets the last value played if not 0" $ do
            (fst $ parseInstruction (SingleExec ["snd a", "rcv a"] 0 0 (Map.fromList [('a', 3)]))) `shouldBe` 3
        it "doesn't return on 0" $ do
            (fst $ parseInstruction (SingleExec ["snd b", "rcv b", "snd a", "rcv a"] 0 0 (Map.fromList [('a', 3), ('b', 0)]))) `shouldBe` 3
        it "sets register from queue if PairedExec" $ do
            (fst $ parseInstruction (PairedExec ["rcv b", "snd b"] 0 Map.empty [1])) `shouldBe` 1
        it "returns state if queue is empty" $ do
            (snd $ parseInstruction (PairedExec ["rcv b", "snd b"] 0 Map.empty [])) `shouldBe` (PairedExec ["rcv b", "snd b"] 0 Map.empty [])
        it "sets val to infinity if queue is empty" $ do
            (fst $ parseInstruction (PairedExec ["rcv b", "snd b"] 0 Map.empty [])) `shouldBe` (maxBound :: Int)
    describe "jgz" $ do
        it "skips instructions" $ do
            (fst $ parseInstruction (SingleExec ["jgz 1 2", "add 1 b", "snd b", "rcv b", "snd a", "rcv a"] 0 0 (Map.fromList [('a', 3), ('b', 0)]))) `shouldBe` 3
        it "goes back an instruction" $ do
            (fst $ parseInstruction (SingleExec ["rcv a", "jgz 1 -1", "snd b", "rcv b"] 1 3 (Map.fromList [('a', 3), ('b', 1)]))) `shouldBe` 3
        it "is ignored if x is 0" $ do
            (fst $ parseInstruction (SingleExec ["rcv a", "jgz 0 -1", "snd b", "rcv b"] 1 3 (Map.fromList [('a', 3), ('b', 1)]))) `shouldBe` 1
        it "can take a register in x or y" $ do
            (fst $ parseInstruction (SingleExec ["rcv a", "jgz a b", "snd b", "rcv b"] 1 3 (Map.fromList [('a', 3), ('b', -1)]))) `shouldBe` 3

    describe "runRegisters" $ do
        it "returns (0, 0) if no sends" $ do
            runRegisters (PairedExec ["rcv a"] 0 Map.empty []) (PairedExec ["rcv a"] 0 Map.empty []) (0, 0) False `shouldBe` (0, 0)
        it "returns (1, 1) if one snd in each" $ do
            runRegisters (PairedExec ["snd a", "rcv a", "rcv b"] 0 Map.empty []) (PairedExec ["snd a", "rcv a", "rcv b"] 0 Map.empty []) (0, 0) False `shouldBe` (1, 1)
        it "returns (3, 0) if only one sends" $ do
            runRegisters (PairedExec ["snd a", "snd a", "snd b", "rcv a"] 0 Map.empty []) (PairedExec ["rcv a", "rcv a", "rcv b", "rcv b"] 0 Map.empty []) (0, 0) False `shouldBe` (0, 3)
