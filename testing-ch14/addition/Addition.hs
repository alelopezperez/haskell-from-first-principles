module Addition where

import Test.Hspec
import Test.QuickCheck
import Test.QuickCheck.Gen (oneof)

genBool :: Gen Bool
genBool = choose (False, True)
genBool' :: Gen Bool
genBool' = elements [False, True]
genOrdering :: Gen Ordering
genOrdering = elements [LT, EQ, GT]
genChar :: Gen Char
genChar = elements ['a' .. 'z']

genTuple :: (Arbitrary a, Arbitrary b) => Gen (a, b)
genTuple = do
    a <- arbitrary
    b <- arbitrary
    return (a, b)

genThreeple :: (Arbitrary a, Arbitrary b, Arbitrary c) => Gen (a, b, c)
genThreeple = do
    a <- arbitrary
    b <- arbitrary
    c <- arbitrary
    return (a, b, c)

genEither :: (Arbitrary a, Arbitrary b) => Gen (Either a b)
genEither = do
    a <- arbitrary
    b <- arbitrary
    elements [Left a, Right b]

-- equal probability
genMaybe :: (Arbitrary a) => Gen (Maybe a)
genMaybe = do
    a <- arbitrary
    elements [Nothing, Just a]

-- What QuickCheck does so
-- you get more Just values
genMaybe' :: (Arbitrary a) => Gen (Maybe a)
genMaybe' = do
    a <- arbitrary
    frequency
        [ (1, return Nothing)
        , (3, return (Just a))
        ]

prop_additionGreater :: Int -> Bool
prop_additionGreater x = x + 1 > 0

runQc :: IO ()
runQc = quickCheck prop_additionGreater

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

-- Trivial Case
data Trivial = Trivial deriving (Eq, Show)

trivialGen :: Gen Trivial
trivialGen = return Trivial

instance Arbitrary Trivial where
    arbitrary = trivialGen

-- Identity parametric polymorph
data Identity a
    = Identity a
    deriving (Eq, Show)

identityGen :: (Arbitrary a) => Gen (Identity a)
identityGen = do
    a <- arbitrary
    return (Identity a)

instance (Arbitrary a) => Arbitrary (Identity a) where
    arbitrary = identityGen

identityGenInt :: Gen (Identity Int)
identityGenInt = identityGen

identityGenTriv :: Gen (Identity Trivial)
identityGenTriv = identityGen

-- Product Case

data Pair a b
    = Pair a b
    deriving (Eq, Show)

pairGen :: (Arbitrary a, Arbitrary b) => Gen (Pair a b)
pairGen = do
    a <- arbitrary
    b <- arbitrary
    return (Pair a b)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Pair a b) where
    arbitrary = pairGen

pairGenIntString :: Gen (Pair Int String)
pairGenIntString = pairGen

-- Sum Type Case

data Sum a b
    = First a
    | Second b
    deriving (Show, Eq)

sumGenEqual :: (Arbitrary a, Arbitrary b) => Gen (Sum a b)
sumGenEqual = do
    a <- arbitrary
    b <- arbitrary
    oneof [return $ First a, return $ Second b]
sumGenCharInt :: Gen (Sum Char Int)
sumGenCharInt = sumGenEqual

--      Frequency Case

sumGenFirstPls :: (Arbitrary a, Arbitrary b) => Gen (Sum a b)
sumGenFirstPls = do
    a <- arbitrary
    b <- arbitrary
    frequency [(10, return $ First a), (1, return $ Second b)]

sumGenCharIntFirst :: Gen (Sum Char Int)
sumGenCharIntFirst = sumGenFirstPls
