--
-- AtCoder ABC-001-A
--

main :: IO ()
main = do
  h1 <- getLine
  h2 <- getLine
  let h = map (read) [h1, h2] :: [Int]
  putStrLn $ show (h !! 0 - h !! 1)



