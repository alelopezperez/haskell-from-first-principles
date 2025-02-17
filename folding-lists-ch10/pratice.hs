myAny :: (a -> Bool) -> [a] -> Bool
myAny f xs = foldr (\x b -> if f x then True else b) False xs
