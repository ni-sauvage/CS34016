import Data.Char (toUpper, toLower)
import GHC.IO.FD (openFile)

toDOS :: String -> String
toDOS x = map toUpper $ (take 8 $ takeWhile (/= '.') x) ++ (take 4 $ dropWhile (/= '.') x)

main :: IO()
main = do
    f1 <- getLine
    let dos = toDOS f1
    fContent <- readFile dos
    let newContent = map toLower fContent
    writeFile "LOWER.OUT" newContent
    