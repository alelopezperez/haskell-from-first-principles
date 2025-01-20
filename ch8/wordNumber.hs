module WordNumber where

import Data.List (intersperse)

digitToWord :: Int -> String
digitToWord 0 = "Zero"
digitToWord 1 = "One"
digitToWord 2 = "Two"
digitToWord 3 = "Three"
digitToWord 4 = "Four"
digitToWord 5 = "Five"
digitToWord 6 = "Six"
digitToWord 7 = "Seven"
digitToWord 8 = "Eight"
digitToWord 9 = "Nine"

digits :: Int -> [Int]
digits 1 = [1]
digits x = digits (div x 10) ++ [mod x 10]

wordNumber = concat . intersperse "-" . map digitToWord . digits
