
data HTree = CNode Double Char
            | INode Double HTree HTree deriving Show

freq :: HTree -> Double
freq (CNode f _ ) = f
freq (INode f _ _ ) = f

merge :: HTree -> HTree -> HTree
merge l r = INode (freq l + freq r) l r

min_i :: [HTree] -> Int
min_i [_] = 0
min_i (t:ts)
    | freq t < f_min_tail = 0
    | otherwise           = 1+ tail_i
    where 
        tail_i =  min_i ts
        f_min_tail = freq (ts !! tail_i)

get350Slide38 = [('A',0.35),('B',0.1),('C',0.2),('D',0.2),('_',0.15)]

remove_i :: Int -> [a] -> [a]
remove_i 0 (_:xs) = xs
remove_i i (x:xs) = x: remove_i (i-1) xs

remove_i' i xs = [ x | (x,j)<- zip xs [0..], i /= j]

remove_i'' i xs = map fst (filter (\(x,j)-> j /=i) (zip xs [0..]) )

remove_i''' i xs = foldr (\(x,j) rest->if j==i then rest else x:rest ) [] (zip xs [0..]) 

remove_i'''' i xs = take i xs ++ drop (i+1) xs

--update type later
buildHTrees :: [(Char,Double)] -> [HTree]
--buildHTrees = map (\(c,f)->  CNode f c )
buildHTrees cfs = [ CNode f c | (c,f) <- cfs]

mergeAllTrees :: [HTree] -> HTree
mergeAllTrees [t] = t
mergeAllTrees ts = mergeAllTrees (min_1_2:t2s)
    where
        (min1,t1s) = remove_min ts
        (min2,t2s) = remove_min t1s
        min_1_2 = merge min1 min2

remove_min :: [HTree] -> (HTree, [HTree])
remove_min ts = (min_t,rest)
    where
        i_min = min_i ts
        min_t = ts !! i_min
        rest = remove_i i_min ts

decodeTree :: String ->HTree -> [(Char,String)]
decodeTree pre (CNode _ c)   = [(c,pre)]
decodeTree pre (INode _ l r) = dt_l ++ dt_r
    where
        dt_l = decodeTree (pre ++ "0") l
        dt_r = decodeTree (pre ++ "1") r

getHuffCodes :: [(Char,Double)] -> [(Char,String)]
getHuffCodes  = (decodeTree "").mergeAllTrees.buildHTrees