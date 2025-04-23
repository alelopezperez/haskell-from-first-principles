module MyLib where

import Data.Semigroup (Sum)
import Test.QuickCheck

data Trivial = Trivial deriving (Eq, Show)

instance Arbitrary Trivial where
    arbitrary = return Trivial

instance Semigroup Trivial where
    _ <> _ = Trivial

newtype Identity a = Identity a

instance (Semigroup a) => Semigroup (Identity a) where
    (Identity a) <> (Identity b) = Identity (a <> b)

data Two a b = Two a b deriving (Eq, Show)

instance (Semigroup a, Semigroup b) => Semigroup (Two a b) where
    (Two p q) <> (Two x y) = Two (p <> x) (q <> y)

instance (Arbitrary a, Arbitrary b) => Arbitrary (Two a b) where
    arbitrary = do
        a <- arbitrary
        b <- arbitrary
        return $ Two a b

newtype BoolConj = BoolConj Bool

instance Semigroup (BoolConj) where
    (BoolConj True) <> (BoolConj True) = BoolConj True
    (BoolConj True) <> (BoolConj False) = BoolConj False
    (BoolConj _) <> (BoolConj _) = BoolConj False

someFunc :: IO ()
someFunc = putStrLn "someFunc"

semigroupAssoc :: (Eq m, Semigroup m) => m -> m -> m -> Bool
semigroupAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)

type TrvAssoc = Trivial -> Trivial -> Trivial -> Bool
type TwoAssoc a b = Two a b -> Two a b -> Two a b -> Bool

main :: IO ()
main = quickCheck (semigroupAssoc :: TwoAssoc (Sum Int) (Sum Int))
