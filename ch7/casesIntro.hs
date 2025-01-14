module CasesIntro where

data Casin = One | Two | Three

funcZ x =
    case x + 1 == 1 of
        True -> "Yay"
        False -> "Whart"

palindromeWhere word =
    case isPalindrome of
        True -> "Palindrome"
        False -> "Note Palindrom"
    where
        isPalindrome = word == reverse word

doCases x =
    case x of
        One -> "one"
        _ -> "rest"

-- Exercises
functionC x y = if (x > y) then x else y
functionC' x y =
    case x > y of
        True -> "at"
        False -> "not"

ifEvenAdd2 n = if even n then (n + 2) else n
ifEvenAdd2' n = case paridad of
    True -> n + 2
    False -> n
    where
        paridad = even n

nums x =
    case compare x 0 of
        LT -> -1
        GT -> 1
        EQ -> 0
