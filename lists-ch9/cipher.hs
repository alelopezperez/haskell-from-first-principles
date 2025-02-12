module Ciphers where

import Data.Char

caeserWord :: String -> Int -> String
caeserWord word shift = map (\x -> chr $ ord x + rem shift 26) word

caeser :: String -> Int -> String
caeser text shift = unwords . map (`caeserWord` shift) $ words text

uncaeser :: String -> Int -> String
uncaeser text shift = caeser text (-shift)
