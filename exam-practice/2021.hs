--q1
hof op (x:xs) (y:ys) = (x `op` y) : hof op xs ys
hof _ _ _ = []

f1 = hof (+)

f2 = hof (++)

f3 = hof (*)

f4 = hof addFortyTwo
 where addFortyTwo x y = x + 42

f5 = hof yMinusSquareX
 where yMinusSquareX x y = y-x*x

--q2
data Expr = K Int
        | V String
        | Mul Expr Expr
        | Dvd Expr Expr
        | Let String Expr Expr

type Dict = [(String,Int)]
ins :: String -> Int -> Dict -> Dict
ins s i dict = (s, i):dict

lkp :: MonadFail m => String -> Dict -> m Int
lkp s [] = fail "Not in Dict"
lkp s ((k, v):dict)
    | s == k = return v
    | otherwise = lkp s dict

eval :: MonadFail m => Dict -> Expr -> m Int
eval _ (K i) = return i
eval d (V s) = lkp s d
eval d (Dvd e1 e2) = do
 o1 <- eval d e1
 o2 <- eval d e2
 if o2 == 0 then
  fail "div by zero"
 else
  return $ o1 `div` o2
eval d (Let v e1 e2) = do
 i <- eval d e1
 eval (ins v i d) e2

unwrap (Just x) = x


