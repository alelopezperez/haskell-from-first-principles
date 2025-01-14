data Dumb = Nah

instance Eq Dumb where
    (==) _ _ = True
instance Ord Dumb where
    compare _ _ = LT

data Derib = No deriving (Eq)
