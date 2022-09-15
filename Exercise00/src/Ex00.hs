module Ex00 where

name, idno, username :: String
name      =  "Sauvage, Niall"  -- replace with your name
idno      =  "20334203"    -- replace with your student id
username  =  "sauvagen"   -- replace with your TCD username


declaration -- do NOT modify this
 = unlines
     [ ""
     , "@@@ This exercise is all my own work."
     , "@@@ Signed: " ++ name
     , "@@@ "++idno++" "++username
     ]

{- Modify everything below here to ensure all tests pass -}

hello  =  "Hello World :-)"
