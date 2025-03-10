module Vigenere where

import Data.Char

caeserWord :: String -> Int -> String
caeserWord word shift = map (\x -> chr $ ord x + rem shift 26) word

caeser :: String -> Int -> String
caeser text shift = unwords . map (`caeserWord` shift) $ words text

uncaeser :: String -> Int -> String
uncaeser text shift = caeser text (-shift)

vigenere word ally = map (uncurry shiftLetter . (\(x, y) -> (x, ord y - ord 'a'))) (zipWithSpaces word $ cycle ally)
unvigenere word ally = map (uncurry shiftLetter . (\(x, y) -> (x, -(ord y - ord 'a')))) (zipWithSpaces word $ cycle ally)

shiftLetter letter shift =
    if letter == ' '
        then ' '
        else chr $ mod (ord letter - ord 'a' + shift) 26 + ord 'a'

zipWithSpaces [] _ = []
zipWithSpaces (x : xs) (y : ys) =
    if x == ' '
        then (' ', ' ') : zipWithSpaces xs (y : ys)
        else (x, y) : zipWithSpaces xs ys
