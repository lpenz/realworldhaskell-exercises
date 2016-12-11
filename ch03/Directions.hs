module Direction where

import Debug.Trace

t s a = trace (s ++ show a) a

-- Ex 9:
data Direction = Lef | Rig | Strai
                 deriving (Show, Eq)

type XY = (Int, Int)


-- Ex 10:
direction3 :: XY -> XY -> XY -> Direction
direction3 (ax,ay) (bx,by) (cx,cy) | cross == 0 = Strai
                                  | cross > 0  = Lef
                                  | cross < 0  = Rig
    where
        vx = bx - ax
        vy = by - ay
        wx = cx - bx
        wy = cy - by
        cross = vx * wy - vy * wx


-- Ex 11:
directionTriple :: [XY] -> [Direction]
directionTriple [a, b, c] = [direction3 a b c]
directionTriple (a:b:c:ps) = direction3 a b c : directionTriple (b:c:ps)


-- Ex 12:
isConvexHull :: [XY] -> Bool
isConvexHull hull = all (== head directions) directions
    where directions = directionTriple hull

