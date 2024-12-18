-- greetIfCool2.hs
module GreetIfCool2 where

greetIfCool :: String -> IO ()
greetIfCool coolness =
    if cool coolness
        then putStrLn "eyyyy. What's Up"
        else
            putStrLn "pshh"
    where
        cool x = x == "cool"

fst' :: (a, b) -> a
fst' (a, b) = a

snd' :: (a, b) -> b
snd' (a, b) = b
