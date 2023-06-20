--q2
data BinTree = BTwo BinTree Int String BinTree
             | BOne Int String
             | BZero

lookup :: BinTree -> Int -> Maybe String
lookup BZero _ = Nothing
lookup (BOne i s) z
    | z == i = Just s
    | otherwise = Nothing
lookup (BTwo left i s right) z 
    | z == i = Just s 
    | z > i = Main.lookup right z
    | z < i = Main.lookup left z

insert :: Int -> String -> BinTree -> BinTree
insert z s BZero = BOne z s
insert z s (BOne k v)
    | z == k = BOne k s
    | z < k = BTwo (BOne z s) k v BZero
    | z > k = BTwo BZero k v (BOne z s)
insert z s tree@(BTwo left k v right)
    | z == k = tree
    | z < k = BTwo (insert z s left) k v BZero
    | z > k = BTwo BZero k v $ insert z s right

--q3 a)

hof op id [] = id
hof op id (x:xs) = x `op` hof op id xs

f1 = hof (*) 42

f2 = hof ninetyNineTimes 0 
 where ninetyNineTimes x = (99*)

f3 = hof (+) 0

f4 = hof (++) []

f5 = hof hitchHiker 0
 where hitchHiker x = (*)(x-42)
-- do out laziness

take 0 xs = []
take n xs = n : Main.take (n-1) xs

from n = n : from (n-1)