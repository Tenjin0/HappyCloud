
INSERT INTO "Organisation" ("name","email")
VALUES ('monOrganisation','monEmail@hotmail.com');

INSERT INTO "Organisation" ("name","email")
VALUES ('tonOrganisation','monEmail@gmail.com');


INSERT INTO "User"
VALUES  (DEFAULT, 1, 'Tenji', 'patricepetit@hotmail.com','pass1', 'hashcode', 'ADMIN', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO "User"
VALUES (DEFAULT, 1,'DUPOND','DUPOND@hotmail.com','pass2','hashcode','ADMIN', DEFAULT , DEFAULT, DEFAULT);

INSERT INTO "User"
VALUES  (DEFAULT, 2,'DUPONT','DUPONT@hotmail.com','pass3','hashcode','USER', DEFAULT, DEFAULT, DEFAULT);

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

INSERT INTO "Device" ("ID_Device","name")
VALUES  ('00000002', 'ipad');
INSERT INTO "Device" ("ID_Device","name")
VALUES  ('00000001', 'ipad');

INSERT INTO "Game" ("shortName", display_name, version, path, "metaData")
VALUES ('iquizzVendome', 'iquizzVendome','1.0.1', 'game/iquizz', 'toto');
INSERT INTO "Game" ("shortName", display_name, version, path, "metaData")
VALUES ('iquizzVendome', 'iquizzVendome','1.0.2', 'game/iquizz', 'toto');
INSERT INTO "Game" ("shortName", display_name, version, path, "metaData")
VALUES ('iquizzMezzo', 'iquizzMezzo','1.0.1', 'game/iquizz', 'toto');
INSERT INTO "Game" ("shortName", display_name, version, path, "metaData")
VALUES ('irallyeChateau1', 'irallyeChateau1','1.0.1', 'game/iquizz', 'toto');
INSERT INTO "Game" ("shortName", display_name, version, path, "metaData")
VALUES ('irallyeSiemens', 'irallyeSiemens','1.0.1', 'game/iquizz', 'toto');
INSERT INTO "Game" ("shortName", display_name, version, path, "metaData")
VALUES ('irallyeChateau2', 'irallyeChateau2','1.0.1', 'game/iquizz', 'toto');
INSERT INTO "Game" ("shortName", display_name, version, path, "metaData")
VALUES ('irallyeChateau2', 'irallyeChateau2','1.0.2', 'game/iquizz', 'toto');

