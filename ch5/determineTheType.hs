{-# LANGUAGE NoMonomorphismRestriction #-}

module DetermineTheType where

example = 1

two = head [(0, "doge"), (1, "kitteh")]

bigNum = (^) 5
wahoo = bigNum $ 10

x = print
y = print "woohoo!"
z = x "hello world"

b = (+)
a = 5
c = b 10
d = c 200

n = 12 + m
m v = 10000 * v
