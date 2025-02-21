module SumProd where

import Data.Int

data NumberOrBool
    = Numba Int8
    | BoolyBool Bool
    deriving (Eq, Show)

-- Sum type of Cardinality 3
data QuantumBool = QuantumFalse | QuantumTrue | QuantumBothe deriving (Eq, Show)

-- Product Type
data TwoQs = MkTwoQs QuantumBool QuantumBool

-- Record Syntax vs Product Type

-- Producty Type
data NormalPerson = MkPerson String Int deriving (Eq, Show)

-- Record Syntax for a Product Type
data Person = Person {name :: String, age :: Int} deriving (Eq, Show)

jm = MkPerson "julie" 108
ca = MkPerson "chris" 16

newJm = Person{name = "Julie", age = 108}

-- name function will collide with the autocreated one for Person Record
namae :: NormalPerson -> String
namae (MkPerson s _) = s
