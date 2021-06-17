pyths :: Int -> [(Int,Int,Int)]
pyths n = [ (x,y,z) | x <-[1..n], y<-[1..n], z<-[1..n], x^2 +y^2 == z^2] 



factors :: Int -> [Int]
factors n = [x|x<-[1..n],n `mod` x == 0]

prime :: Int -> Bool
prime n = length (factors n) == 2

perfect :: Int -> Bool
perfect n = sum (init $ factors n) == n

perfects n = [ x | x<-[2..n], perfect x]

sp :: Num a => [a] -> [a] -> a
sp xs ys = sum [ fst xy * snd xy | xy <- zip xs ys]

sp' xs ys = sum [ x*y | (x,y) <- zip xs ys]

sp'' xs ys = sum [ xs!!i * ys!!i | i <- [0..length xs -1]]



