module Exp where

data Expr
    = Lit Integer
    | Add Expr Expr

eval :: Expr -> Integer
eval (Add x y) = eval x + eval y
eval (Lit x) = x

printExpr :: Expr -> String
printExpr (Add x y) = printExpr x ++ " + " ++ printExpr y
printExpr (Lit x) = show x
