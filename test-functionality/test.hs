quicksort :: (Ord a) => [a] -> [a]  
quicksort [] = []  
quicksort (x:xs) =   
    let smallerSorted = quicksort [a | a <- xs, a <= x]  
        biggerSorted  = quicksort [a | a <- xs, a > x]  
    in  smallerSorted ++[x] ++ biggerSorted

mysum :: (Num a) => [a] -> a
mysum [] = 0
mysum (x:xs) = x + mysum xs

hof :: (a -> b -> a) -> a -> [b] -> a
hof op s []  = s
hof op s (x:xs) = hof op (s `op` x) xs

f1 :: Integer -> [Integer] -> Integer
f1 = hof (*)

f2 :: Bool -> [Bool] -> Bool
f2 = hof (||)

f3 :: Integer -> [Integer] -> Integer
f3 = hof dblplus
 where dblplus a x = 2 * a + x

f4 :: [a] -> [[a]] -> [a]
f4 = hof concat
 where concat xs ys = ys ++ xs

f5 :: Integer -> [Integer] -> Integer
f5 = hof (-)