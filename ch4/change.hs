-- change-mood.hs
module Main where

import Data.Maybe ()

data Mood = Blah | Woot deriving (Show)

changeMood :: Mood -> Mood
changeMood Blah = Woot

main :: IO ()
main = do
    let x = 42
    putStrLn "Hello, world!"
