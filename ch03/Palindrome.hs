module Palindrome where


palindrome1 :: [a] -> [a]
palindrome1 l = l ++ reverse l


palindrome2 :: [a] -> [a]
palindrome2 l = palindrome' [] l
    where
        palindrome' suffix (x:xs) = palindrome' (x:suffix) xs
        palindrome' suffix [] = l ++ suffix



isPalindrome1 :: Eq a => [a] -> Bool
isPalindrome1 l = l == reverse l


isPalindrome2 :: Eq a => [a] -> Bool
isPalindrome2 []  = True
isPalindrome2 [_] = True
isPalindrome2 l   = (head l == last l) && isPalindrome2 (tail $ init l)

