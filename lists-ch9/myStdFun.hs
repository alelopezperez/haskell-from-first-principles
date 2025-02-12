module MyStdFun where

myOr :: [Bool] -> Bool
myOr = foldr (||) False

myAnyMap :: (a -> Bool) -> [a] -> Bool
myAnyMap f = myOr . map f

myElem :: (Eq a) => a -> [a] -> Bool
myElem _ [] = False
myElem elem (x : xs)
    | elem == x = True
    | otherwise = myElem elem xs

myElemCompose :: (Eq a) => a -> [a] -> Bool
myElemCompose x = myAnyMap (== x)

myReverse :: [a] -> [a]
myReverse = iter []
    where
        iter acc [] = acc
        iter acc (x : xs) = iter (x : acc) xs

squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ [] = []
squishMap f (x : xs) = f x ++ squishMap f xs

squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy f (x : xs) = go xs x
    where
        go [] ans = ans
        go (x : xs) ans = case f x ans of
            GT -> go xs x
            _ -> go xs ans

myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy _ [x] = x
myMinimumBy f (x : xs) = case f x (myMinimumBy f xs) of
    LT -> x
    _ -> myMinimumBy f xs

myMax :: (Ord a) => [a] -> a
myMax = myMaximumBy compare

myMin :: (Ord a) => [a] -> a
myMin = myMinimumBy compare
