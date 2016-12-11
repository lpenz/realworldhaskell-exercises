import System.Environment (getArgs)

transpose :: String -> String
transpose input = unlines $ transpose' $ lines input
    where
        transpose' :: [String] -> [String]
        transpose' [[],[]] = []
        transpose' ls | lens == 0 = []
                      | otherwise = map myhead ls : transpose' (map mytail ls)
                      where lens = sum $ map length ls
        myhead [] = ' '
        myhead x = head x
        mytail [] = []
        mytail (x:xs) = xs


interactWith function inputFile outputFile = do
  input <- readFile inputFile
  writeFile outputFile (function input)

main = mainWith myFunction
  where mainWith function = do
          args <- getArgs
          case args of
            [input,output] -> interactWith function input output
            _ -> putStrLn "error: exactly two arguments needed"

        -- replace "id" with the name of our function below
        myFunction = transpose

