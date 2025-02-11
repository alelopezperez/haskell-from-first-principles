module FoldBol where

import Data.Bool

fn xs = map (\x -> bool x (-x) (x == 3)) xs
