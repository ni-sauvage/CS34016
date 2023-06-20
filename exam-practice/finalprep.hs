-- hof op id (x:xs)
hof op id [] = id
hof op id (x:xs) = x `op` hof op id xs

f1 = hof (*) 42
f2 = hof ninetyNineTimes 1
 where ninetyNineTimes _ = (99*)

f3 = hof (+) 0
f4 = hof (++) []
f5 = hof hitchHiker 0
 where hitchHiker x = ((x-42)+) 
