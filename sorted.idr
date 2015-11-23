isSorted : Ord a => List a -> Bool
isSorted []  = True
isSorted [x] = True
isSorted (x :: t @ (y :: ys)) = x <= y && isSorted t

minElem : Ord a => (l : List a) -> { auto p : isSorted l = True } -> Maybe a
minElem l = head' l

prove : Ord a => (l : List a) -> Maybe (isSorted l = True)
prove []  = Just $ Refl
prove [x] = Just $ Refl
prove (x :: y :: ys) with (x <= y)
  | True  = prove (y :: ys)
  | False = Nothing

main : IO ()
main = do
  line <- getLine
  let list = map (cast { to = Integer }) $ words line
  case prove list of
       Just _  => printLn $ minElem list
       Nothing => printLn "input list is not sorted"
