module Rec where

inc :: (Num a) => a -> a
inc = (+ 1)

three = inc . inc . inc $ 0

three' x = inc . inc . inc $ x
threePf = inc . inc . inc

incTime :: (Num a, Eq a) => a -> a -> a
incTime 0 n = n
incTime times n = 1 + (incTime (times - 1) n)
incTime times n = inc . incTime (times - 1) $ n
incTime times n = inc (incTime (times - 1) n)

a =
    let x = 4
    in x + 3

f :: Bool -> Int
f True = error "botom"
f False = 0

dividedBy :: (Integral a) => a -> a -> (a, a)
dividedBy num denom = go num denom 0
    where
        go n d count
            | n < d = (count, n)
            | otherwise = go (n - d) d (count + 1)
