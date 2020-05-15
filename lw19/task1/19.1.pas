PROGRAM Prime(INPUT, OUTPUT);
CONST
  Min = 2;
  Max = 100;
VAR
  Sieve: SET OF Min .. Max;
  Multiple, NumDel: INTEGER;
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
          NumDel := Multiple;
          WHILE NumDel <= Max
          DO
            BEGIN
              Sieve := Sieve - [NumDel];
              NumDel := NumDel + Multiple
            END;
        END;
      Multiple := Multiple + 1
    END;
  WRITELN
END.      
