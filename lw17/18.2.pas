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
  Error: BOOLEAN;
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
  Error := FALSE; 
  WHILE (Student <= ClassSize) AND (NOT Error)
  DO 
    BEGIN
      TotalScore := 0;
      WhichScore := 1;
      REWRITE(ForNameF);
      CopyFile(INPUT, ForNameF);      
      WHILE (WhichScore <= NumberOfScores) AND (NOT Error) 
      DO
        BEGIN
          READ(NextScore);
          IF (NextScore >= 0) AND (NextScore <= 100)
          THEN
            BEGIN
              TotalScore := TotalScore + NextScore;
              WhichScore := WhichScore + 1;
            END
          ELSE
            Error := TRUE;    
        END;
      READLN;
      IF Error
      THEN
        WRITELN('Введено недопустимое число.')  
      ELSE
        BEGIN
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
          Student := Student + 1
        END 
    END;
  WRITELN;
  IF NOT Error
  THEN
    BEGIN
      WRITELN ('Class average:');
      ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
      WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10:1)
    END  
END.  {AverageScore}
