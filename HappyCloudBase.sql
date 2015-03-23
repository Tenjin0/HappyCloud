# Databbase POSTGRESQL

CREATE TABLE IF NOT EXISTS public."Organisation"(
	'ID_Organisation' SERIAL PRIMARY KEY,
	'organisationName' varchar(59) NOT NULL,
	'organisationEmail' varchar(50) NOT NULL
	'activeOrganosation' boolean NOT NULL
)

CREATE TABLE IF NOT EXISTS public."UserAccount"(
	'ID_User' SERIAL PRIMARY KEY,
	'displayName' varchar(50) NOT NULL,
	'emailUser' varchar(50) UNIQUE NOT NULL,
	'password' varchar(50) NOT NULL,
	'accessLevel' integer NOT NULL
	'FK_ID_Organisation' INT NOT NULL,
	'activeUserAccount'  boolean NOT NULL,
	CONSTRAINT prk FOREIGN KEY FK_ID_Organisation REFERENCES public."Organisation"(ID_Organisation)
)

CREATE TABLE IF NOT EXISTS public."Game"(
	'ID_Game' SERIAL PRIMARY KEY,
	'shortName' varchar(50)
	'longName' varchar(50),
	'version' varchar(50) NOT NULL,
	'path' varchar(50) NOT NULL,
	'metaData' Text NOT NULL,
	'activeGame' boolean NOT NULL,
)

CREATE TABLE IF NOT EXISTS public."Device"(
	'UniqueIDDevice' varchar(50) PRIMARY KEY,
	'plateFormType' varchar(50),
	'authentificationTokken' varchar(50),
	'activeDevice' boolean NOT NULL
)

