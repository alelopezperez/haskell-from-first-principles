module EitherLib where

lefts' :: [Either a b] -> [a]
lefts' [] = []
lefts' (x : xs) = case x of
    Left a -> a : lefts' xs
    Right b -> lefts' xs

algo :: String -> Bool
algo _ =
    True
lefti :: [Either a b] -> [a]
lefti =
    foldr
        ( \w y -> case w of
            Left a -> a : y
            Right _ -> y
        )
        []

rights' :: [Either a b] -> [b]
rights' [] = []
rights' (x : xs) = case x of
    Right a -> a : rights' xs
    Left b -> rights' xs

righti :: [Either a b] -> [b]
righti =
    foldr
        ( \w y -> case w of
            Right a -> a : y
            Left _ -> y
        )
        []

partitionEithers' :: [Either a b] -> ([a], [b])
partitionEithers' [] = ([], [])
partitionEithers' x = foldr f ([], []) x
    where
        f y ys =
            case y of
                Left a -> (a : fst ys, snd ys)
                Right b -> (fst ys, b : snd ys)

eitherMaybe' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe' _ (Left _) = Nothing
eitherMaybe' f (Right r) = Just (f r)

either' :: (a -> c) -> (b -> c) -> Either a b -> c
either' f _ (Left a) = f a
either' _ f (Right b) = f b

eitherMaybe'' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe'' f = either' (const Nothing) (Just . f)
