PROGRAM WorkWithQueryString(INPUT, OUTPUT);
USES
  DOS;
var
  Query: STRING;
FUNCTION GetQueryStringParameter(Key: STRING): STRING;
VAR
  a, b, c, i, equal, ampersand: byte;
  s: STRING;
BEGIN 
  a := POS(Key, Query);
  equal := POS('=', Query);
  IF (Key = 'first_name') AND (a <> 0)
  THEN
    BEGIN 
      DELETE(Query, a, equal);
      ampersand := POS('&', Query);
      s := COPY(Query, 1, ampersand-1);
      DELETE(Query, 1, ampersand);
    END
  ELSE
    
  IF (Key = 'last_name') and (a+9 = POS('=', Query))
  then
    begin 
  DELETE(Query, 1, POS('=', Query));
  ampersand := POS('&', Query);
  s := COPY(Query, 1, ampersand-1);
  DELETE(Query, 1, ampersand)
  end;
  if (Key = 'age') and (a+3 = POS('=', Query))
  then
    begin 
  DELETE(Query, 1, POS('=', Query));
  ampersand := POS('&', Query);
  s := COPY(Query, 1, length(Query));
  DELETE(Query, 1, ampersand);
  end;
  GetQueryStringParameter := s
  
END;
BEGIN {WorkWithQueryString}
  WRITELN('Content-Type: text/plain');
  WRITELN;
  Query := GetEnv('QUERY_STRING');
  WRITELN('First Name: ', GetQueryStringParameter('first_name'));
  WRITELN('Last Name: ', GetQueryStringParameter('last_name'));
  WRITELN('Age: ', GetQueryStringParameter('age'))
END. {WorkWithQueryString}

