module SmartCons where

type Age = Integer
type Name = String
type ValidatePerson a = Either [PersonInvalid] a
data Person = Person Name Age deriving (Show)
data PersonInvalid = NameEmpty | AgeTooLow deriving (Eq, Show)

mkPerson :: Name -> Age -> Maybe Person
mkPerson name age
    | name /= "" && age >= 0 = Just $ Person name age
    | otherwise = Nothing

mkPersonBetter :: Name -> Age -> Either PersonInvalid Person
mkPersonBetter name age
    | name /= "" && age >= 0 = Right (Person name age)
    | name == "" = Left NameEmpty
    | otherwise = Left AgeTooLow

nameOkay :: Name -> Either [PersonInvalid] Name
nameOkay "" = Left [NameEmpty]
nameOkay name = Right name

ageOkay :: Age -> Either [PersonInvalid] Age
ageOkay x = case x < 0 of
    True -> Left [AgeTooLow]
    False -> Right x

makePerson :: Name -> Age -> ValidatePerson Person
makePerson name age = makePerson' (nameOkay name) (ageOkay age)

makePerson' :: ValidatePerson Name -> ValidatePerson Age -> ValidatePerson Person
makePerson' (Right name) (Right age) = Right (Person name age)
makePerson' (Left x) (Left y) = Left (x ++ y)
makePerson' (Left x) _ = Left x
makePerson' _ (Left x) = Left x
