DROP TABLE IF EXISTS public."UserAccount" CASCADE;
DROP TABLE IF EXISTS public."Organisation" CASCADE;
DROP TYPE If EXIStS public."TypeAccess" CASCADE;

CREATE TYPE "TypeAccess" AS ENUM ('ADMIN','USER');

CREATE TABLE IF NOT EXISTS public."Organisation"(
	"ID_Organisation" SERIAL PRIMARY KEY,
	"name" varchar(50) NOT NULL,
	"email" varchar(50) UNIQUE NOT NULL,
	"creationDate" timeStamptz DEFAULT current_timestamp NOT NULL,
	"active" boolean NOT NULL DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS public."UserAccount"(
	"ID_User" SERIAL PRIMARY KEY,
	"display_name" varchar(50) NOT NULL,
	"email" varchar(50) UNIQUE NOT NULL,
	"password" varchar(50) NOT NULL,
	"access_level" "TypeAccess" NOT NULL,
	"creationDate" timeStamptz DEFAULT current_timestamp NOT NULL,
	"FK_ID_Organisation" INT NOT NULL,
	"active"  boolean NOT NULL DEFAULT TRUE,

);

INSERT INTO "Organisation" ("name","email","creationDate")
VALUES ('monOrganisation','monEmail@hotmail.com', current_timestamp);

INSERT INTO "Organisation" ("name","email")
VALUES ('tonOrganisation','monEmail@gmail.com');

SELECT * FROM "Organisation";

INSERT INTO "UserAccount"
VALUES  (DEFAULT, 'Tenji', 'patriepetit@hotmail.com', 'hashcode', 'ADMIN', DEFAULT, 1, DEFAULT);

INSERT INTO "UserAccount"
VALUES (DEFAULT,'DUPOND','DUPOND@hotmail.com','hashcode','ADMIN', DEFAULT, 1, DEFAULT);

INSERT INTO "UserAccount"
VALUES  (DEFAULT,'DUPONT','dupont@hotmail.com','hashcode','USER', DEFAULT, 1, DEFAULT);

do $$

BEGIN
INSERT INTO "UserAccount"
VALUES  (DEFAULT,'DUPONT','dupont@hotmail.com','hashcode','USER', DEFAULT, 2, DEFAULT);
EXCEPTION when OTHERS then
	raise notice 'the insertion has failed !!!!! -----> % %',SQLERRM, SQLSTATE;
END;
$$ language 'plpgsql';
SELECT * FROM "UserAccount","Organisation" where "UserAccount"."FK_ID_Organisation" = "Organisation"."ID_Organisation";
