module Binding where

bindExp :: Integer -> String
bindExp x =
    let y = 5
    in "Val is " ++ show x ++ " and y is " ++ show y

-- nbindExp :: Integer -> String
-- nbindExp x =
--  let z = y + x
-- in let y = 5
-- in "the int was" ++ show x ++ "y was" ++ show y ++ " and z is" ++ show z

shadowBind :: Integer -> String
shadowBind x =
    let x = 100; y = 55
    in "the integer x: " ++ show x ++ " they y: " ++ show y
