------------------------------------------------------------
--        Script Postgre 
------------------------------------------------------------


CREATE TABLE public."Device"(
	UniqueIDDevice         VARCHAR (25) NOT NULL ,
	platformType           VARCHAR (25) NOT NULL ,
	authentificationTokken VARCHAR (25)  ,
	CONSTRAINT prk_constraint_Device PRIMARY KEY (UniqueIDDevice)
)WITHOUT OIDS;

CREATE TABLE public."UserAccount"(
	ID_UserAccount  SERIAL NOT NULL ,
	displayName     VARCHAR (25)  ,
	emailAcccount   VARCHAR (25) NOT NULL UNIQUE,
	password        VARCHAR (25) NOT NULL ,
	accessLevel     VARCHAR (25) NOT NULL ,
	ID_Organisation INT  NOT NULL ,
	CONSTRAINT prk_constraint_UserAccount PRIMARY KEY (ID_UserAccount)
)WITHOUT OIDS;

CREATE TABLE public.Game(
	ID_Game        SERIAL NOT NULL ,
	shortName      VARCHAR (25) NOT NULL ,
	longName       VARCHAR (25)  ,
	version        VARCHAR (25) NOT NULL ,
	path           VARCHAR (25) NOT NULL ,
	metaData       VARCHAR (2000)  NOT NULL ,
	signUpDateGame TIMESTAMPTZ NOT NULL ,
	CONSTRAINT prk_constraint_Game PRIMARY KEY (ID_Game)
)WITHOUT OIDS;

CREATE TABLE public."Organisation"(
	ID_Organisation  SERIAL NOT NULL ,
	nameOrganisation VARCHAR (25) NOT NULL ,
	contactEmail     VARCHAR (25) NOT NULL ,
	CONSTRAINT prk_constraint_Organisation PRIMARY KEY (ID_Organisation)
)WITHOUT OIDS;

CREATE TABLE public."ActivityDevice"(
	dateActivity   DATE  NOT NULL ,
	typeActivity   VARCHAR (25) NOT NULL ,
	UniqueIDDevice VARCHAR (25) NOT NULL ,
	ID_UserAccount INT  NOT NULL ,
	ID_Game        INT  NOT NULL ,
	CONSTRAINT prk_constraint_ActivityDevice PRIMARY KEY (dateActivity,UniqueIDDevice)
)WITHOUT OIDS;

CREATE TABLE public."ActivityAccount"(
	ID_ActivityAccount    SERIAL NOT NULL ,
	typeActivityOnAccount VARCHAR (25)  ,
	ActivityAccountDate   TIMESTAMPTZ NOT NULL ,
	ID_UserAccount        INT  NOT NULL ,
	ID_Organisation       INT  NOT NULL ,
	CONSTRAINT prk_constraint_ActivityAccount PRIMARY KEY (ID_ActivityAccount)
)WITHOUT OIDS;

CREATE TABLE public."Acquire"(
	dateAquiisition DATE  NOT NULL ,
	ID_Game         INT  NOT NULL ,
	ID_Organisation INT  NOT NULL ,
	CONSTRAINT prk_constraint_Acquire PRIMARY KEY (ID_Game,ID_Organisation)
)WITHOUT OIDS;



ALTER TABLE public."UserAccount" ADD CONSTRAINT FK_UserAccount_ID_Organisation FOREIGN KEY (ID_Organisation) REFERENCES public."Organisation"(ID_Organisation);
ALTER TABLE public."ActivityDevice" ADD CONSTRAINT FK_ActivityDevice_UniqueIDDevice FOREIGN KEY (UniqueIDDevice) REFERENCES public.Device(UniqueIDDevice);
ALTER TABLE public."ActivityDevice" ADD CONSTRAINT FK_ActivityDevice_ID_UserAccount FOREIGN KEY (ID_UserAccount) REFERENCES public.UserAccount(ID_UserAccount);
ALTER TABLE public."ActivityDevice" ADD CONSTRAINT FK_ActivityDevice_ID_Game FOREIGN KEY (ID_Game) REFERENCES public.Game(ID_Game);
ALTER TABLE public."ActivityAccount" ADD CONSTRAINT FK_ActivityAccount_ID_UserAccount FOREIGN KEY (ID_UserAccount) REFERENCES public.UserAccount(ID_UserAccount);
ALTER TABLE public."ActivityAccount" ADD CONSTRAINT FK_ActivityAccount_ID_Organisation FOREIGN KEY (ID_Organisation) REFERENCES public.Organisation(ID_Organisation);
ALTER TABLE public."Acquire" ADD CONSTRAINT FK_Acquire_ID_Game FOREIGN KEY (ID_Game) REFERENCES public.Game(ID_Game);
ALTER TABLE public."Acquire" ADD CONSTRAINT FK_Acquire_ID_Organisation FOREIGN KEY (ID_Organisation) REFERENCES public.Organisation(ID_Organisation);
