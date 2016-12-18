module Main where

import Data.List
import Test.HUnit

-- import Debug.Trace

-- Ex 9:
data Direction = Lef | Rig | Strai
                 deriving (Show, Eq)

type XY = (Int, Int)


-- Ex 10:
direction3 :: XY -> XY -> XY -> Direction
direction3 (ax,ay) (bx,by) (cx,cy)
  | cross > 0  = Lef
  | cross < 0  = Rig
  where
        vx = bx - ax
        vy = by - ay
        wx = cx - bx
        wy = cy - by
        cross = vx * wy - vy * wx
direction3 (_,_) (_,_) (_,_) = Strai


-- Ex 11:
directionTriple :: [XY] -> [Direction]
directionTriple [a, b, c] = [direction3 a b c]
directionTriple (a:b:c:ps) = direction3 a b c : directionTriple (b:c:ps)
directionTriple [_, _] = undefined
directionTriple [_] = undefined
directionTriple [] = undefined


-- Ex 12:
isConvexHull :: [XY] -> Bool
isConvexHull hull = all (== head directions) directions
    where directions = directionTriple hull


dotproduct :: XY -> XY -> Int
dotproduct (x1, y1) (x2, y2) = x1*x2 + y1*y2


len :: XY -> Double
len (x, y) = sqrt $ fromIntegral $ x * x + y * y


get_p0 :: [XY] -> (XY, [XY])
get_p0 pts0 = (head pts, tail pts)
  where
    psorter :: XY -> XY -> Ordering
    psorter (_, y1) (_, y2) | y1 == y2  = compare y1 y2
    psorter (x1, _) (x2, _) = compare x1 x2
    pts = sortBy psorter pts0


cosa :: XY -> XY -> Double
cosa (x1,y1) (x2,y2) = fromIntegral (dotproduct (0, 1) p) / (len (0, 1) * len p)
  where p = (x2 - x1, y2 - y1)


convexfilt :: [XY] -> [XY]
convexfilt [] = undefined
convexfilt (p:ps) = p : convexfilt' p ps
  where
    convexfilt' _ [] = undefined
    convexfilt' _ [_] = undefined
    convexfilt' p0 [p1,p2] | direction3 p0 p1 p2 == Lef = [p1,p2]
    convexfilt' _ [_,p2] = [p2]
    convexfilt' p0 (p1:p2:ps') | direction3 p0 p1 p2 == Lef = p1 : convexfilt' p1 (p2:ps')
    convexfilt' p0 (__:p2:ps') = convexfilt' p0 (p2:ps')


makeconvex :: [XY] -> [XY]
makeconvex pts0 = convexfilt pts2
  where
    (p0, pts1) = get_p0 pts0
    pts2 = p0 : sortBy cosaCompare pts1
    cosaCompare :: XY -> XY -> Ordering
    cosaCompare p1 p2 = compare (cosa p0 p1) (cosa p0 p2)


main :: IO ()
main = do
  -- putStrLn $ "resultado: " ++ show ( makeconvex $ [(0,0),(2,0),(2,2),(1,1),(0,2)])
  let test1 = TestCase $ assertBool "convex square" $ isConvexHull [(0,0),(2,0),(2,2),(0,2)]
  let test2 = TestCase $ assertBool "tie" $ not $ isConvexHull [(0,0),(2,0),(2,2),(1,1),(0,2)]
  let test3 = TestCase $ assertEqual "make convex 1" [(0,0),(2,0),(2,2),(0,2)] (makeconvex $ [(0,0),(2,0),(2,2),(1,1),(0,2)])
  let test4 = TestCase $ assertBool "make convex 2" $ isConvexHull $ makeconvex $ [(0,0),(2,0),(2,2),(1,1),(0,2)]
  _ <- runTestTT $ TestList [test1, test2, test3, test4]
  return ()
