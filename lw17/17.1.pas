PROGRAM Sum(INPUT, OUTPUT); 
VAR
  Sum, Digit: INTEGER;
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
      IF (Ch = '9') THEN Digit := 9
    END  
END;
BEGIN
  Sum := 0;
  Digit := 0;
  WHILE Digit <> -1
  DO
    BEGIN
      ReadDigit(INPUT, Digit);
      IF Digit <> -1
      THEN
        Sum := Sum + Digit 
    END;
  WRITELN(OUTPUT, Sum)
END.    
