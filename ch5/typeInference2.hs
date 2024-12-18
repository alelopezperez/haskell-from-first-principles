module TypeInference2 where

f x y = x + y + 3
g x y = x + y + 3.0

triple x = tripleItYo
    where
        tripleItYo :: Int -> Int
        tripleItYo y = y * 3
