data Shape = Triangle Double Double
           | Rectangle Double Double
           | Circle Double

area : Shape -> Double
area (Triangle x y) = x * y * 0.5
area (Rectangle x y) = x * y
area (Circle x) = pi * x * x

data Picture = Primitive Shape
             | Combine Picture Picture
             | Rotate Double Picture
             | Translate Double Double Picture

picture_area : Picture -> Double
picture_area (Primitive x) = area x
picture_area (Combine x y) = picture_area x + picture_area y
picture_area (Rotate x y) = picture_area y
picture_area (Translate x y z) = picture_area z


data Tree elem = Empty
               | Node (Tree elem) elem (Tree elem)

--insert : Ord elem => elem -> Tree elem -> Tree elem
--insert x Empty = Node Empty x Empty
---insert x (Node y z w) = case compare () of
--                          bla => ?x

treeToList : Tree a -> List a
treeToList Empty = ?treeToList_rhs_1
treeToList (Node x y z) = (treeToList x) ++ (y :: treeToList z)

--

data PowerSource = Petrol | Pedal

data Vehicle : PowerSource -> Type where
     Bicycle : Vehicle Pedal
     Car : (fuel : Nat) -> Vehicle Petrol
     Bus : (fuel : Nat) -> Vehicle Petrol

wheels : Vehicle power -> Nat
wheels Bicycle = 2
wheels (Car fuel) = 4
wheels (Bus fuel) = 4

refuel : Vehicle Petrol -> Nat
refuel (Car fuel) = 100
refuel (Bus fuel) = 200
