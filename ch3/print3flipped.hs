-- print3flipped.hs
module Print3Flipped where

myGreeting :: String
myGreeting = (++) "hello" " world!"

hello :: String
hello = "Hello"

world :: String
world = " World"

main :: IO ()
main = do
    putStrLn myGreeting
    putStrLn secondGreeting
    putStrLn sameSecond
    where
        secondGreeting = (++) hello ((++) world "!!!")
        sameSecond = (++) hello ((++) world "!!!")

example :: String
example = thing ++ thong
    where
        thing = "a"
        thong = "b"
