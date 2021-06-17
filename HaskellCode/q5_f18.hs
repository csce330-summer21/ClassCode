noVowels :: String->String
noVowels cs = [ c | c<-cs, not $ elem c ['a','e','i','o','u'] ]

addInverses :: [(Int,Int)]
addInverses = [ (i,-1*i) | i<-[0..] ]

repeat' :: a -> [a]
repeat' x = x : repeat' x

pow :: Int -> Int -> Int
pow _ 0 = 1
pow a b = a*(pow a (b-1))