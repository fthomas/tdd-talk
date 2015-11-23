
data Format = Num Format
            | Str Format
            | Lit String Format
            | End

PrintfType : Format -> Type
PrintfType (Num fmt)   = Int    -> PrintfType fmt
PrintfType (Str fmt)   = String -> PrintfType fmt
PrintfType (Lit x fmt) = PrintfType fmt
PrintfType End         = String

parseFormat : List Char -> Format
parseFormat [] = End
parseFormat ('%' :: 'd' :: xs) = Num (parseFormat xs)
parseFormat ('%' :: 's' :: xs) = Str (parseFormat xs)
parseFormat ('%' :: xs) = Lit "%" (parseFormat xs)
parseFormat (x :: xs) = case parseFormat xs of
                           Lit lit xs' => Lit (strCons x lit) xs'
                           fmt => Lit (strCons x "") fmt

printfFmt : (fmt : Format) -> String -> PrintfType fmt
printfFmt (Num y) x = \i => printfFmt y (x ++ show i)
printfFmt (Str y) x = \s => printfFmt y (x ++ s)
printfFmt (Lit y z) x = printfFmt z (x ++ y)
printfFmt End x = x


printf : (s: String) -> PrintfType (parseFormat (unpack s))
printf s = printfFmt (parseFormat (unpack s)) ""
