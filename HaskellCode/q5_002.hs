countOnes :: String  -> Int
countOnes "" = 0
countOnes (c:cs) = (if c== '1' then 1 else 0 ) + countOnes cs

countOnes' cs = length $ filter (=='1') cs

countOnes'' cs = sum $ map (\c->if c=='1' then 1 else 0) cs

countOnes''' cs = foldr (\c rest->(if c == '1' then 1 else 0) + rest) 0 cs

countOnes'''' cs = sum [ 1 | c<-cs, c=='1']

compress :: Eq a => [a] -> [a]
compress [] = []
compress [x] = [x]
compress xs = foldr ( \(f,s) rest -> (if f==s then [] else [f] )++rest) [last xs] pairs
    where
        pairs = zip xs (tail xs )

compress' [] = []
compress' xs = foldr (\x rest->if x==head rest then rest else x:rest) [last xs] xs