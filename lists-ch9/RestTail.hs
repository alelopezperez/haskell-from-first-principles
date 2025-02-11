module SafeTail where

safeTail :: [a] -> Maybe [a]
safeTail [] = Nothing
safeTail (_ : []) = Nothing
safeTail (_ : xs) = Just xs

eftBool :: Bool -> Bool -> [Bool]
eftBool = eft

eftOrd :: Ordering -> Ordering -> [Ordering]
eftOrd = eft

eftInt :: Int -> Int -> [Int]
eftInt = eft

eftChar :: Char -> Char -> [Char]
eftChar = eft

eft :: (Enum a, Ord a) => a -> a -> [a]
eft x y
    | x > y = []
    | x == y = [y]
    | otherwise = x : eft (succ x) y
