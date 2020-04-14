PROGRAM Check(INPUT, OUTPUT);
VAR
  Number: INTEGER;
PROCEDURE ReadDigit(VAR InF: TEXT; VAR Digit: INTEGER);
VAR
  Ch: CHAR;
BEGIN
  Digit := -1;
  IF NOT EOLN(InF)
  THEN
    BEGIN
      READ(InF, Ch);
      IF (Ch = '0') THEN Digit := 0 ELSE
      IF (Ch = '1') THEN Digit := 1 ELSE
      IF (Ch = '2') THEN Digit := 2 ELSE
      IF (Ch = '3') THEN Digit := 3 ELSE
      IF (Ch = '4') THEN Digit := 4 ELSE
      IF (Ch = '5') THEN Digit := 5 ELSE
      IF (Ch = '6') THEN Digit := 6 ELSE
      IF (Ch = '7') THEN Digit := 7 ELSE
      IF (Ch = '8') THEN Digit := 8 ELSE
      IF (Ch = '9') THEN Digit := 9 ELSE
      Digit := -1
    END     
END;

PROCEDURE ReadNumber(VAR FileIn: TEXT; VAR Number: INTEGER);
VAR
  Ch: CHAR;
  Digit: INTEGER;
BEGIN
  Number := 0;
  ReadDigit(FileIn, Digit);
  WHILE (Digit <> -1) AND (Number <> -1)
  DO
    BEGIN        
      IF (Number < (MAXINT DIV 10)) OR ((Digit <= (MAXINT MOD 10)) AND (Number = (MAXINT DIV 10)))
      THEN
        BEGIN
          Number := Number * 10 + Digit;
          ReadDigit(FileIn, Digit)
        END
      ELSE
        Number := -1           
    END;                              
END; 
BEGIN
  ReadNumber(INPUT, Number);
  WRITELN(OUTPUT, Number)
END.    
