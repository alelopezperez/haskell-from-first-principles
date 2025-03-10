module SmartCons where

type Age = Integer
type Name = String

data Person = Person Name Age deriving (Show)

mkPerson :: Name -> Age -> Maybe Person
mkPerson name age
    | name /= "" && age >= 0 = Just $ Person name age
    | otherwise = Nothing

data PersonInvalid = NameEmpty | AgeTooLow deriving (Eq, Show)

mkPersonBetter :: Name -> Age -> Either PersonInvalid Person
mkPersonBetter name age
    | name /= "" && age >= 0 = Right (Person name age)
    | name == "" = Left NameEmpty
    | otherwise = Left AgeTooLow
