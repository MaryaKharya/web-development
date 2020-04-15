PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 4;
TYPE
  Score = 0 .. 100;
VAR
  WhichScore: 1 .. NumberOfScores;
  Student: 1 .. ClassSize;
  NextScore: Score;
  Ave, TotalScore, ClassTotal: INTEGER;
  ForNameF: TEXT;
PROCEDURE CopyFile(VAR InF, OutF: TEXT);
VAR 
  Ch: CHAR;
BEGIN   
  WHILE (Ch <> ' ') AND (NOT EOLN(InF))
  DO
    BEGIN
      READ(InF, Ch);
      WRITE(OutF, Ch)
    END;  
END;
         
BEGIN {AverageScore}
  ClassTotal := 0;
  WRITELN('Student averages:');
  Student := 1;  
  WHILE Student <= ClassSize
  DO 
    BEGIN
      TotalScore := 0;
      WhichScore := 1;
      REWRITE(ForNameF);
      CopyFile(INPUT, ForNameF);      
      WHILE WhichScore <= NumberOfScores 
      DO
        BEGIN
          READ(NextScore);
          IF (NextScore > 0) AND (NextScore < 100)
          THEN
            BEGIN
              TotalScore := TotalScore + NextScore;
              WhichScore := WhichScore + 1;
            END
          ELSE
            WRITELN('Введено недопустимое число.')    
        END;
      READLN;
      RESET(ForNameF);
      CopyFile(ForNameF, OUTPUT);
      TotalScore := TotalScore * 10;
      Ave := TotalScore DIV NumberOfScores;
      IF Ave MOD 10 >= 5
      THEN
        WRITELN(Ave DIV 10 + 1)
      ELSE
        WRITELN(Ave DIV 10);
      ClassTotal := ClassTotal + TotalScore;
      Student := Student + 1;
    END;
  WRITELN;
  WRITELN ('Class average:');
  ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
  WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10:1)
END.  {AverageScore}
