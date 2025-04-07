module ImplSemi where

data Trivial = Trivial deriving (Eq, Show)

instance Semigroup Trivial where
    _ <> _ = Trivial

newtype Identity a = Identity a

instance (Semigroup a) => Semigroup (Identity a) where
    (Identity a) <> (Identity b) = Identity (a <> b)

data Two a b = Two a b

instance (Semigroup a, Semigroup b) => Semigroup (Two a b) where
    (Two p q) <> (Two x y) = Two (p <> x) (q <> y)

newtype BoolConj = BoolConj Bool

instance Semigroup (BoolConj) where
    (BoolConj True) <> (BoolConj True) = BoolConj True
    (BoolConj True) <> (BoolConj False) = BoolConj False
    (BoolConj _) <> (BoolConj _) = BoolConj False
