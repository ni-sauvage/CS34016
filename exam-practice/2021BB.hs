
data Prop = B Bool
 | P String
 | Not Prop
 | And Prop Prop
 | Let String Prop Prop

type Dict = [(String,Bool)]
ins :: String -> Bool -> Dict -> Dict
ins s i dict = (s, i):dict

lkp :: (Monad m, MonadFail m) => String -> Dict -> m Bool
lkp s [] = fail "Not in Dict"
lkp s ((k, v):dict)
    | s == k = return v
    | otherwise = lkp s dict

beval :: Dict -> Prop -> Maybe Bool
beval d (And p1 p2) = do
 e1 <- beval d p1
 e2 <- beval d p2
 Just $ e1 && e2
beval d (P s) = lkp s d
beval d (Let v p1 p2) = do 
 b <- beval d p1
 beval (ins v b d) p2
beval _ (B True) =  Just $ (3 `div` 1 ) == 0
beval _ (B False) =  Just $ (3 `div ` 2) == 0
beval d (Not p) = do 
  b <- beval d p
  Just $ not b