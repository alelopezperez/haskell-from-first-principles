module Test (main) where

import MyLib (Trivial)
import Test.Hspec
import Test.QuickCheck

semigroupAssoc :: (Eq m, Semigroup m) => m -> m -> m -> Bool
semigroupAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)

type TrvAssoc = Trivial -> Trivial -> Trivial -> Bool

main :: IO ()
main =
    hspec $ do
        describe "Trvial SemiGroup" $ do
            it "Associative" $ property (semigroupAssoc :: TrvAssoc)
