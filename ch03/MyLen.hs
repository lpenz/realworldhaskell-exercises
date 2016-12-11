module MyLen where

myLen :: [a] -> Int
myLen (_:xs) = 1 + myLen xs
myLen []     = 0

