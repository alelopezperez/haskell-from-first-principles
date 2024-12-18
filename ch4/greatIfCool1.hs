-- greatIfCool1.hs
module GreetIfCool1 where

greetIfCool :: String -> IO ()
greetIfCool coolness =
    if cool
        then putStrLn "eyyyy. What's Up"
        else
            putStrLn "pshh"
    where
        cool = coolness == "cool"
