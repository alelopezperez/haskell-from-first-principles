module As where

import Data.Char (toUpper)
import Data.List (intercalate)

wordsWhen :: (Char -> Bool) -> String -> [String]
wordsWhen p s = case dropWhile p s of
    "" -> []
    s' -> w : wordsWhen p s''
        where
            (w, s'') = break p s'

isSubseqOf :: (Eq a) => [a] -> [a] -> Bool
isSubseqOf [] [] = True
isSubseqOf [] (_ : _) = True
isSubseqOf (_ : _) [] = False
isSubseqOf la@(x : xs) (y : ys) =
    if x == y
        then isSubseqOf xs ys
        else isSubseqOf la ys

capitalizeWords sentence = map (\xss@(x : xs) -> [(xss, toUpper x : xs)]) $ words sentence

capitalizeWord :: String -> String
capitalizeWord [] = []
capitalizeWord (x : xs) = toUpper x : xs

capitalizeParagraph (x : xs) = intercalate ". " $ map (\(y : ys) -> toUpper y : ys) $ wordsWhen (== '.') (x : xs)
