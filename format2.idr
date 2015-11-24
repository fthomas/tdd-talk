
-- printf "Hallo" : String
-- printf "Hallo %s" : String -> String
-- printf "%s = %d" : String -> Int -> String

data Format = Lit String Format
            | Str Format
            | Num Format
            | End

%name Format fmt

PrintfType : Format -> Type
PrintfType (Lit x fmt) = PrintfType fmt
PrintfType (Str fmt) = String -> PrintfType fmt
PrintfType (Num fmt) = Int -> PrintfType fmt
PrintfType End = String

parseFormat1 : List Char -> Format
parseFormat1 [] = End
parseFormat1 ('%' :: 's' :: xs) = Str (parseFormat1 xs)
parseFormat1 ('%' :: 'd' :: xs) = Num (parseFormat1 xs)
parseFormat1 (x :: xs) = case parseFormat1 xs of
                            Lit lit fmt => Lit (strCons x lit) fmt
                            fmt         => Lit (strCons x "")  fmt

parseFormat : String -> Format
parseFormat x = ?parseFormat2 (unpack x)

printf : (s : String) -> PrintfType (parseFormat s)




--data Format = Lit String Format
--            | Str Format
            --| Num Format
            --| End

--%name Format fmt

--PrintfType : Format -> Type
--PrintfType (Lit x fmt) = PrintfType fmt
--PrintfType (Str fmt) = ?PrintfType_rhs_6
--PrintfType (Num fmt) = ?PrintfType_rhs_7
--PrintfType End = String
