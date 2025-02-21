module Typing where

data Dog a = Dog

data No = No Int
data Ni = Na Int

data PugType = PugData

data HuskyType a = HuskyData

data DogueDeBordeaux doge
    = DogueDeBordeaux doge

myPug = PugData :: PugType
myPugi = PugData

myHuski :: HuskyType a
myHuski = HuskyData

myOtherHuski = HuskyData

myOtherOtherHuski :: HuskyType Int
myOtherOtherHuski = HuskyData

myDoge = DogueDeBordeaux 10

myOtherDoge :: DogueDeBordeaux String
myOtherDoge = DogueDeBordeaux "Ale"

data Price = Price Integer deriving (Eq, Show)
data Manufacturer = Mini | Mazda | Tata deriving (Eq, Show)
data Airline = PapuAir | Cata | TakeYo deriving (Eq, Show)

data Size = Size Integer deriving (Eq, Show)
data Vehicle
    = Car Manufacturer Price
    | Plane Airline Size
    deriving (Eq, Show)

myCar = Car Mini (Price 14000) -- Vehicle
urCar = Car Mazda (Price 20000)
clownCar = Car Tata (Price 7000)
doge = Plane PapuAir -- Partially Applied Fucntion of data constructor
newDoge = Plane PapuAir (Size 10)

isCar :: Vehicle -> Bool
isCar (Car _ _) = True
isCar _ = False

isPlane :: Vehicle -> Bool
isPlane (Plane _ _) = True
isPlane _ = False

areCars :: [Vehicle] -> [Bool]
areCars = map isCar

-- My Function will crash without an unhandled pattern Non-Exhaustive
getManu :: Vehicle -> Manufacturer
getManu (Car x _) = x
