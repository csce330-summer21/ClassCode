nat2int :: Nat -> Int
nat2int Zero     = 0
nat2int (Succ n) = 1 + nat2int n

int2nat :: Int -> Nat
int2nat 0 = Zero
int2nat n = Succ (int2nat (n-1))


data Nat = Zero | Succ Nat deriving Show

add :: Nat -> Nat -> Nat
add Zero     n = n
add (Succ m) n = Succ (add m n) 

-- mult :: Nat -> Nat -> Nat


data Expr = Val Int
          | Add Expr Expr
          | Mul Expr Expr deriving Show

--folde :: (Int->Int) -> (Int->Int->Int) -> (Int->Int->Int) -> Expr -> Int



data Tree a = Nil 
            | Leaf a
            | Node (Tree a) a (Tree a) deriving Show

-- complete :: Tree a -> Bool


-- size :: Tree a -> Int


-- slide21 = Node (Node (Leaf 1)3(Leaf 4) ) 5 (Node (Leaf 6)7(Leaf 9))

-- slide21incomplete = Node (Node (Leaf 1)3 Nil ) 5 (Node (Leaf 6)7(Leaf 9))