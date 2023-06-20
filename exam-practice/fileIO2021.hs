main = do 
    f1 <- readFile "input1.txt"
    f2 <- readFile "input2.txt"
    writeFile "output12.txt" $ unlines $ interleave (lines f1) (lines f2)
    return ()
    

interleave :: [a] -> [a] -> [a]
interleave [] _ = []
interleave _ [] = []
interleave (x:xs) (y:ys) = x : y : interleave xs ys