module Reverse where

rvsr :: String -> [Char]
rvsr x = drop 9 x ++ " " ++ take 2 (drop 6 x) ++ " " ++ take 5 x

main = print . rvsr
