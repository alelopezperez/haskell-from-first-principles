module Addition where

import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec $ do
    describe "Addition" $ do
        it "15 divided by 3  is 5" $ do
            dividedBy 15 3 `shouldBe` (5, 0)
        it "22 divided by 5 is (4,2)" $ do
            22 `dividedBy` 5 `shouldBe` (4, 2)
        it "x + 1 is always greater than x" $ do
            property $ \x -> x + 1 > (x :: Int)

mulTest :: IO ()
mulTest = hspec $ do
    describe "Recursive Multiply" $ do
        it "15 mulrec 3 is 15" $ do
            mulRec 5 3 `shouldBe` 5 * 3
        it "something with 0 gives 0" $ do
            mulRec 0 3 `shouldBe` 0
        it "something with 0 gives 0" $ do
            mulRec 1 0 `shouldBe` 0

sayHello :: IO ()
sayHello = putStrLn "Hello!"

dividedBy :: (Integral a) => a -> a -> (a, a)
dividedBy num denom = go num denom 0
    where
        go n d count
            | n < d = (count, n)
            | otherwise = go (n - d) d (count + 1)

mulRec :: (Eq a, Num a) => a -> a -> a
mulRec _ 0 = 0
mulRec 0 _ = 0
mulRec x y = x + mulRec x (y - 1)
