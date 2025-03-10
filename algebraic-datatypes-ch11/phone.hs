module Phones where

import Data.Time (DayPeriod)

type Digit = Char
type Presses = Int
data Button = Button Digit [Char]

newtype DaPhone = DaPhone [Button]

reverseTaps :: DaPhone -> String -> [(Digit, Presses)]
reverseTaps = undefined
