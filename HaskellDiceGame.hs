import System.Random

main :: IO ()
main = do
    runTurn (20, 20) >>= print
    
randomInt :: (Int, Int) -> StdGen -> (Int, StdGen)
randomInt range gen = randomR range gen

runTurn :: (Int, Int) -> IO String
runTurn (a, b)
    | a <= 0 = return "You Lost"
    | b <= 0 = return "You Won"
    | otherwise = do
        gen <- newStdGen
        let (n, newGen) = randomInt (1, 6) gen
        let (m, _) = randomInt (1, 6) newGen
        putStrLn "Press Enter: "
        number <- getLine
        putStrLn $ "Player rolled " ++ show m ++ "DMG \nEnemy rolled  " ++ show n ++ "DMG \nPlayer Health: " ++ show (a - n) ++ "\nEnemy Health:  " ++ show (b - m)
        runTurn (a - n, b - m)
