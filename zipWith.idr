
import data.Vect

zipWith : (a -> b -> c) -> Vect n a -> Vect n b -> Vect n c
zipWith f [] [] = []
zipWith f (x :: xs) (y :: ys) = f x y :: zipWith f xs ys

-- ctrl alt a on zipWith
-- ctrl alt c on first Vect argument
-- ctrl alt c on second Vect argument
-- ctrl alt s on first hole
-- ctrl alt c on second Vect argument in second pattern
-- ctrl alt s on last hole
-- DONE
