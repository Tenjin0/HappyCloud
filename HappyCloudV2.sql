# Databbase POSTGRESQL

CREATE TABLE IF NOT EXISTS public."Organisation"(
	'ID_Organisation' SERIAL PRIMARY KEY,
	'name' varchar(59) NOT NULL,
	'email' varchar(50) NOT NULL
	'active' boolean NOT NULL
)

CREATE TABLE IF NOT EXISTS public."UserAccount"(
	'ID_User' SERIAL PRIMARY KEY,
	'displayName' varchar(50) NOT NULL,
	'email' varchar(50) UNIQUE NOT NULL,
	'password' varchar(50) NOT NULL,
	'accessLevel' integer NOT NULL
	'FK_ID_Organisation' INT NOT NULL,
	'active'  boolean NOT NULL,
	CONSTRAINT prk FOREIGN KEY FK_ID_Organisation REFERENCES public."Organisation"(ID_Organisation)
)

CREATE TABLE IF NOT EXISTS public."Game"(
	'ID_Game' SERIAL PRIMARY KEY,
	'shortName' varchar(50) NOT NULL,
	'displayName' varchar(50) NOT NULL,
	'version' varchar(50) NOT NULL,
	'path' varchar(50) NOT NULL,
	'metaData' Text NOT NULL,
	'active' boolean NOT NULL,
)

CREATE TABLE IF NOT EXISTS public."Device"(
	'UniqueIDDevice' varchar(50) PRIMARY KEY,
	'plateFormType' varchar(50) NOT NULL,
	'authentificationTokken' varchar(50) NOT NULL,
	'active' boolean NOT NULL
)

CREATE TABLE IF NOT EXISTS public."Activity"(
	'ID_activity' SERIAL PRIMARY KEY,
	'typeActivity' NOT NULL
)
