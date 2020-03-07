PROGRAM WorkWithQueryString(INPUT, OUTPUT);
USES
  DOS;
VAR
  Query: STRING;
FUNCTION GetQueryStringParameter(Key: STRING): STRING;
VAR
  a, i, ampersand: BYTE;
  word, name: STRING;
BEGIN 
  a := POS(Key, Query);
  name := COPY(Query, 1, POS('=', Query)-1);
  IF (name <> Key)
  THEN
    BEGIN
      DELETE(Query, 1, POS('&', Query));
      word := ''
    END 
  ELSE
    IF (a <> 0) 
    THEN
      BEGIN
        DELETE(Query, 1, POS('=', Query));
        ampersand := POS('&', Query);
        word := COPY(Query, 1, LENGTH(Query));
        for i := 1 to ampersand do
        word := COPY(Query, 1, ampersand-1);
        DELETE(Query, 1, ampersand);
      END;  
  GetQueryStringParameter := word;    
END;
BEGIN {WorkWithQueryString}
  WRITELN('Content-Type: text/plain');
  WRITELN;
  Query := GetEnv('QUERY_STRING');
  WRITELN('First Name: ', GetQueryStringParameter('first_name'));
  WRITELN('Last Name: ', GetQueryStringParameter('last_name'));
  WRITELN('Age: ', GetQueryStringParameter('age'))
END. {WorkWithQueryString}

