PROGRAM Check(INPUT, OUTPUT);
VAR
  Number: INTEGER;
PROCEDURE ReadDigit(VAR InF: TEXT; VAR Digit: INTEGER);
VAR
  Ch: CHAR;
BEGIN
  Digit := 0;
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
  WHILE (NOT EOLN(FileIn)) AND (Digit <> -1)
  DO
    BEGIN
      ReadDigit(FileIn, Digit);          
      IF (Digit <> -1) AND (Number <> -1)
      THEN
        IF (Number < (MAXINT DIV 10)) AND ((Digit <= (MAXINT MOD 10)) OR (Number = (MAXINT DIV 10)))
        THEN 
          Number := Number * 10 + Digit
        ELSE
          Number := -1           
    END;                              
END; 
BEGIN
  ReadNumber(INPUT, Number);
  WRITELN(OUTPUT, Number)
END.    