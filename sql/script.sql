-- Creator:       MySQL Workbench 6.3.8/ExportSQLite Plugin 0.1.0
-- Author:        Coolsaet Sylvain / Bonte Antoine
-- Caption:       New Model
-- Project:       Facebook_Like
-- Changed:       2017-01-04 09:14
-- Created:       2017-01-04 08:25
PRAGMA foreign_keys = OFF;

BEGIN;

DROP TABLE IF EXISTS visibilitee;
DROP TABLE IF EXISTS utilisateurs;
DROP TABLE IF EXISTS amitiees;
DROP TABLE IF EXISTS publications;
DROP TABLE IF EXISTS jaime;
DROP TABLE IF EXISTS demandeAmi;


CREATE TABLE visibilitee(
  "idVisibilitee" INTEGER PRIMARY KEY AUTOINCREMENT,
  "libelle" VARCHAR(45)
);

CREATE TABLE utilisateurs(
  "idUtilisateur" INTEGER PRIMARY KEY AUTOINCREMENT,
  "nom" VARCHAR(80),
  "prenom" VARCHAR(80),
  "datenaissance" DATE,
  "email" VARCHAR(80),
  "mdp" VARCHAR(40),
  "refVisi" INTEGER,
  FOREIGN KEY("refVisi") REFERENCES "visibilitee"("idVisibilitee")
);

CREATE TABLE amitiees(
  "idamitiees" INTEGER PRIMARY KEY AUTOINCREMENT,
  "dateamitiee" DATE,
  "userA" INTEGER,
  "userB" INTEGER,
  FOREIGN KEY("userA") REFERENCES "utilisateurs"("idUtilisateur"),
  FOREIGN KEY("userB") REFERENCES "utilisateurs"("idUtilisateur")
);

CREATE TABLE demandeAmi(
       "idDemande" INTEGER PRIMARY KEY AUTOINCREMENT,
       "userA" INTEGER,
       "userB" INTEGER,
       FOREIGN KEY("userA") REFERENCES "utilisateurs"("idUtilisateur"),
       FOREIGN KEY("userB") REFERENCES "utilisateurs"("idUtilisateur")
);

CREATE TABLE publications(
  "idPublication" INTEGER PRIMARY KEY AUTOINCREMENT,
  "contenu" LONGTEXT,
  "datePublication" DATETIME,
  "auteur" INTEGER,
  FOREIGN KEY("auteur") REFERENCES "utilisateurs"("idUtilisateur")
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE jaime(
  "idJaime" INTEGER PRIMARY KEY AUTOINCREMENT,
  "refPublication" INTEGER,
  "refUtilisateur" INTEGER,
    FOREIGN KEY("refPublication") REFERENCES "publications"("idPublication")
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY("refUtilisateur") REFERENCES "utilisateurs"("idUtilisateur")
    ON DELETE CASCADE
    ON UPDATE CASCADE
);




INSERT INTO visibilitee VALUES
       (1,'Personne');
INSERT INTO visibilitee VALUES
       (2,'Ami');
INSERT INTO visibilitee VALUES
       (3,'Tout le monde');

INSERT INTO utilisateurs VALUES
       (1,'Bonte','Antoine','2017-01-25','test@test.com','BA',1);
INSERT INTO utilisateurs VALUES
       (2,'Coolsaet','Sylvain','2016-05-25','test@test.com','CS',2);
INSERT INTO utilisateurs VALUES
       (3,'Lambert','Clément','2015-05-25','test@test.com','LC',3);

INSERT INTO amitiees VALUES
       (1,'2017-01-27',1,2);
INSERT INTO amitiees VALUES
       (2,'2016-01-27',2,3);

INSERT INTO demandeAmi VALUES
       (1,1,3);

INSERT INTO publications VALUES
       (1,'Voilà la publication 1 auteur : Antoine','2017-01-28',1);
INSERT INTO publications VALUES
       (2,'Voilà la publication 2 auteur : Sylvain','2017-01-27',2);
INSERT INTO publications VALUES
       (3,'Voilà la publication 3 auteur : Clément','2017-01-26',3);

INSERT INTO jaime VALUES
       (1,1,2);
INSERT INTO jaime VALUES
       (2,1,3);
INSERT INTO jaime VALUES
       (3,2,1);
INSERT INTO jaime VALUES
       (4,3,2);
COMMIT;
