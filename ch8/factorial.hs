module Factorial where

brokenFact :: Integer -> Integer
brokenFact n = n * brokenFact (n - 1)

fact :: Integer -> Integer
fact 0 = 1
fact n = n * fact (n - 1)
