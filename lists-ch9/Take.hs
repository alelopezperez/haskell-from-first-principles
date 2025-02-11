module Take where

myWords :: String -> [String]
myWords [] = []
myWords x = takeWhile (/= ' ') x : myWords y
    where
        y = case dropWhile (/= ' ') x of
            ' ' : xs -> xs
            rest -> rest

firstSen = "Tyger Tyger, burning bright\n"
secondSen = "In the forests of the night\n"
thirdSen = "What immortal hand or eye\n"
fourthSen =
    "Could frame thy fearful\
    \ symmetry?"
sentences = firstSen ++ secondSen ++ thirdSen ++ fourthSen
shouldEqual =
    [ "Tyger Tyger, burning bright"
    , "In the forests of the night"
    , "What immortal hand or eye"
    , "Could frame thy fearful symmetry?"
    ]
myLines :: String -> [String]
myLines [] = []
myLines x = takeWhile (/= '\n') x : myLines y
    where
        y = case dropWhile (/= '\n') x of
            '\n' : xs -> xs
            rest -> rest

mySeparator :: String -> Char -> [String]
mySeparator [] sep = []
mySeparator x sep = takeWhile (/= sep) x : mySeparator y sep
    where
        y = case dropWhile (/= sep) x of
            sep : xs -> xs
            rest -> rest
