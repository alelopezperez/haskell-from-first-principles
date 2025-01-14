module RegisteredUser where

newtype Username = Username String

newtype AccountNumber
    = AccountNumber Integer

data User
    = UnregisteredUser
    | RegisteredUser Username AccountNumber

printUser :: User -> IO ()
printUser UnregisteredUser = putStrLn "UnregisteredUser"
printUser (RegisteredUser (Username name) (AccountNumber ac)) = putStrLn $ "Name is " ++ name ++ " " ++ show ac

data WherePenguinsLive
    = Galapos
    | Antartica
    | Australia
    | SouthAfrica
    deriving (Eq, Show)

data Penguins = Peng WherePenguinsLive

isSouthAfria :: Penguins -> Bool
isSouthAfria (Peng SouthAfrica) = True
isSouthAfria _ = False

whereTheyLive :: Penguins -> IO ()
whereTheyLive (Peng location) = print location

americaOrGalapos :: Penguins -> Bool
americaOrGalapos (Peng Galapos) = True
americaOrGalapos (Peng SouthAfrica) = True
americaOrGalapos _ = False
