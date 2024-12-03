-- print3.hs
module Print3 where

myGreeting :: String
-- the line above is myGreeting is of type String
myGreeting = "hello" ++ " world" ++ "."

-- we can concatenate any number of lines

hello :: String
hello = "Hi"

world :: String
world = "World"

main :: IO ()
main = do
    putStrLn myGreeting
    putStrLn secondGreet
    putStrLn "WAIT"
    where
        secondGreet = concat [hello, " ", world]

topLevel :: Integer -> Integer
topLevel x = x + woot
    where
        woot :: Integer
        woot = 4

top :: Integer-> Integer
top x = x + y 
 where 
    y :: Integer
    y = 4
