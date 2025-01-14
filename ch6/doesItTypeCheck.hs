module DoesItTypeCheck where

-- 1
data Person = Person Bool deriving (Show)
printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)

-- 2
data Mood = Blah | Woot deriving (Show, Ord, Eq)
settleDown x = if x == Woot then Blah else x

-- 3
-- a) What values does x accept, I think only Mood
-- b) With 9, runtime error, since Num is not and instance of Mood
-- c) we need to derive Ord

-- 4
type Subject = String
type Verb = String
type Object = String

data Sentence = Sentence Subject Verb Object deriving (Eq, Show)
s1 = Sentence "dogs" "drool"
s2 = Sentence "Julie" "Loves" "Dogs"
s3 = Sentence "one"
