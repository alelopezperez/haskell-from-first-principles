module Parametricity where

impossible :: a -> a
-- impossible 1 = 1+3 -- cant pattern match to nums
-- impossible x = length x
-- impossible x = 4
impossible x = x

one :: a -> a -> a
one a b = b

two :: a -> a -> a
two a b = a

last :: a -> b -> b
last a b = b
