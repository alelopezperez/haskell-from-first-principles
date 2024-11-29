-- practice

mult1Let = let x = 5 in x
mult1Where = x
 where
  x = 5

mult3Let = let x = 5; y = 6 in x * y
mult3Where = x * y
 where
  x = 5
  y = 6

-- Let to Where

ex1Let = let x = 3; y = 100 in x * 3 + y
ex1Where = x * 3 + y
 where
  x = 3
  y = 1000

ex3Let = let x = 7; y = negate; z = y * 10 in z / x + y
ex3Where = z + x + y
 where
  x = 7
  y = 3
  z = 2
