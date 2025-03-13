module MaybeLib where

isJust :: Maybe a -> Bool
isJust (Just _) = True
isJust Nothing = False

maybee :: b -> (a -> b) -> Maybe a -> b
maybee init f (Just x) = f x
maybee init f Nothing = init

fromMaybe :: a -> Maybe a -> a
fromMaybe _ (Just x) = x
fromMaybe x Nothing = x

listToMaybe :: [a] -> Maybe a
listToMaybe (x : _) = Just x
listToMaybe [] = Nothing

maybeToList :: Maybe a -> [a]
maybeToList (Just x) = [x]
maybeToList Nothing = []

catMaybes :: [Maybe a] -> [a]
catMaybes (x : xs) = case x of
    Just y -> y : catMaybes xs
    Nothing -> catMaybes xs
catMaybes [] = []

flipMaybe :: [Maybe a] -> Maybe [a]
flipMaybe x = helpi x False []

helpi :: [Maybe a] -> Bool -> [a] -> Maybe [a]
helpi [] False acc = Just acc
helpi _ True _ = Nothing
helpi (x : xs) False acc =
    case x of
        Just e -> helpi xs False (acc ++ [e])
        Nothing -> helpi [] True []

flipMaybeFmap :: [Maybe a] -> Maybe [a]
flipMaybeFmap [] = Just []
flipMaybeFmap (x : xs) = case x of
    Just a -> fmap (a :) (flipMaybeFmap xs)
    Nothing -> Nothing
