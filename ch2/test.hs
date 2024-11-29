-- test.hs

-- Type Signature for variable sayHello : String->IO(), is String to IO,
-- that lambda calculus we only have one arguments, more than one argument is with curried funcionts
sayHello :: String -> IO ()
sayHello x = putStrLn ("Hello, " ++ x ++ "!")

-- Simple Inferred Function to triple an argument
triple x = x * 3

-- Triple x = x * 4 error trying to import  a module or a type.

-- Area of a cicle
area x = 3.14 * x * x

foo x =
    let y = x * 2
        z = x ^ 2
    in 2 * y * z
