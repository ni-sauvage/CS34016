data Prop = B Bool
 | P String
 | Not Prop
 | And Prop Prop
 | Let String Prop Prop

type Dict = [(String,Bool)]
ins :: String -> Bool -> Dict -> Dict
ins s i dict = (s, i):dict

lkp :: MonadFail m => String -> Dict -> m Bool
lkp s [] = fail "Not in Dict"
lkp s ((k, v):dict)
    | s == k = return v
    | otherwise = lkp s dict

beval :: MonadFail m => Dict -> Prop -> m Bool
beval _ (B False) = return False
beval _ (B True) = return True
beval d (Not p) = do
 b  <- beval d p
 return $ not b
beval d (And p1 p2) = do
 b1 <- beval d p1 
 b2 <- beval d p2
 return (b1 && b2)
beval d (P s) = lkp s d
beval d (Let v p1 p2) = do
 b <- beval d p1
 beval (ins v b d) p2

getBool Nothing = False
getBool (Just x) = x