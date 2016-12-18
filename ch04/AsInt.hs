module AsInt where

import Data.List
import Data.Char (digitToInt, isDigit)

-- asInt :: String -> Int
-- asInt = loop 0
--   where
--     loop acc [] = acc
--     loop acc (x:xs) = let acc' = acc * 10 + digitToInt x
--                       in loop acc' xs


asInt_fold :: String -> Int
asInt_fold [] = 0
asInt_fold "-" = 0
asInt_fold ('-':xs) = -1 * asInt_fold xs
asInt_fold xs = foldl' f 0 xs
  where
    f n x = n * 10 + digitToInt x

type ErrorMessage = String

asInt_either :: String -> Either ErrorMessage Int
asInt_either [] = Right 0
asInt_either "-" = Right 0
asInt_either ('-':xs) = case asInt_either xs of
  e@(Left _) -> e
  (Right n) -> Right $ -1 * n
asInt_either xs = foldl' f (Right 0) xs
  where
    f e@(Left  _) _ = e
    f           _ x | not (isDigit x) = Left $ "non-digit " ++ show x
    f   (Right n) x = Right $ n * 10 + digitToInt x
