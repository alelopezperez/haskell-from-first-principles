import Data.Char

mayusculas :: String -> String
mayusculas = filter isUpper

firstUpper :: String -> String
firstUpper [] = []
firstUpper (x : xs) = toUpper x : xs

allUpper :: String -> String
allUpper [] = []
allUpper (x : xs) = toUpper x : allUpper xs

mapUpper = map toUpper

returnHeadCap :: String -> Char
returnHeadCap = toUpper . head

returnHeadCapAlt :: String -> Char
returnHeadCapAlt x = toUpper $ head x
