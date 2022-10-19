{- butrfeld Andrew Butterfield -}
module Ex02 where
import Control.Arrow (ArrowChoice(right))
import Data.Either

name, idno, username :: String
name      =  "Sauvage, Niall"  -- replace with your name
idno      =  "20334203"    -- replace with your student id
username  =  "sauvagen"   -- replace with your TCD username


declaration -- do not modify this
 = unlines
     [ ""
     , "@@@ This exercise is all my own work."
     , "@@@ Signed: " ++ name
     , "@@@ "++idno++" "++username
     ]

-- Datatypes and key functions -----------------------------------------------

-- do not change anything in this section !

type Id = String

data Expr
  = Val Double
  | Add Expr Expr
  | Mul Expr Expr
  | Sub Expr Expr
  | Dvd Expr Expr
  | Var Id
  | Def Id Expr Expr
  deriving (Eq, Show)

type Dict k d  =  [(k,d)]

define :: Dict k d -> k -> d -> Dict k d
define d s v = (s,v):d

find :: Dict String d -> String -> Either String d
find []             name              =  Left ("undefined var "++name)
find ( (s,v) : ds ) name | name == s  =  Right v
                         | otherwise  =  find ds name

type EDict = Dict String Double

v42 = Val 42 ; j42 = Just v42

-- do not change anything above !

-- Part 1 : Evaluating Expressions -- (50 test marks, worth 25 Exercise Marks) -

-- Implement the following function so all 'eval' tests pass.

-- eval should return `Left msg` if:
  -- (1) a divide by zero operation was going to be performed;
  -- (2) the expression contains a variable not in the dictionary.
  -- see test outcomes for the precise format of those messages

eval :: EDict -> Expr -> Either String Double
eval _ (Val v) = Right v
eval d (Var y) = find d y
eval d (Add x y) = 
  let e1 = eval d x 
      e2 = eval d y
  in case (e1, e2) of 
    (Left x, _) -> Left x
    (_, Left y) -> Left y
    (Right x, Right y) -> Right (x + y)
eval d (Sub x y) = 
  let e1 = eval d x 
      e2 = eval d y
  in case (e1, e2) of 
    (Left x, _) -> Left x
    (_, Left y) -> Left y
    (Right x, Right y) -> Right (x - y)
eval d (Mul x y) = 
  let e1 = eval d x 
      e2 = eval d y
  in case (e1, e2) of 
    (Left x, _) -> Left x
    (_, Left y) -> Left y
    (Right x, Right y) -> Right (x * y)
eval d (Dvd x y) = 
  let e1 = eval d x 
      e2 = eval d y
  in case (e1, e2) of 
    (Left x, _) -> Left x
    (_, Left y) -> Left y
    (_, Right 0.0) -> Left "div by zero"
    (Right x, Right y) -> Right (x / y)



-- Part 2 : Expression Laws -- (15 test marks, worth 15 Exercise Marks) --------

{-

There are many, many laws of algebra that apply to our expressions, e.g.,

  x * y            =   y * z        Law 1
  (x + y) + z      =   x + (y + z)  Law 2
  (x / y) / z      =   x / (y * z)  Law 3
  (x + y)*(x - y)  =  x*x - y*y     Law 4
  ...

  We can implement these directly in Haskell using Expr

  Function LawN takes an expression:
    If it matches the "shape" of the law lefthand-side,
    it replaces it with the corresponding righthand "shape".
    If it does not match, it returns Nothing

    Implement Laws 1 through 4 above
-}

-- x * y            =   y * z        Law 1
law1 :: Expr -> Maybe Expr
law1 (Mul x y) = Just (Mul y x)
law1 _ = Nothing

-- (x + y) + z      =   x + (y + z)  Law 2
law2 :: Expr -> Maybe Expr
law2 (Add (Add x y) z) = Just $ Add x (Add y z)
law2 _ = Nothing

-- (x / y) / z      =   x / (y * z)  Law 3
law3 :: Expr -> Maybe Expr
law3 (Dvd (Dvd x y) z) = Just $ Dvd x (Mul y z)
law3 _ = Nothing

-- (x + y)*(x - y)  =  x*x - y*y     Law 4
law4 :: Expr -> Maybe Expr
law4 (Mul (Add x y) (Sub z w)) 
  = Just $ Sub (Mul x x) (Mul y y)
  where
    z = x
    w = y
law4 _ = Nothing