
and' :: [Bool] -> Bool
and' [] = True
and' (x:xs) = x && and' xs

concat' :: [[a]]->[a]
concat' [] = []
concat' (xs:xss) = xs ++ concat' xss

replicate' :: Int -> a -> [a]
replicate' 0 _ = []
replicate' n x = x : replicate' (n-1) x

replicate'' :: Int -> a -> [a]
replicate'' 0 _ = []
replicate'' n x = [x] ++ replicate' (n-1) x

replicate''' n x =  take n (repeat x)

(!!) :: [a] -> Int -> a
(!!) (x:xs) 0 = x
(!!) (x:xs) n = (Main.!!) xs (n-1)

elem' :: Eq a => a -> [a] -> Bool
elem' _ [] = False
elem' x (y:ys)
    | x == y    = True
    | otherwise = elem' x ys

elem'' x ys = any (==x) ys

elem''' x ys = or $ map (==x) ys 

merge :: Ord a => [a] -> [a] -> [a]
merge [] bs = bs
merge as [] = as
merge (a:as) (b:bs)
    | a <= b    = a : merge as (b:bs)
    | otherwise = b : merge (a:as) bs

splitEvenly :: [a] -> ([a],[a])
splitEvenly xs = (ys,zs)
    where 
        half = length xs `div` 2
        ys = take half xs
        zs = drop half xs

splitHelper 0 xs = ([],xs)
splitHelper n (x:xs) = ( x:ys,zs)
    where
        (ys,zs) = splitHelper (n-1) xs 

splitEvenly' xs = splitHelper half xs
    where 
        half = length xs `div` 2 

msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort xs = merge sortedls sortedrs
    where
        (ls,rs) = splitEvenly' xs
        sortedls = msort ls
        sortedrs = msort rs








