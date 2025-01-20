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
recMul 1 y = y
recMul 0 y = 0
recMul x 1 = x
recMul x 0 = 0
recMul x y = recMul (x - 1) (y + y)
