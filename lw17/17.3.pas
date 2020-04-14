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
  Min := 0;
  Max := 0;
  Counter := 0;
  Overflow := FALSE;
  ReadNumber(INPUT, Number1);
  IF Number1 <> -1
  THEN
    BEGIN
      Overflow := TRUE; 
      Counter := 1;
      Sum := Number1;
      ReadNumber(INPUT, Number2);
      IF Number2 <> -1
      THEN
        BEGIN
          Counter := Counter + 1;
          IF (MAXINT - Number1 >= Number2)
          THEN
            Sum := Number1 + Number2 
          ELSE
            Overflow := FALSE;
          IF Number1 < Number2
          THEN
            BEGIN
              Min := Number1;
              Max := Number2
            END
          ELSE
            BEGIN
              Min := Number2;
              Max := Number1
            END;       
          WHILE (NOT EOLN) AND (Overflow)
          DO
            BEGIN
              ReadNumber(INPUT, Number2);
              IF Number2 <> -1
              THEN
                BEGIN
                  Counter := Counter + 1;
                  IF (MAXINT - Number2 >= Sum)
                  THEN
                    Sum := Sum + Number2 
                  ELSE
                    Overflow := FALSE
                END;
              IF (Max <= Number2)
              THEN
                Max := Number2; 
              IF (Min >= Number2)
              THEN
                Min := Number2
            END
        END
    END;
  IF Overflow
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
