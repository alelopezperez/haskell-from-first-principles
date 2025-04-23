class Tipo w where
    wmap :: w -> Int

data Triv = Triv

instance Tipo Triv where
    wmap Triv = 1

data Algo a b = Vaina a b
data Trib a = Triba a

fn :: a -> a
fn x = x

class Impish v where
    impo :: v b -> v a

data FixMePls a
    = FixMe
    | Pls a
    deriving (Eq, Show)

instance Functor FixMePls where
    fmap _ FixMe = FixMe
    fmap f (Pls a) = Pls (f a)
