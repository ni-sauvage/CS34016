data Expr = K Int
 | V String
 | Add Expr Expr
 | Dvd Expr Expr
 | Where Expr String Expr

type Dict = [(String,Int)]
ins :: (String, Int) -> Dict -> Dict
ins (s, i) dict = (s, i):dict

lkp :: Dict -> String -> Maybe Int
lkp [] s = Nothing
lkp ((k, v):dict) s
    | s == k = Just v
    | otherwise = lkp dict s

eval :: Dict -> Expr -> Maybe Int
eval _ (K i) = Just i
eval d (V s) = lkp d s
eval d (Add e1 e2) = do
 o1 <- eval d e1 
 o2 <- eval d e2
 Just $ o1 + o2
eval d (Dvd e1 e2) = do 
 o1 <- eval d e1 
 o2 <- eval d e2
 if o2 == 0 then
  Nothing
 else
  Just $ o1 `div` o2
eval d (Where e1 v e2) = do
 i <- eval d e2 
 eval (ins (v, i) d) e1 



fromJust (Just x) = x