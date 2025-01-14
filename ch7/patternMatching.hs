module PatternMatching where

isItTwo :: Integer -> Bool
isItTwo 2 = True
isItTwo _ = False

isItTwoBadOrder :: Integer -> Bool
isItTwoBadOrder _ = False
isItTwoBadOrder 2 = True
