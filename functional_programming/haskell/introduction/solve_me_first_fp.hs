solveMeFirst :: Int -> Int -> Int
solveMeFirst a b = a + b

main :: IO ()
main = do
    val1 <- readLn
    val2 <- readLn
    print $ solveMeFirst val1 val2
