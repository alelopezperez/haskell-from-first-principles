module GivenDataType where

data Rocks = Rocks String deriving (Eq, Show, Ord)

s1 = Rocks

data Yeah = Yeah Bool deriving (Eq, Show, Ord)

data Papu = Papu Rocks Yeah deriving (Eq, Show, Ord)

-- ERORR phew = Papu "chases" True
phew = Papu (Rocks "Chases") (Yeah True)

equalityForAll :: Papu -> Papu -> Bool
equalityForAll x y = x == y

-- Need to derive Ord
comparePapus :: Papu -> Papu -> Bool
comparePapus x y = x == y

chk :: (Eq b) => (a -> b) -> a -> b -> Bool
chk f a b = f a == b

arith ::
    (Num b) =>
    (a -> b) ->
    ( Integer ->
      ( a ->
        b
      )
    )
arith f num a = f a + fromInteger num

data Rock a = Rocka Int | To a
