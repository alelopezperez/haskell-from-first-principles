module Hof where

data Employee = Coder | Manager | Vep | CEO deriving (Eq, Ord, Show)

reportBoss :: Employee -> Employee -> IO ()
reportBoss e e' = putStrLn $ show e ++ " is the boss of " ++ show e'

employeeRank :: Employee -> Employee -> IO ()
employeeRank e e' = case compare e e' of
    GT -> reportBoss e e'
    EQ -> putStrLn "No Boss"
    LT -> reportBoss e' e

codersRule :: Employee -> Employee -> Ordering
codersRule Coder Coder = EQ
codersRule _ Coder = LT
codersRule Coder _ = GT
codersRule x y = compare x y

employeeRankHof :: (Employee -> Employee -> Ordering) -> Employee -> Employee -> IO ()
employeeRankHof f e e' = case f e e' of
    GT -> reportBoss e e'
    EQ -> putStrLn "No Boss"
    LT -> flip reportBoss e e'

-- Exercises
dodgy :: (Num a) => a -> a -> a
dodgy x y = x + y * 10

oneIsOne :: (Num a) => a -> a
oneIsOne = dodgy 1

oneIsTwo :: (Num a) => a -> a
oneIsTwo = (flip dodgy) 2
