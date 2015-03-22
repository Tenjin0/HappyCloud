# Databbase POSTGRESQL

CREATE TABLE IF NOT EXISTS public."Organisation"(
'ID_Organisation' SERIAL PRIMARY KEY,
'organisationName' varchar(50) NOT NULL,
'organisationEmail' varchar(50) NOT NULL
)

CREATE TABLE IF NOT EXISTS public."UserAccount"(
'ID_User' SERIAL PRIMARY KEY,
'displayName' varchar(50) NOT NULL,
'emailUser' varchar(50) UNIQUE NOT NULL,
'password' varchar(50) NOT NULL,
'accessLevel' integer NOT NULL
'FK_ID_Organisation' INT NOT NULL
'activeUserAccount'  boolean NOT NULL
CONSTRAINT prk FOREIGN KEY FK_ID_Organisation REFERENCES public."Organisation"(ID_Organisation)
)

CREATE TABLE IF NOT EXISTS public."Device"(
'ID_Device' SERIAL PRIMARY KEY,

)
CREATE TABLE IF NOT EXISTS public."Game"()
CREATE TABLE IF NOT EXISTS public.""()
