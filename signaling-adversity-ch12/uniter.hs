module UnIter where

myIterate :: (a -> a) -> a -> [a]
myIterate f a = a : myIterate f (f a)

myUnfoldr ::
    (b -> Maybe (a, b)) ->
    b ->
    [a]
myUnfoldr f b = case f b of
    Just (a, b) -> a : myUnfoldr f b
    Nothing -> []

betterIterate :: (a -> a) -> a -> [a]
betterIterate f = myUnfoldr (\x -> Just (x, f x))

data BinaryTree a
    = Leaf
    | Node (BinaryTree a) a (BinaryTree a)
    deriving (Eq, Ord, Show)

unfoldTree :: (a -> Maybe (a, b, a)) -> a -> BinaryTree b
unfoldTree f a = case f a of
    Just (a1, b, a2) -> Node (unfoldTree f a1) b (unfoldTree f a2)
    Nothing -> Leaf

treeBuild :: Integer -> BinaryTree Integer
treeBuild x = unfoldTree (g x) 0
    where
        g y x
            | y == x = Nothing
            | otherwise = Just (x + 1, x, x + 1)
