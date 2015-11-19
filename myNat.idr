-- data MyNat = Z | S MyNat

-- Z
-- S Z
-- S (S Z)
-- S (S (S Z))

-- myPlus : MyNat -> MyNat -> MyNat
-- myPlus Z j = j
-- myPlus (S x) j = S (myPlus x j)
