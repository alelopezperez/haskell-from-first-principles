module Exer where

allCombo :: String -> String -> [String]
allCombo stop vowel = [[x, y, z] | x <- stop, y <- vowel, z <- stop]

allComboMod :: String -> String -> [String]
allComboMod stop vowel = filter (\x -> head x == 'p') [[x, y, z] | x <- stop, y <- vowel, z <- stop]

sentences :: [String] -> [String] -> [(String, String, String)]
sentences noun verb = [(x, y, z) | x <- noun, y <- verb, z <- noun]

myOr :: [Bool] -> Bool
myOr xs = foldr (||) False xs

myOr' :: [Bool] -> Bool
myOr' = foldr (||) False

myAny :: (a -> Bool) -> [a] -> Bool
myAny f = foldr ((||) . f) False

myElem :: (Eq a) => a -> [a] -> Bool
myElem a xs = myAny (\x -> x == a) xs

myElem' :: (Eq a) => a -> [a] -> Bool
myElem' a xs = foldr ((||) . (\x -> x == a)) False xs

myReverse :: [a] -> [a]
myReverse xs = foldl (\x y -> y : x) [] xs

myRev :: [a] -> [a]
myRev = foldl (flip (:)) []

myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr ((:) . f) []

mySquish :: [[a]] -> [a]
mySquish = foldr (++) []

mySquishMap :: (a -> [b]) -> [a] -> [b]
mySquishMap f = foldr ((++) . f) []

squishAgain :: [[a]] -> [a]
squishAgain = mySquishMap id

myMaxBy :: (a -> a -> Ordering) -> [a] -> a
myMaxBy f xs = foldr g LT xs
    where
        g x y = case f x y of
            GT -> x
            _ -> y
