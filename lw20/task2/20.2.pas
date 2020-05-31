PROGRAM XPrint(INPUT, OUTPUT);
CONST
  Width = 5;
  Size = 25;
TYPE
  MatrixSize = SET OF 1..Size;
VAR
  Ch, Ch2: CHAR;
  Count: INTEGER;
  Matrix: MatrixSize;
  MatrixFile: TEXT;
BEGIN
  WRITE('Введите ваш текст: ');
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      Matrix := [];
      ASSIGN(MatrixFile, 'MATRICES.TXT');
      RESET(MatrixFile);
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
                  READ(MatrixFile, Count);
                  Matrix := Matrix + [Count];
                END;
              FOR Count := 1 TO Size
              DO
                BEGIN
                  IF Count IN Matrix
                  THEN
                    WRITE('X')    
                  ELSE
                    WRITE(' ');
                  IF (Count MOD Width = 0)
                  THEN
                    WRITELN
                END
            END
          ELSE
            READLN(MatrixFile);
        END;
      WRITELN   
    END
