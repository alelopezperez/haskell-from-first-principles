module Algebra where

data How = Haw Int Int | Hiw (Int, Int) deriving (Show)

data Fiction = Fiction deriving (Show)
data NonFiction = NonFiction deriving (Show)

type AuthorName = String
data Author = Fiction AuthorName
