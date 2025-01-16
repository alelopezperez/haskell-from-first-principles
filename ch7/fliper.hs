f :: (Num a, Num b) => a -> b -> b
f x y = y

myFlip :: (a -> b -> c) -> (b -> a -> c)
myFlip f = \x y -> f y x

newFlip :: (a -> b -> c) -> b -> a -> c
newFlip f = \x y -> f y x
