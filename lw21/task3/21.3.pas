PROGRAM Encryption(INPUT, OUTPUT);
{��������� ������� �� INPUT � ��� �������� Chiper 
  � �������� ����� ������� � OUTPUT}
CONST
  Len = 20;
TYPE
  Str = ARRAY [1 .. Len] OF 'A' .. 'Z';
  Chiper = ARRAY [' ' .. 'Z'] OF CHAR;
  Length = 1 .. Len;
VAR
  Msg: Str;
  Code: Chiper;
  I: Length;
  CiphFile: TEXT;
  Error: BOOLEAN;
  
PROCEDURE Initialize(VAR Code: Chiper);
VAR
  Letter, EncrLetter: CHAR;
{��������� Code ���� ������}
BEGIN {Initialize}
  WHILE NOT EOF(CiphFile)
  DO
    BEGIN
      IF NOT EOLN(CiphFile)
      THEN
        BEGIN
          READ(CiphFile, Letter);
          IF NOT EOLN(CiphFile)
          THEN
            READ(CiphFile, EncrLetter)
        END;    
      IF Letter IN [' ' .. 'Z']
      THEN
        Code[EncrLetter] := Letter;  
      READLN(CiphFile)
    END 
END;  {Initialize}
 
PROCEDURE Encode(VAR S: Str);
{������� ������� �� Code, ��������������� �������� �� S}
VAR
  Index: 1 .. Len;
BEGIN {Encode}
  FOR Index := 1 TO Len
  DO
    IF S[Index] IN [' ' .. 'Z']
    THEN
      WRITE(Code[S[Index]])
    ELSE
      WRITE(S[Index]);
  WRITELN
END;  {Encode}
 
BEGIN {Encryption}
  {���������������� Code}
  ASSIGN(CiphFile, 'CIPHER.TXT');
  RESET(CiphFile);
  Initialize(Code);
  WHILE NOT EOF
  DO
    BEGIN
      {������ ������ � Msg � ����������� ��}
      I := 1;
      WHILE NOT EOLN AND (I < Len)
      DO
        BEGIN
          READ(Msg[I]);
          WRITE(Msg[I]);
          I := I + 1;
        END;
      READLN;
      WRITELN;
      {����������� ������������ ���������}
      Encode(Msg)
    END
END.  {Encryption}

