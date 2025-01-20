module Ex8 where

cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y

flippy :: String -> String -> String
flippy = flip cattyConny

appedCatty :: String -> String
appedCatty = cattyConny "woops"

frappe :: String -> String
frappe = flippy "haha"

suma :: (Num a, Eq a) => a -> a
suma n = go n 0
    where
        go n total = case n == 0 of
            True -> total
            False -> go (n - 1) (total + n)

recMul :: (Integral a) => a -> a -> a
recMul x y = go x y y
    where
        go 0 y _ = 0
        go 1 y _ = y
        go x 1 _ = x
        go x 0 _ = 0
        go x y c = go (x - 1) (y + c) c

mc91 :: (Num a, Ord a) => a -> a
mc91 n
    | n > 100 = n - 10
    | otherwise = mc91 (mc91 (n + 11))
