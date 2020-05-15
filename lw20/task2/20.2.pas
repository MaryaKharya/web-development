PROGRAM XPrint(INPUT, OUTPUT);
CONST
  Width = 5;
  Height = 5;
  Size = 25;
TYPE
  MatrixSize = SET OF 1..Size;
  Alpha = SET OF 'A'..'Z';
VAR
  Ch, Ch2: CHAR;
  HeightCount, WidthCount, Count: INTEGER;
  Matrix: MatrixSize;
  MatrixFile: TEXT;
  Ok: Alpha;
BEGIN
  WRITE('¬ведите ваш текст: ');
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      Matrix := [];
      ASSIGN(MatrixFile, 'MATRICES.TXT');
      RESET(MatrixFile);
      Count := 1;
      WHILE NOT EOF(MatrixFile)
      DO
        BEGIN
          READ(MatrixFile, Ch2);
          IF Ch2 = Ch
          THEN
            BEGIN
              WHILE NOT EOLN(MatrixFile)
              DO
                BEGIN
                  READ(MatrixFile, WidthCount);
                  Matrix := Matrix + [WidthCount];
                END;
              FOR HeightCount := 1 TO Height
              DO
                BEGIN
                  FOR WidthCount := 1 TO Width
                  DO
                    BEGIN
                      IF Count IN Matrix
                      THEN
                        WRITE('X')
                      ELSE
                        WRITE(' ');
                      Count := Count + 1
                    END;
                  WRITELN
                END
            END
          ELSE
            READLN(MatrixFile);
        END;
      WRITELN   
    END
END.    
