module ListMean where

listMean :: Fractional a => [a] -> a
listMean l = sum l / fromIntegral (length l)
