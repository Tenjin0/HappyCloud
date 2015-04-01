do $$
DECLARE
number int ;
result text;
BEGIN
number := 1;

IF number = 1 THEN
  RAISE notice 'Test triggers' ;
END IF;
SELECT "display_name" FROM "User" where "ID_User" = 2 INTO result;
IF result = 'DUPOND' THEN
  UPDATE public."User"
  SET "display_name" = 'GEORGE'
  where "ID_User" = 2;
ELSE
  UPDATE public."User"
  SET "display_name" = 'DUPOND'
  where "ID_User" = 2;
END IF;
END;
$$ language 'plpgsql';

do $$
BEGIN
INSERT INTO "User" ("display_name","email","password","role")
VALUES  ('MARTIN','DUPONT@hotmail.com','hashcode','USER');
EXCEPTION when OTHERS then
	raise notice 'the insertion has failed !!!!! -----> % %',SQLERRM, SQLSTATE;
END;
$$ language 'plpgsql';

do $$
BEGIN
INSERT INTO "User" ("display_name","email","password","role")
VALUES ('DUPONT','dupont@hotmail.com','hashcode','TOTO');
EXCEPTION when OTHERS then
	raise notice 'the insertion has failed !!!!! -----> % %',SQLERRM, SQLSTATE;
END;
$$ language 'plpgsql';
