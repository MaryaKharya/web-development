PROGRAM Encryption(INPUT, OUTPUT);
{Ïåðåâîäèò ñèìâîëû èç INPUT â êîä ñîãëàñíî Chiper 
  è ïå÷àòàåò íîâûå ñèìâîëû â OUTPUT}
CONST
  Len = 20;
TYPE
  Str = ARRAY [1 .. Len] OF 'A' .. 'Z';
  Chiper = ARRAY [' ' .. 'Z'] OF CHAR;
  Length = 0 .. Len;
VAR
  Msg: Str;
  Code: Chiper;
  I: Length;
  CiphFile: TEXT;
  
PROCEDURE Initialize(VAR Code: Chiper);
VAR
  Letter, EncrLetter: CHAR;
{Ïðèñâîèòü Code øèôð çàìåíû}
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
{Âûâîäèò ñèìâîëû èç Code, ñîîòâåòñòâóþùèå ñèìâîëàì èç S}
VAR
  Index: Length;
BEGIN {Encode}
  FOR Index := 1 TO I
  DO
    IF S[Index] IN [' ' .. 'Z']
    THEN
      WRITE(Code[S[Index]]);
  WRITELN
END;  {Encode}
 
BEGIN {Encryption}
  {Èíèöèàëèçèðîâàòü Code}
  ASSIGN(CiphFile, 'CIPHER.TXT');
  RESET(CiphFile);
  Initialize(Code);
  WHILE NOT EOF
  DO
    BEGIN
      {÷èòàòü ñòðîêó â Msg è ðàñïå÷àòàòü åå}
      I := 0;
      WHILE NOT EOLN AND (I < Len)
      DO
        BEGIN
          I := I + 1;
          READ(Msg[I]);
          WRITE(Msg[I]);
        END;
      READLN;
      WRITELN;
      {ðàñïå÷àòàòü êîäèðîâàííîå ñîîáùåíèå}
      Encode(Msg)
    END
END.  {Encryption}
