# Databbase POSTGRESQL

DROP TABLE IF EXISTS public."UserAccount" CASCADE;
DROP TABLE IF EXISTS public."Organisation" CASCADE;
DROP TABLE IF EXISTS public."Game" CASCADE;
DROP TABLE IF EXISTS public."Device" CASCADE;
DROP TABLE IF EXISTS public."Activity" CASCADE;
DROP TYPE IF EXISTS public."Type_Log" CASCADE;
DROP TYPE IF EXISTS public."Type_Access" CASCADE;

CREATE TYPE public."Type_Log" AS ENUM ('CONNECT','CREATE','DISCONNECT','INSTALL','MODIFY');
CREATE TYPE public."Type_Access" AS ENUM ('ADMIN','USER')


CREATE TABLE IF NOT EXISTS public."Organisation"(
	'ID_Organisation' SERIAL PRIMARY KEY,
	'organisationName' varchar(59) NOT NULL,
	'organisationEmail' varchar(50) NOT NULL
	'active' boolean NOT NULL
)

CREATE TABLE IF NOT EXISTS public."Organisation"(
	"ID_Organisation" SERIAL PRIMARY KEY,
	"name" varchar(50) NOT NULL,
	"email" varchar(50) UNIQUE NOT NULL,
	"creationDate" timeStamptz DEFAULT current_timestamp NOT NULL,
	"active" boolean NOT NULL DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS public."UserAccount"(
	'ID_User' SERIAL PRIMARY KEY,
	'displayName' varchar(50) NOT NULL,
	'emailUser' varchar(50) UNIQUE NOT NULL,
	'password' varchar(50) NOT NULL,
	'authentication_Tokken' varchar(50) NOT NULL,
	'creation' timeStamptz DEFAULT current_timestamp NOT NULL,
	'last_modification' dateTime NULL,
	'role' "Type_Access" NOT NULL,
	'active'  boolean NOT NULL DEFAULT TRUE,
	CONSTRAINT FOREIGN KEY ("FK_ID_Organisation") REFERENCES public."Organisation"("ID_Organisation")
);

CREATE TABLE IF NOT EXISTS public."Game"(
	'ID_Game' SERIAL PRIMARY KEY,
	'shortName' varchar(50)
	'display_name' varchar(50),
	'version' varchar(50) NOT NULL,
	'path' varchar(50) NOT NULL,
	'metaData' Text NOT NULL,
	'active' boolean NOT NULL,
	CONSTRAINT UNIQUE ('shortName','version')
);

CREATE TABLE IF NOT EXISTS public."Device"(
	'ID_Device' varchar(50) PRIMARY KEY,
	'name' varchar(50) NULL,
	'active' boolean NOT NULL
);

CREATE TABLE IF NOT EXISTS public."Authenticate"(
	'FK_ID_User' int NOT NULL,
	'FK_ID_Device' int NOT NULL,
	'date_auth' timeStamptz NOT NULL,
	CONSTRAINT PRIMARY KEY ('FK_ID_User','FK_ID_Device')
);

CREATE TABLE IF NOT EXISTS public."Install"(
	'FK_ID_Game' int NOT NULL,
	'FK_ID_Device' int NOT NULL,
	'date_install' timeStamptz NOT NULL,
	CONSTRAINT PRIMARY KEY ('FK_ID_Game','FK_ID_Device')
);

CREATE TABLE IF NOT EXISTS public."Assign"(
	'FK_ID_User' int NOT NULL,
	'FK_ID_Game' int NOT NULL,
	'date_assign' timeStamptz NOT NULL,
	CONSTRAINT PRIMARY KEY ('FK_ID_User','FK_ID_Game')
);

CREATE TABLE IF NOT EXISTS public."Log"
	'ID_Log' SERIAL PRIMARY KEY,
	'date_log'  timeStamptz NOT NULL,
	'type_log' "Type_Log" NOT NULL,

