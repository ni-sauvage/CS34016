module Ex01 where
import Data.Char (toLower)

name, idno, username :: String
name      =  "Sauvage,  Niall"  -- replace with your name
idno      =  "20334203"    -- replace with your student id
username  =  "sauvagen"   -- replace with your TCD username


declaration -- do not modify this
 = unlines
     [ ""
     , "@@@ This exercise is all my own work."
     , "@@@ Signed: " ++ name
     , "@@@ "++idno++" "++username
     ]


{- Part 1

Write a function 'lower' that converts a string to lowercase

Hint: 'toLower :: Char -> Char' converts a character to lowercase
if it is uppercase. All other characters are unchanged.
It is imported should you want to use it.

-}
lower :: String -> String
lower [] = ""
lower (x:xs) = (toLower x) : (lower xs)


{- Part 2

Write a function 'nth' that returns the nth element of a list.
Hint: the test will answer your Qs

-}
nth :: Int -> [a] -> a
nth n x = nth' 1 n x

nth' :: Int -> Int -> [a] -> a
nth' n1 n2 (x:xs) | n1 == n2 = x
                  | otherwise = nth' (n1+1) n2 xs

{- Part 3

Write a function `commonPfx` that compares two sequences
and returns the prefix they have in common.

-}
commonPfx :: Eq a => [a] -> [a] -> [a]
commonPfx [] _ = []
commonPfx _ [] = []
commonPfx (x:xs) (y:ys) | x == y = x : commonPfx xs ys
                        | otherwise = []

{- Part 4

(TRICKY!) (VERY!)

Write a function `runs` that converts a list of things
into a list of sublists, each containing elements of the same value,
which when concatenated together give the same list

So `runs [1,2,2,1,3,3,3,2,2,1,1,4]`
 becomes `[[1],[2,2],[1],[3,3,3],[2,2],[1,1],[4]]`

Hint:  `elem :: Eq a => a -> [a] -> Bool`

HINT: Don't worry about code efficiency
       Seriously, don't!

-}
runs :: Eq a => [a] -> [[a]]
runs = undefined
