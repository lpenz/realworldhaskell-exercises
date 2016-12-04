-- | Count the number of chars in a file, for ch01 ex04

import qualified System.IO as SIO
import qualified System.Environment as SE

myinteract :: (String -> String) -> IO ()
myinteract f = do
    args <- SE.getArgs
    SIO.withFile (head args) SIO.ReadMode $ \h -> do
        c <- SIO.hGetContents h
        putStr $ f c

main = myinteract wordCount
    where wordCount input = show (length input) ++ "\n"
