module TypeClassNumberish where

class Numberish a where
    fromNumber :: Integer -> a
    toNumber :: a -> Integer

newtype Age = Age Integer deriving (Eq, Show)

instance Numberish Age where
    toNumber (Age n) = n
    fromNumber x = Age x

newtype Year = Year Integer deriving (Eq, Show)

instance Numberish Year where
    toNumber (Year n) = n
    fromNumber n = Year n

sumNumberish :: (Numberish a) => a -> a -> a
sumNumberish a b = fromNumber summed
    where
        integerOfA = toNumber a
        intergerOfB = toNumber b
        summed = integerOfA + intergerOfB

polySum :: (Numberish a, Numberish b) => a -> b -> Integer
polySum a b = summed
    where
        integerOfA = toNumber a
        intergerOfB = toNumber b
        summed = integerOfA + intergerOfB
