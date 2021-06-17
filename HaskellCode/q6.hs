import Data.Char

price_table :: [(String,Float)]
price_table  = [ ("nut",3.0), ("bolt",5.25), ("widget",9.99), ("screw",7.00), ("nail",2.05)]

price :: String ->[(String,Float)] ->Float
price item pt = snd ( filter (\(name, _ )->name==item) pt !!0 )
price' item pt = sum $ map (\(n,p)->if n==item then p else 0) pt
price'' item pt = foldr (\(n,p) rest-> max (if item==n then p else 0) rest ) 0 pt
price''' item pt = head [ p | (n,p)<-pt,n==item ]

recip1 :: [(String,Int)]
recip1 = [ ("nut",2), ("bolt",2), ("widget",1) ] 

priceRecipe :: [(String, Float)] -> [(String, Int)] -> Float
priceRecipe pt rt = sum $ map (\(n,ct)-> price n pt * fromIntegral ct) rt

--capFirstWord :: String -> String
capFirstWord s = concat capss 
    where 
        ss = toSentences s
        capss = map cap1stLetter ss

cap1stLetter :: String -> String
cap1stLetter (' ':c:cs) = (' ': toUpper c: cs)
cap1stLetter (c:cs) = (toUpper c: cs)
cap1stLetter "" = ""

toSentences :: String -> [String]
toSentences s
    | elem '.' s = (takeWhile (/='.') s ++['.'] ): toSentences (tail $ dropWhile (/='.') s)
    | otherwise  = [s]