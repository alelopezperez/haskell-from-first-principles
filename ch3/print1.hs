module Print1 where

main :: IO ()
main = putStrLn "hello world"

me :: String -> IO ()
me x = putStrLn x

add :: Int -> Int
add x = x + 1
