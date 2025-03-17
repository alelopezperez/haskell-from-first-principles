module SyntaxDo where

main = do
    x1 <- getLine
    x2 <- getLine
    return (x1 ++ x2)

twoo :: IO Bool
twoo = do
    x1 <- getChar
    x2 <- getChar
    return (x1 == x2)
