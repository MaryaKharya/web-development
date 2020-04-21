PROGRAM Stat(INPUT, OUTPUT);
VAR
  Number1, Number2, Min, Max, Average, Sum, Counter: INTEGER;
  Overflow: BOOLEAN;
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
  Overflow := TRUE;
  ReadNumber(INPUT, Number);
  IF Number <> -1
  THEN
    BEGIN
      Min := Number;
      Max := Number;
      Counter := 1;
      Sum := Number;
      Average := Number;
      Overflow := FALSE;
      WHILE (NOT EOLN) AND (NOT Overflow)
      DO
        BEGIN
          ReadNumber(INPUT, Number);
          IF (Number <> -1) AND (MAXINT - 1 >= Counter)
          THEN
            BEGIN
              Counter := Counter + 1;
              IF (MAXINT - Number >= Sum)
              THEN
                Sum := Sum + Number 
              ELSE
                Overflow := TRUE  
            END
          ELSE
            Overflow := TRUE;
          IF NOT Overflow
          THEN
            BEGIN    
              IF Number < Min
              THEN
                Min := Number;
              IF Number > Max
              THEN
                Max := Number;
            END
        END
    END;
  IF NOT Overflow
  THEN
    BEGIN
      Average := Sum DIV Counter;
      WRITELN(OUTPUT, 'Минимальное значение: ', Min);
      WRITELN(OUTPUT, 'Максимальное значение: ', Max);
      WRITELN(OUTPUT, 'Среднее аривметическое: ', Average, '.', (Sum MOD Counter * 10) 
                      DIV Counter, (Sum MOD Counter * 10) MOD Counter * 10 DIV Counter)
    END 
  ELSE
    WRITELN(OUTPUT, 'Ошибка перепольнения. Присутствует недопустимое число') 
END.    
