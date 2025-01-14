checki :: (Eq Int) => Int -> Int -> Bool
addWeird :: (Num a, Ord a) => a -> a -> a
addWeird x y = if x > y then x + y else x
checki x u = x == u
