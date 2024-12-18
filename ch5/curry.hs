module HaCurry where

nonSense :: Bool -> Integer
nonSense True = 805
nonSense False = 3137

curriedFunction :: Integer -> Bool -> Integer
curriedFunction i b = i + (nonSense b)

aleiedFunction :: Bool -> Integer -> Integer
aleiedFunction b i = (nonSense b) + i

uncurriedFunction :: (Integer, Bool) -> Integer
uncurriedFunction (i, b) = i + nonSense b

anonymous :: Integer -> Bool -> Integer
anonymous = \i b -> i + (nonSense b)

anonNested :: Integer -> Bool -> Integer
anonNested = \i -> \b -> i + (nonSense b)
