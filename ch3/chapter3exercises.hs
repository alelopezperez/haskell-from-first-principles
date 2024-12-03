-- chapter3exercises.hs
module Chapter3Exercises where

a :: String -> String
a x = take (length x - 1) x

b x = take 1 $ drop 4 x

c x = drop 9 x

thirdLetter :: String -> Char
thirdLetter = head . drop 3

letterIndex :: Int -> Char
letterIndex x = "Curry is awesome" !! x

rvsr = drop 9 x ++ " " ++ take 2 (drop 6 x) ++ " " ++ take 5 x
    where
        x = "Curry is awesome"

notMain :: IO ()
notMain = print $ rvsr
