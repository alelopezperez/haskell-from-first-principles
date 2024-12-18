module Date where

data DayOfWeek = Mon | Tue | Weds | Thu | Fri | Sat | Sun deriving (Show)

data Date = Date DayOfWeek Integer deriving (Show)
instance Eq DayOfWeek where
    Mon == Mon = True
    Tue == Tue = True
    Weds == Weds = True
    Thu == Thu = True
    Fri == Fri = True
    Sat == Sat = True
    Sun == Sun = True

instance Eq Date where
    (==) (Date weekday dayOfMonth) (Date weekday' dayOfMonth') =
        weekday == weekday'
            && dayOfMonth == dayOfMonth'

data Identity a = Identity a
instance (Ord a) => Eq (Identity a) where
    (==) (Identity v) (Identity v') = v == v'

data TisAnInteger = TisAn Integer
instance Eq TisAnInteger where
    (==) (TisAn y) (TisAn z) = z == y

data TwoIntegers = Two Integer Integer
instance Eq TwoIntegers where
    (==) (Two x y) (Two w z) = x == w && y == z

data StringOrInt = TisAnInt Int | TisAnString String
instance Eq StringOrInt where
    (==) (TisAnInt x) (TisAnInt y) = x == y
    (==) (TisAnString x) (TisAnString y) = x == y
    (==) _ _ = False

data Pair a = Pair a a
instance (Eq a) => Eq (Pair a) where
    (==) (Pair c x) (Pair b y) = c == b && x == y

data Which a = ThisOne a | ThatOne a
instance (Eq a) => Eq (Which a) where
    (==) (ThatOne a) (ThatOne b) = a == b
    (==) (ThisOne x) (ThisOne y) = x == y
    (==) _ _ = False

data Aither a b = Hello a | Goodbye b
instance (Eq a, Eq b) => Eq (Aither a b) where
    (==) (Hello a) (Hello b) = a == b
    (==) (Goodbye a) (Goodbye b) = a == b
    (==) _ _ = False
