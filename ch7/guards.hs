myAbs :: Integer -> Integer
myAbs x
    | x < 0 = (-x)
    | show x == "1" = 3
    | show x == "-1" = 123
    | True = x
    | otherwise = x

isRight :: (Num a, Eq a) => a -> a -> a -> String
isRight a b c
    | a * a + b * b == c * c = "Right"
    | False = "no"
    | True = "Normal Triangle"

avgGrade :: (Fractional a, Ord a) => a -> Char
avgGrade x
    | y >= 0.9 = 'A'
    | True = 'F'
    | y >= 0.8 = 'B'
    where
        y = x / 100
