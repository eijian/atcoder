--
-- ABC001-C
--

module Main (
  main
) where

import qualified Data.ByteString.Char8 as BS

pows :: [Int]
pows = [2, 15, 33, 54, 79, 107, 138, 171, 207, 244, 284, 326]

main :: IO ()
main = do
  [i0, i1] <- BS.words <$> BS.getLine
  let
    Just (deg, _) = BS.readInt i0
    Just (dis, _) = BS.readInt i1
    --dis' = (dis * 10 + 30) `div` 60
    dis' = (dis + 3) `div` 6
    --p = calcPower dis'
    p = calcPower dis' 0 pows
  putStrLn (selectDir deg p ++ " " ++ show p)

calcPower :: Int -> Int -> [Int] -> Int
calcPower _ wp [] = wp
calcPower ws wp (x:xs)
  |ws <= x = wp
  |otherwise = calcPower ws (wp+1) xs

{-
calcPower :: Int -> Int
calcPower dis
  |dis <=  2  = 0
  |dis <= 15  = 1
  |dis <= 33  = 2
  |dis <= 54  = 3
  |dis <= 79  = 4
  |dis <= 107 = 5
  |dis <= 138 = 6
  |dis <= 171 = 7
  |dis <= 207 = 8
  |dis <= 244 = 9
  |dis <= 284 = 10
  |dis <= 326 = 11
  |otherwise   = 12
-}

dirCode :: [String]
dirCode = [
  "N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S",
  "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"
  ]

selectDir :: Int -> Int -> String
selectDir deg power
  | power == 0 = "C"
  | otherwise  = dirCode !! (((deg + 112) `mod` 3600) `div` 225)


  
