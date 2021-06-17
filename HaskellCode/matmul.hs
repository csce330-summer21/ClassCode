type Vector = [ Double ]

type Matrix = [ Vector ] -- row-major order

sp :: Vector -> Vector -> Double
sp xs ys = sum $ map ( \(x,y)->x*y ) ( zip xs ys )

sp' xs ys = sum $ map ( \p->fst p * snd p ) ( zip xs ys )

sp'' xs ys = foldr ( \(x,y) rest -> x*y + rest ) 0 (zip xs ys )

sp''' xs ys = foldr ( \ i rest -> xs!!i*ys!!i+rest) 0 [0.. length xs -1]

row :: Matrix -> Int -> Vector
row m i = m!!i

row' = (!!)

col :: Matrix -> Int -> Vector
col m i = [ row_m !! i | row_m <-m ]

col' m i = [ (m !! j) !! i | j<-[0.. length m -1] ]

matmul:: Matrix -> Matrix -> Matrix
matmul a b = [ map ( sp (row a i) ) cbs | i<-[0.. length a -1 ] ] 
    where cbs = [ col b i | i<-[0.. length(b!!0) -1]]

matmul' a b= [ [ sp ra cb |j<-[0..length (b!!0) -1], let cb = col b j ]  | i <- [0..length a -1], let ra = a !! i]

m3x3 :: Matrix
m3x3 = [ [1,2,3], [2,1,4] , [5,2,1]]

eye3x3 :: Matrix
eye3x3 = [[1,0,0],[0,1,0],[0,0,1]]