module BinaryTree where

import Control.Arrow (ArrowChoice (right))

data BinaryTree a
    = Leaf
    | Node (BinaryTree a) a (BinaryTree a)
    deriving (Show, Eq, Ord)

insert' :: (Ord a) => a -> BinaryTree a -> BinaryTree a
insert' b Leaf = Node Leaf b Leaf
insert' b (Node left val right)
    | b == val = Node left val right
    | b > val = Node left val (insert' b right)
    | b < val = Node (insert' b left) val right

mapTree ::
    (a -> b) ->
    BinaryTree a ->
    BinaryTree b
mapTree _ Leaf = Leaf
mapTree f (Node left a right) = Node (mapTree f left) (f a) (mapTree f right)

testTree' :: BinaryTree Integer
testTree' =
    Node
        (Node Leaf 3 Leaf)
        1
        (Node Leaf 4 Leaf)
testTree :: BinaryTree Integer
testTree =
    Node
        (Node Leaf 1 Leaf)
        2
        (Node Leaf 3 Leaf)

inorder :: BinaryTree a -> [a]
inorder Leaf = []
inorder (Node left a right) = inorder left ++ (a : inorder right)

preorder :: BinaryTree a -> [a]
preorder Leaf = []
preorder (Node left a right) = a : preorder left ++ preorder right

postorder :: BinaryTree a -> [a]
postorder Leaf = []
postorder (Node left a right) = postorder left ++ postorder right ++ [a]

testPreorder :: IO ()
testPreorder =
    if preorder testTree == [2, 1, 3]
        then putStrLn "Preorder fine!"
        else putStrLn "Bad news bears."
testInorder :: IO ()
testInorder =
    if inorder testTree == [1, 2, 3]
        then putStrLn "Inorder fine!"
        else putStrLn "Bad news bears."
testPostorder :: IO ()
testPostorder =
    if postorder testTree == [1, 3, 2]
        then putStrLn "Postorder fine!"
        else putStrLn "postorder failed check"
main :: IO ()
main = do
    testPreorder
    testInorder
    testPostorder

foldTree ::
    (a -> b -> b) ->
    b ->
    BinaryTree a ->
    b
foldTree f b Leaf = b
foldTree f b (Node left a right) = foldTree f (f a (foldTree f b left)) right
