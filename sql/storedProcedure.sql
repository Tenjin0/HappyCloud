DROP FUNCTION IF EXISTS "functionTest"();
CREATE FUNCTION "functionTest"() RETURNS VOID AS $functionTest$
	BEGIN
		RAISE notice 'je fais une procedure stockée';
	END;
$functionTest$ language 'plpgsql';


DROP FUNCTION IF EXISTS "isValidUser"(tokken varchar,argemail varchar,argpassword varchar);
CREATE FUNCTION "isValidUser"(tokken varchar,argemail varchar,argpassword varchar) RETURNS text AS $isValidUser$
		DECLARE result int;
				pwd2check text;
		BEGIN
			IF tokken IS NOT NULL THEN
				SELECT "ID_User" FROM "User" WHERE "User"."authentication_tokken" = tokken INTO result;

			ELSE IF argemail IS NOT NULL AND argpassword IS NOT NULL THEN

				SELECT "password" FROM "User" WHERE "User"."email" = argemail INTO pwd2check;
			raise notice 'the password is %',pwd2check;
				SELECT "ID_User" FROM "User" WHERE "User"."email" = argemail AND pwd2check = crypt(argpassword, pwd2check) INTO result;
			ELSE
				result := null;

			END IF;
			END IF;

			IF result IS NOT NULL THEN

	  			INSERT INTO "Log"("type_log","FK_ID_User") VALUES('CONNECT',result);
				RAISE notice '%',result;

				IF tokken IS NOT NULL THEN
	  				RETURN result;

	  			ELSE IF argemail IS NOT NULL AND argpassword IS NOT NULL THEN
	  				RETURN (SELECT "authentication_tokken" FROM "User" where "ID_User" = result);

				ELSE
		  			RETURN null;
				END IF;
		  		END IF;

		  	ELSE
		  		RAISE notice 'Error result is NULL :  %', result;

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
