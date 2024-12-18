-- exercisech4.hs
module ExerciseCh4 where

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x = x == reverse x

myAbs :: Integer -> Integer
myAbs x = if x < 0 then (x * (-1)) else x

f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f a b = ((snd a, snd b), (fst a, fst b))

x = (+)
g xs = w `x` 1
    where
        w = length xs

h (a, b) = a

type Name = String

b :: Name -> String
b e = e
