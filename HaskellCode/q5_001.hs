allPos:: [Int]->Bool
allPos [] = True
allPos (n:ns) = n>0 && allPos ns

allPos' ns = filter (>0) ns == ns

allPos'' ns = null $ filter (<=0) ns

allPos''' ns = and $ map (>0) ns

allPos'''' ns = foldr (\n rest ->n>0 && rest ) True ns 

allPos''''' ns = null [ n | n<-ns, n<=0 ]

allPos'''''' ns = all (>0) ns

allPos''''''' = null.(dropWhile (>0))

triples :: [a] -> [a]
triples xs = foldr (\x rest->x:x:x:rest) [] xs