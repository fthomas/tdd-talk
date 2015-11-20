
import Data.Vect

myZipWith : (a -> b -> c) -> Vect n a -> Vect n b -> Vect n c
myZipWith f [] [] = []
myZipWith f (x :: xs) (y :: ys) = f x y :: myZipWith f xs ys

-- ctrl alt a on zipWith
-- ctrl alt c on first Vect argument
-- ctrl alt c on second Vect argument
-- ctrl alt s on first hole
-- ctrl alt c on second Vect argument in second pattern
-- ctrl alt s on last hole
-- DONE

myAppend : Vect n a -> Vect m a -> Vect (n + m) a
myAppend [] ys = ys
myAppend (x :: xs) ys = x :: myAppend xs ys

-- type: write or extract a top-level function signature
-- define: doing stuff on the left
-- refine: doing stuff on the right

myTake : (m : Nat) -> Vect (m + n) a -> Vect m a
myTake Z xs = []
myTake (S k) (x :: xs) = x :: (myTake k xs) -- findet Idris nicht automatisch

myDrop : (m : Nat) -> Vect (m + n) a -> Vect n a
myDrop Z xs = xs
myDrop (S k) (x :: xs) = ?hole_2

myReplicate : (n : Nat) -> a -> Vect n a
myReplicate Z x = []
myReplicate (S k) x = x :: myReplicate k x -- wird automatisch gefunden
