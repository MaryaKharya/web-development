PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 4;
  ScoreMin = 0;
  ScoreMax = 100;
TYPE
  Score = 0 .. 100;
VAR
  WhichScore: 1 .. NumberOfScores;
  Student: 1 .. ClassSize;
  NextScore: Score;
  Ave, TotalScore, ClassTotal: INTEGER;
  StorageNameFile: TEXT;
  Error: BOOLEAN;
PROCEDURE CopyName(VAR InF, OutF: TEXT);
VAR 
  Ch: CHAR;
BEGIN   
  WHILE (Ch <> ' ') AND (NOT EOLN(InF))
  DO
    BEGIN
      READ(InF, Ch);
      WRITE(OutF, Ch)
    END;
  WRITELN  
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
      REWRITE(StorageNameFile);
      CopyName(INPUT, StorageNameFile);      
      WHILE (WhichScore <= NumberOfScores) AND (NOT Error) AND (NOT EOLN)
      DO
        BEGIN
          READ(NextScore);
          IF (NextScore >= ScoreMin) AND (NextScore <= ScoreMax)
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
          RESET(StorageNameFile);
          CopyName(StorageNameFile, OUTPUT);
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
