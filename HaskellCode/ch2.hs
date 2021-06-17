n = a `div` length xs
    where
       a = 10
       xs = [1,2,3,4,5]

last' xs = xs !! (length xs - 1)

last'' xs = head (reverse xs)

last''' = head.reverse

last'''' [x] = x
last'''' (x:xs) = last'''' xs 

last''''' xs = drop (length xs -1) xs !! 0

init' xs = take (length xs -1) xs

init'' [_] = []
init'' (x:xs) = x: init'' xs

init''' xs = reverse(tail (reverse xs))

init'''' = reverse.tail.reverse
