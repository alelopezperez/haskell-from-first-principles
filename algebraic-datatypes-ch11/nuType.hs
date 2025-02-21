{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module NuType where

import Data.Int

data Cows = Cows Int deriving (Eq, Show)
newtype Goats = Goats Int deriving (Eq, Show, TooMany)
type NuGoats = Int

tooManyss :: Int -> Bool
tooManyss n = n > 42

class TooMany a where
    tooMany :: a -> Bool

instance TooMany Int where
    tooMany :: Int -> Bool
    tooMany = (> 42)

-- instance TooMany Goats where
--    tooMany (Goats n) = n > 50

instance TooMany Cows where
    tooMany (Cows n) = n > 100

data LoGoat = LoGoat Int String

instance TooMany (Int, String) where
    tooMany (x, y) = x > 100

instance TooMany (Int, Int) where
    tooMany (x, y) = x + y > 100

instance (Num a, TooMany a) => TooMany (a, a) where
    tooMany :: (Num a, TooMany a) => (a, a) -> Bool
    tooMany (a, b) = tooMany a || tooMany b

data NumberOrBool
    = Numba Int8
    | BoolyBool Bool
    deriving (Eq, Show)

-- parentheses due to syntactic
-- collision between (-) minus
-- and the negate function
