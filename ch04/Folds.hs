module Folds where

import Data.Char
import Data.List

import Debug.Trace

-- Ex 04:
myConcat :: [[a]] -> [a]
myConcat = foldr (++) []

myTakeWhile_rec :: (a -> Bool) -> [a] -> [a]
myTakeWhile_rec f (a:as) | f a = a : myTakeWhile_rec f as
myTakeWhile_rec _ (_:_) = []
myTakeWhile_rec _ [] = []

myTakeWhile_fold :: (a -> Bool) -> [a] -> [a]
myTakeWhile_fold f = fst . foldr step ([], True)
  where
    step _ r@(_, False)    = r
    step a (l, True) | f a = (l ++ [a], True)
    step _ r@(_, True)     = r

-- Supports infinite lists lazily
myTakeWhile_fold2 :: (a -> Bool) -> [a] -> [a]
myTakeWhile_fold2 f = (foldr step []) . map (\ a -> (f a, a))
  where
    step (True,  a) l = a:l
    step _ l = l


-- Ex 05:
myGroupBy :: (a -> a -> Bool) -> [a] -> [[a]]
myGroupBy f = foldr step [[]]
  where
    step a [[]]                  = [[a]]
    step a (l:ls) | f a (head l) = (a:l):ls
    step a (l:ls)                = [a]:l:ls


-- Ex 06:
myAny :: (a -> Bool) -> [a] -> Bool
myAny f = foldr (||) False . map f

myAny2 :: (a -> Bool) -> [a] -> Bool
myAny2 f = foldr step False
  where
    step _ True = True
    step a False | f a = True
    step _ _ = False

myCycle :: [a] -> [a]
myCycle l0 = foldr step l0 [l0]
  where
    step l _ = l ++ myCycle l

myWords :: String -> [String]
myWords = reverse . foldl' step [""]
  where
    step (w:ws) c  | not (isSpace c) = (w++[c]):ws
    step l@(w:_) _ | null w          = l
    step ws _                        = "":ws

myUnlines :: [String] -> String
myUnlines = foldl' step ""
  where
    step :: String -> String -> String
    step r l = r ++ l ++ "\n"
