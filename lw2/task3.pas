PROGRAM HelloDear(INPUT, OUTPUT);
USES
  DOS;
VAR
 name: STRING;
 a: BYTE;
BEGIN
  WRITELN('Content-Type: text/plain');
  WRITELN;
  name := GetEnv('QUERY_STRING');
  IF (name[1] = 'n') and (name[2] = 'a') and (name[3] = 'm') and (name[4] = 'e') and (name[5] = '=')
  THEN
    BEGIN
      DELETE(name, 1, 5);
      FOR a := 1 to Length(name)
      DO
        IF name[a] = '&'
        THEN
          DELETE(name, a, Length(name));
      IF name <> ''
      THEN
        WRITELN('Hello, dear ', name, '!')
      ELSE
        WRITELN('Hello Anonimus')
    END
  ELSE
    WRITELN('Hello Anonimus')
END.
