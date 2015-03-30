DROP FUNCTION IF EXISTS "createTokken"();
CREATE OR REPLACE FUNCTION "createTokken"() RETURNS varchar(64) AS $body$
DECLARE
	key varchar(64);
BEGIN

	key :=  crypt(random()::text, gen_salt('md5'))::text || crypt(now()::text, gen_salt('md5'))::text;
	RETURN key;
END;
$body$ language 'plpgsql';



do $$
BEGIN
	raise notice '%', "createTokken"();
	END;
$$ language 'plpgsql';
