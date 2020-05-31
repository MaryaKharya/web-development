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
 
PROCEDURE Initialize(VAR Code: Chiper);
{Ïðèñâîèòü Code øèôð çàìåíû}
BEGIN {Initialize}
  Code['A'] := 'Z';
  Code['B'] := 'Y';
  Code['C'] := 'X';
  Code['D'] := '#';
  Code['E'] := 'V';
  Code['F'] := 'U';
  Code['G'] := 'T';
  Code['H'] := 'S';
  Code['I'] := 'I';
  Code['J'] := 'Q';
  Code['K'] := 'P';
  Code['L'] := '!';
  Code['M'] := 'N';
  Code['N'] := 'M';
  Code['O'] := '2';
  Code['P'] := 'K';
  Code['Q'] := '$';
  Code['R'] := 'D';
  Code['S'] := 'H';
  Code['T'] := '*';
  Code['U'] := 'F';
  Code['V'] := 'E';
  Code['W'] := 'T';
  Code['X'] := 'C';
  Code['Y'] := 'B';
  Code['Z'] := 'A';
  Code[' '] := '7'
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
      WRITE(Code[S[Index]])
    ELSE
      WRITE(S[Index]);
  WRITELN
END;  {Encode}
 
BEGIN {Encryption}
  {Èíèöèàëèçèðîâàòü Code}
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
