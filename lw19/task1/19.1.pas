PROGRAM Prime(INPUT, OUTPUT);
CONST
  Min = 2;
  Max = 100;
VAR
  Sieve: SET OF Min .. Max;
  Multiple, Index: INTEGER;
BEGIN
  Multiple := Min;
  Sieve := [Min .. Max];
  WRITELN('Простые числа: ');
  WHILE Multiple <= Max
  DO
    BEGIN
      IF Multiple IN Sieve
      THEN
        BEGIN
          WRITELN(Multiple);
          FOR Index := 2 TO Max DIV Multiple 
          DO
              Sieve := Sieve - [Multiple * Index ];
        END;
      Multiple := Multiple + 1
    END;
  WRITELN
END.      
