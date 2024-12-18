module TrivialTypeClass where

data Trivial = Trivial'

instance Eq Trivial where
    Trivial' == Trivial' = True
    (/=) :: Trivial -> Trivial -> Bool
    (/=) x y = not (x == y)

func 1 = 3 + 4
