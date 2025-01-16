module Exercises where

-- 1

tensDigit :: (Integral a) => a -> a
tensDigit x = d
    where
        xLast = x `div` 10
        d = xLast `mod` 10

tensDigitMod :: (Integral a) => a -> a
tensDigitMod x = d
    where
        (xLast, _) = x `divMod` 10
        (_, d) = xLast `divMod` 10

hunDigit :: (Integral a) => a -> a
hunDigit x = d2
    where
        xLast = x `div` 10
        d = xLast `div` 10
        d2 = d `mod` 10

-- 2 FoldBool

foldBool :: a -> a -> Bool -> a
foldBool x y p = case p of
    True -> x
    False -> y

foldBool2 :: a -> a -> Bool -> a
foldBool2 x y p
    | p = x
    | otherwise = y

-- 3 Fill in the def

g :: (a -> b) -> (a, c) -> (b, c)
g f (a, c) = (f a, c)

-- 4 Read Show Pointfree

roundTrip :: (Show a, Read a) => a -> a
roundTrip a = read (show a)

roundTripPF :: (Show a, Read a) => a -> a
roundTripPF = read . show

roundTripN :: (Show a, Read b) => a -> b
roundTripN a = read (show a)

main = do
    print (roundTrip 4)
    print (id 4)
    print (roundTripPF 4)
    print ((roundTripN 4) :: Integer)
