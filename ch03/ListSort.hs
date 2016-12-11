module ListSort where

import Data.Ord
import Data.List as L

listSort :: [[a]] -> [[a]]
listSort = sortBy $ comparing L.length

