DROP FUNCTION IF EXISTS "functionTest"();
CREATE FUNCTION "functionTest"() RETURNS VOID AS $functionTest$
	BEGIN
		RAISE notice 'je fais une procedure stockée';
	END;
$functionTest$ language 'plpgsql';

CREATE OR REPLACE FUNCTION "create_tokken"() RETURNS varchar(100) AS $body$

DECLARE
	key varchar(100);
BEGIN
	key := crypt(random()::text,gen_salt('md5'))::text || crypt(now()::text,gen_salt('md5'))::text;
RETURN key;
END;
$body$ language 'plpgsql';


DROP FUNCTION IF EXISTS "isValidUser"(argtokken varchar,argemail varchar,argpassword varchar);
CREATE FUNCTION "isValidUser"(argtokken varchar,argemail varchar,argpassword varchar) RETURNS text AS $isValidUser$
		DECLARE result int;
			tokken text;
		BEGIN
			IF argtokken IS NOT NULL THEN
				SELECT "ID_User", "authentication_tokken" FROM "User" WHERE "User"."authentication_tokken" = argtokken INTO result,tokken;
			ELSEIF argemail IS NOT NULL AND argpassword IS NOT NULL THEN

				-- SELECT "password" FROM "User" WHERE "User"."email" = argemail INTO pwd2check;
			    -- raise notice 'the password is %',pwd2check;
				SELECT "ID_User","authentication_tokken" FROM "User" WHERE "User"."email" = argemail AND password = crypt(argpassword, password) INTO result,tokken;
			ELSE
				result := null;
			END IF;
			IF result IS NOT NULL THEN

	  			INSERT INTO "Log"("type_log","FK_ID_User") VALUES('CONNECT',result);
				RAISE notice '%',result;

				IF tokken IS NOT NULL THEN
	  				RETURN tokken;

	  			ELSEIF argemail IS NOT NULL AND argpassword IS NOT NULL THEN
	  				RETURN (SELECT "authentication_tokken" FROM "User" where "ID_User" = result);

				ELSE
		  			RETURN null;
		  		END IF;

		  		-- RAISE EXCEPTION 'Nonexistent ID --> %', user_id USING HINT = 'Please check your user ID';

			END IF;

		END;
$isValidUser$ language 'plpgsql';
-- http://dba.stackexchange.com/questions/1883/how-do-i-install-pgcrypto-for-postgresql-in-ubuntu-server
-- phpass -> nodeJS (hashage/sallage/crypto)

DROP FUNCTION IF EXISTS "user_assign_games"(int);
CREATE FUNCTION "user_assign_games"(int) RETURNS text
	AS $user_assign_games$
		BEGIN
			RETURN(SELECT * FROM "Assign" where "Assign".ID_User = $1);
		END;
$user_assign_games$ language 'plpgsql';
