module Exer where

import Data.List (intersperse)
import GHC.Natural (naturalToInteger)

notThe :: String -> Maybe String
notThe "the" = Nothing
notThe x = Just x

help :: Maybe String -> String
help Nothing = "a"
help (Just x) = x

replaceThe :: String -> String
replaceThe = unwords . map (help . notThe) . words

replaceThe' x = unwords . go . words
    where
        go [] = []
        go (x : xs) =
            case notThe x of
                Just w -> w : go xs
                Nothing -> "a" : go xs

countTheBeforeVowel :: String -> Integer
countTheBeforeVowel x = go $ words x
    where
        go [] = 0
        go (w : wn : ws) = case notThe w of
            Just w -> go (wn : ws)
            Nothing -> if vowelInit wn then 1 + go ws else go ws

vowelInit :: String -> Bool
vowelInit [] = False
vowelInit (s : _) = isVowel s

isVowel :: Char -> Bool
isVowel c = c `elem` "aeiou"

countVowels :: String -> Int
countVowels [] = 0
countVowels (w : ws) = if isVowel w then 1 + countVowels ws else countVowels ws

newtype Word' = Word' String
    deriving (Eq, Show)

mkWord :: String -> Maybe Word'
mkWord x = if countVowels x > length x - countVowels x then Nothing else Just (Word' x)

data Nat
    = Zero
    | Succ Nat
    deriving (Eq, Show)

natToInteger :: Nat -> Integer
natToInteger Zero = 0
natToInteger (Succ x) = 1 + natToInteger x

integerToNat :: Integer -> Maybe Nat
integerToNat x = case x < 0 of
    True -> Nothing
    False -> Just (go x)
        where
            go 0 = Zero
            go x = Succ (go $ x - 1)
