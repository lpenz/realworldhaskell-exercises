module Ch04 where

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead l = Just $ head l

safeTail :: [a] -> Maybe [a]
safeTail [] = Nothing
safeTail l = Just $ tail l

safeLast :: [a] -> Maybe a
safeLast [] = Nothing
safeLast l = Just $ last l

safeInit :: [a] -> Maybe [a]
safeInit [] = Nothing
safeInit l = Just $ init l

splitWith :: (a -> Bool) -> [a] -> [[a]]
splitWith f l = l1 : splitWith f (dropWhile (not . f) l2)
    where
        (l1, l2) = span f l
