data BinTree = BTwo BinTree Int String BinTree
             | BOne Int String
             | BZero

insert :: Int -> String -> BinTree -> BinTree
insert i s BZero = BOne i s
insert i s (BOne z os)
 | i < z = BTwo (BOne i s) z os BZero
 | i > z = BTwo BZero z os (BOne i s)
 | otherwise = BOne i s
insert i s (BTwo left z ts right)
 | i < z = BTwo (insert i s left) z ts right
 | i > z = BTwo left z ts $ insert i s right
 | otherwise = BTwo left i s right

lookup :: BinTree -> Int -> Maybe String
lookup BZero _ = Nothing
lookup (BOne z s) i
 | i == z = Just s
 | otherwise = Nothing
lookup (BTwo left z s right) i
 | i < z = Main.lookup left i 
 | i > z = Main.lookup right i 
 | i == z = Just s