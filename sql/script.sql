-- Creator:       MySQL Workbench 6.3.8/ExportSQLite Plugin 0.1.0
-- Author:        Clément Cantraine
-- Caption:       New Model
-- Project:       Name of the project
-- Changed:       2017-01-04 09:14
-- Created:       2017-01-04 08:25
PRAGMA foreign_keys = OFF;

BEGIN;

DROP TABLE IF EXIST visibilitee;
DROP TABLE IF EXIST utilisateurs;
DROP TABLE IF EXIST amitiees;
DROP TABLE IF EXIST publications;
DROP TABLE IF EXIST jaime;


CREATE TABLE visibilitee(
  "idVisibilitee" INTEGER PRIMARY KEY NOT NULL,
  "libelle" VARCHAR(45)
);

CREATE TABLE utilisateurs(
  "idUtilisateur" INTEGER PRIMARY KEY NOT NULL,
  "nom" VARCHAR(80),
  "prenom" VARCHAR(80),
  "datenaissance" DATE,
  "email" VARCHAR(80),
  "mdp" VARCHAR(40),
  CONSTRAINT "idVisi"
    FOREIGN KEY("idUtilisateur")
    REFERENCES "visibilitee"("idVisibilitee")
);

CREATE TABLE amitiees(
  "idamitiees" INTEGER PRIMARY KEY NOT NULL,
  "dateamitiee" DATE,
  CONSTRAINT "userA"
    FOREIGN KEY("idamitiees")
    REFERENCES "utilisateurs"("idUtilisateur"),
  CONSTRAINT "userB"
    FOREIGN KEY("idamitiees")
    REFERENCES "utilisateurs"("idUtilisateur")
);
CREATE TABLE publications(
  "idPublication" INTEGER PRIMARY KEY NOT NULL,
  "contenu" LONGTEXT,
  "datePublication" DATETIME,
  CONSTRAINT "auteur"
    FOREIGN KEY("idPublication")
    REFERENCES "utilisateurs"("idUtilisateur")
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE jaime(
  "idJaime" INTEGER PRIMARY KEY NOT NULL,
  CONSTRAINT "idPublication"
    FOREIGN KEY("idJaime")
    REFERENCES "publications"("idPublication")
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT "idUtilisateur"
    FOREIGN KEY("idJaime")
    REFERENCES "utilisateurs"("idUtilisateur")
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
COMMIT;
