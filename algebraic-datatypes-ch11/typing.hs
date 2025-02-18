module Typing where

data Dog a = Dog

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
