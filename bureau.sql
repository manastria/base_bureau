USE bureau;

-- Supression des contraintes PK et FK de toutes les tables
DECLARE @sql nvarchar(max) = '';
SELECT  @sql += 'ALTER TABLE ' + Table_Name  +'  drop constraint ' + Constraint_Name + ';'
FROM Information_Schema.CONSTRAINT_TABLE_USAGE 
ORDER BY Constraint_Name 
EXEC SP_EXECUTESQL @sql;
GO


-- supression des tables de la BDD
EXEC sp_MSforeachtable @command1 = "DROP TABLE ?"
GO


----------------------------------------------------------------------------------
--
--                              MAGASIN
--
----------------------------------------------------------------------------------
CREATE TABLE magasin (
    mag_num char(3) NOT NULL,
    mag_loc varchar(50),
    mag_ger varchar(255)
);
ALTER TABLE magasin ADD CONSTRAINT PK_magasin PRIMARY KEY (mag_num);


----------------------------------------------------------------------------------
--
--                              CLIENT
--
----------------------------------------------------------------------------------
CREATE TABLE client (
    clt_num char(3) NOT NULL,
    clt_nom varchar(50),
    clt_pnom varchar(50),
    clt_pays varchar(50),
    clt_loc varchar(50),
    clt_ca int,
    clt_type char(15)
);
ALTER TABLE client ADD CONSTRAINT PK_client PRIMARY KEY (clt_num);


----------------------------------------------------------------------------------
--
--                              FOURNISSEUR
--
----------------------------------------------------------------------------------
CREATE TABLE fournisseur (
    frs_num char(3) NOT NULL,
    frs_nom varchar(50)
);
ALTER TABLE fournisseur ADD CONSTRAINT PK_fournisseur PRIMARY KEY (frs_num);


----------------------------------------------------------------------------------
--
--                              COMMANDE
--
----------------------------------------------------------------------------------
CREATE TABLE commande (
    cmd_num char(5) NOT NULL,
    cmd_date date,
    cmd_clt char(3),
    cmd_mag char(3)
);
ALTER TABLE commande ADD CONSTRAINT PK_commande PRIMARY KEY (cmd_num);


----------------------------------------------------------------------------------
--
--                              ARTICLE
--
----------------------------------------------------------------------------------
CREATE TABLE article (
    art_num char(3) NOT NULL,
    art_nom varchar(50),
    art_poids real,
    art_coul varchar(50),
    art_stock int,
    art_pa int,
    art_pv int,
    art_frs char(3)
);
ALTER TABLE article ADD CONSTRAINT PK_article PRIMARY KEY (art_num);


----------------------------------------------------------------------------------
--
--                              LIVRAISON
--
----------------------------------------------------------------------------------
CREATE TABLE livraison (
    liv_num char(5) NOT NULL,
    liv_date date,
    liv_clt char(3),
    liv_mag char(3)
);
ALTER TABLE livraison ADD CONSTRAINT PK_livraison PRIMARY KEY (liv_num);


----------------------------------------------------------------------------------
--
--                              lig_cmd
--
----------------------------------------------------------------------------------
CREATE TABLE lig_cmd (
    lcd_cmd char(5) NOT NULL,
    lcd_art char(3) NOT NULL,
    lcd_qte int,
    lcd_liv int,
    lcd_pu int,
    lcd_dateliv date
);
ALTER TABLE lig_cmd ADD CONSTRAINT PK_lig_cmd PRIMARY KEY (lcd_cmd, lcd_art);


----------------------------------------------------------------------------------
--
--                              lig_liv
--
----------------------------------------------------------------------------------
CREATE TABLE lig_liv (
    llv_liv char(5) NOT NULL,
    llv_art char(3) NOT NULL,
    llv_qte int,
    llv_cmd char(5)
);
ALTER TABLE lig_liv ADD CONSTRAINT PK_lig_liv PRIMARY KEY (llv_liv, llv_art);







GO




----------------------------------------------------------------------------------
--
--                              ARTICLE
--
----------------------------------------------------------------------------------
INSERT INTO article (art_num,art_nom,art_poids,art_coul,art_stock,art_pa,art_pv,art_frs) VALUES ('A01','AGRAFEUSE',150,'ROUGE',10,20,29,'F04');
INSERT INTO article (art_num,art_nom,art_poids,art_coul,art_stock,art_pa,art_pv,art_frs) VALUES ('A02','CALCULATRICE',150,'NOIR',5,200,235,'F01');
INSERT INTO article (art_num,art_nom,art_poids,art_coul,art_stock,art_pa,art_pv,art_frs) VALUES ('A03','CACHET-DATEUR',100,'BLANC',3,21,30,'F04');
INSERT INTO article (art_num,art_nom,art_poids,art_coul,art_stock,art_pa,art_pv,art_frs) VALUES ('A04','LAMPE',550,'ROUGE',3,105,149,'F05');
INSERT INTO article (art_num,art_nom,art_poids,art_coul,art_stock,art_pa,art_pv,art_frs) VALUES ('A05','LAMPE',550,'BLANC',3,105,149,'F05');
INSERT INTO article (art_num,art_nom,art_poids,art_coul,art_stock,art_pa,art_pv,art_frs) VALUES ('A06','LAMPE',550,'BLEU',3,105,149,'F05');
INSERT INTO article (art_num,art_nom,art_poids,art_coul,art_stock,art_pa,art_pv,art_frs) VALUES ('A07','LAMPE',550,'VERT',3,105,149,'F05');
INSERT INTO article (art_num,art_nom,art_poids,art_coul,art_stock,art_pa,art_pv,art_frs) VALUES ('A08','PESE-LETTRE 1-500', NULL,'NULL',2,120,200,'F03');
INSERT INTO article (art_num,art_nom,art_poids,art_coul,art_stock,art_pa,art_pv,art_frs) VALUES ('A09','PESE-LETTRE 1-1000', NULL,'NULL',2,150,250,'F03');
INSERT INTO article (art_num,art_nom,art_poids,art_coul,art_stock,art_pa,art_pv,art_frs) VALUES ('A10','CRAYON',20,'ROUGE',210,1,2,'F02');
INSERT INTO article (art_num,art_nom,art_poids,art_coul,art_stock,art_pa,art_pv,art_frs) VALUES ('A11','CRAYON',20,'BLEU',190,1,2,'F02');
INSERT INTO article (art_num,art_nom,art_poids,art_coul,art_stock,art_pa,art_pv,art_frs) VALUES ('A12','CRAYON LUXE',20,'ROUGE',95,3,5,'F02');
INSERT INTO article (art_num,art_nom,art_poids,art_coul,art_stock,art_pa,art_pv,art_frs) VALUES ('A13','CRAYON LUXE',20,'VERT',90,3,5,'F02');
INSERT INTO article (art_num,art_nom,art_poids,art_coul,art_stock,art_pa,art_pv,art_frs) VALUES ('A14','CRAYON LUXE',20,'BLEU',80,3,5,'F02');
INSERT INTO article (art_num,art_nom,art_poids,art_coul,art_stock,art_pa,art_pv,art_frs) VALUES ('A15','CRAYON LUXE',20,'NOIR',450,3,5,'F02');


----------------------------------------------------------------------------------
--
--                              CLIENT
--
----------------------------------------------------------------------------------
INSERT INTO client (clt_num,clt_nom,clt_pnom,clt_pays,clt_loc,clt_ca,clt_type) VALUES ('C01','DEFRER','Marc','F','PARIS',806,'Particulier');
INSERT INTO client (clt_num,clt_nom,clt_pnom,clt_pays,clt_loc,clt_ca,clt_type) VALUES ('C02','DECERF','Jean','F','PARIS',0,'Particulier');
INSERT INTO client (clt_num,clt_nom,clt_pnom,clt_pays,clt_loc,clt_ca,clt_type) VALUES ('C03','DEFAWE','Léon','B','LIEGE',0,'Particulier');
INSERT INTO client (clt_num,clt_nom,clt_pnom,clt_pays,clt_loc,clt_ca,clt_type) VALUES ('C04','NOSSENT','Serge','B','BRUXELLES',149,'Particulier');
INSERT INTO client (clt_num,clt_nom,clt_pnom,clt_pays,clt_loc,clt_ca,clt_type) VALUES ('C05','JACOB','Marthe','F','MARSEILLE',31,'Administration');
INSERT INTO client (clt_num,clt_nom,clt_pnom,clt_pays,clt_loc,clt_ca,clt_type) VALUES ('C06','JAMAR','Pierre','B','LIEGE',21,'Administration');
INSERT INTO client (clt_num,clt_nom,clt_pnom,clt_pays,clt_loc,clt_ca,clt_type) VALUES ('C07','DECKERS','William','F','LYON',140,'Grand Compte');
INSERT INTO client (clt_num,clt_nom,clt_pnom,clt_pays,clt_loc,clt_ca,clt_type) VALUES ('C08','DECLERCS','Lucien','B','BRUXELLES',349,'Grand Compte');
INSERT INTO client (clt_num,clt_nom,clt_pnom,clt_pays,clt_loc,clt_ca,clt_type) VALUES ('C09','DEFYZ','Maurice','F','BORDEAUX',0,'Particulier');
INSERT INTO client (clt_num,clt_nom,clt_pnom,clt_pays,clt_loc,clt_ca,clt_type) VALUES ('C10','DEFOOZ','Francis','F','LILLE',60,'Particulier');
INSERT INTO client (clt_num,clt_nom,clt_pnom,clt_pays,clt_loc,clt_ca,clt_type) VALUES ('C11','RAMJOIE','Victor','F','NANTES',0,'Particulier');
INSERT INTO client (clt_num,clt_nom,clt_pnom,clt_pays,clt_loc,clt_ca,clt_type) VALUES ('C12','RENARDY','Jean','F','MARSEILLE',275,'Grand Compte');
INSERT INTO client (clt_num,clt_nom,clt_pnom,clt_pays,clt_loc,clt_ca,clt_type) VALUES ('C13','MANTEAU','Yvan','F','PARIS',320,'Grand Compte');
INSERT INTO client (clt_num,clt_nom,clt_pnom,clt_pays,clt_loc,clt_ca,clt_type) VALUES ('C15','DELVENNE','Christian','F','LYON',0,'Grand Compte');
INSERT INTO client (clt_num,clt_nom,clt_pnom,clt_pays,clt_loc,clt_ca,clt_type) VALUES ('C14','JONAS','Henri','F','PARIS',0,'PME');
INSERT INTO client (clt_num,clt_nom,clt_pnom,clt_pays,clt_loc,clt_ca,clt_type) VALUES ('C16','DEFEEZ','André','F','LYON',0,'Particulier');





----------------------------------------------------------------------------------
--
--                              COMMANDES
--
----------------------------------------------------------------------------------
INSERT INTO commande (cmd_num,cmd_date,cmd_clt,cmd_mag) VALUES ('C9401','2012-06-06','C07','M03');
INSERT INTO commande (cmd_num,cmd_date,cmd_clt,cmd_mag) VALUES ('C9402','2012-06-06','C06','M12');
INSERT INTO commande (cmd_num,cmd_date,cmd_clt,cmd_mag) VALUES ('C9403','2012-06-06','C13','M01');
INSERT INTO commande (cmd_num,cmd_date,cmd_clt,cmd_mag) VALUES ('C9404','2012-06-06','C01','M02');
INSERT INTO commande (cmd_num,cmd_date,cmd_clt,cmd_mag) VALUES ('C9405','2012-06-06','C08','M11');
INSERT INTO commande (cmd_num,cmd_date,cmd_clt,cmd_mag) VALUES ('C9406','2012-06-07','C05','M04');
INSERT INTO commande (cmd_num,cmd_date,cmd_clt,cmd_mag) VALUES ('C9407','2012-06-07','C04','M11');
INSERT INTO commande (cmd_num,cmd_date,cmd_clt,cmd_mag) VALUES ('C9408','2012-06-08','C03','M12');
INSERT INTO commande (cmd_num,cmd_date,cmd_clt,cmd_mag) VALUES ('C9409','2012-06-08','C10','M11');
INSERT INTO commande (cmd_num,cmd_date,cmd_clt,cmd_mag) VALUES ('C9410','2012-06-08','C01','M11');
INSERT INTO commande (cmd_num,cmd_date,cmd_clt,cmd_mag) VALUES ('C9411','2012-06-09','C12','M01');
INSERT INTO commande (cmd_num,cmd_date,cmd_clt,cmd_mag) VALUES ('C9412','2012-06-10','C01','M11');



----------------------------------------------------------------------------------
--
--                              FOURNISSEUR
--
----------------------------------------------------------------------------------
INSERT INTO fournisseur (frs_num,frs_nom) VALUES ('F01','CATIO ELECTRONIQUE');
INSERT INTO fournisseur (frs_num,frs_nom) VALUES ('F02','LES STYLOS REUNIS');
INSERT INTO fournisseur (frs_num,frs_nom) VALUES ('F03','MECANIQUE DE PRECISION');
INSERT INTO fournisseur (frs_num,frs_nom) VALUES ('F04','SARL ROULAND');
INSERT INTO fournisseur (frs_num,frs_nom) VALUES ('F05','ELECTROLAMP');


----------------------------------------------------------------------------------
--
--                              lig_cmd
--
----------------------------------------------------------------------------------
INSERT INTO lig_cmd (lcd_cmd,lcd_art,lcd_qte,lcd_liv,lcd_pu,lcd_dateliv) VALUES ('C9401','A04',1,1,140,'2012-06-06');
INSERT INTO lig_cmd (lcd_cmd,lcd_art,lcd_qte,lcd_liv,lcd_pu,lcd_dateliv) VALUES ('C9402','A10',1,1,2,'2012-06-06');
INSERT INTO lig_cmd (lcd_cmd,lcd_art,lcd_qte,lcd_liv,lcd_pu,lcd_dateliv) VALUES ('C9402','A11',2,2,2,'2012-06-06');
INSERT INTO lig_cmd (lcd_cmd,lcd_art,lcd_qte,lcd_liv,lcd_pu,lcd_dateliv) VALUES ('C9402','A14',3,3,5,'2012-06-06');
INSERT INTO lig_cmd (lcd_cmd,lcd_art,lcd_qte,lcd_liv,lcd_pu,lcd_dateliv) VALUES ('C9403','A02',1,1,230,'2012-06-06');
INSERT INTO lig_cmd (lcd_cmd,lcd_art,lcd_qte,lcd_liv,lcd_pu,lcd_dateliv) VALUES ('C9403','A15',5,5,4,'2012-06-06');
INSERT INTO lig_cmd (lcd_cmd,lcd_art,lcd_qte,lcd_liv,lcd_pu,lcd_dateliv) VALUES ('C9403','A03',2,2,30,'2012-06-06');
INSERT INTO lig_cmd (lcd_cmd,lcd_art,lcd_qte,lcd_liv,lcd_pu,lcd_dateliv) VALUES ('C9403','A14',1,1,5,'2012-06-06');
INSERT INTO lig_cmd (lcd_cmd,lcd_art,lcd_qte,lcd_liv,lcd_pu,lcd_dateliv) VALUES ('C9403','A13',1,1,5,'2012-06-06');
INSERT INTO lig_cmd (lcd_cmd,lcd_art,lcd_qte,lcd_liv,lcd_pu,lcd_dateliv) VALUES ('C9404','A02',2,0,235,'2012-06-10');
INSERT INTO lig_cmd (lcd_cmd,lcd_art,lcd_qte,lcd_liv,lcd_pu,lcd_dateliv) VALUES ('C9404','A12',1,0,5,'2012-06-10');
INSERT INTO lig_cmd (lcd_cmd,lcd_art,lcd_qte,lcd_liv,lcd_pu,lcd_dateliv) VALUES ('C9404','A13',10,0,4,'2012-06-10');
INSERT INTO lig_cmd (lcd_cmd,lcd_art,lcd_qte,lcd_liv,lcd_pu,lcd_dateliv) VALUES ('C9404','A15',8,0,4,'2012-06-10');
INSERT INTO lig_cmd (lcd_cmd,lcd_art,lcd_qte,lcd_liv,lcd_pu,lcd_dateliv) VALUES ('C9404','A05',1,0,149,'2012-06-10');
INSERT INTO lig_cmd (lcd_cmd,lcd_art,lcd_qte,lcd_liv,lcd_pu,lcd_dateliv) VALUES ('C9405','A06',1,1,149,'2012-06-06');
INSERT INTO lig_cmd (lcd_cmd,lcd_art,lcd_qte,lcd_liv,lcd_pu,lcd_dateliv) VALUES ('C9405','A08',1,1,200,'2012-06-06');
INSERT INTO lig_cmd (lcd_cmd,lcd_art,lcd_qte,lcd_liv,lcd_pu,lcd_dateliv) VALUES ('C9406','A10',1,1,2,'2012-06-07');
INSERT INTO lig_cmd (lcd_cmd,lcd_art,lcd_qte,lcd_liv,lcd_pu,lcd_dateliv) VALUES ('C9407','A07',1,0,149,'2012-06-10');
INSERT INTO lig_cmd (lcd_cmd,lcd_art,lcd_qte,lcd_liv,lcd_pu,lcd_dateliv) VALUES ('C9408','A01',1,1,29,'2012-06-08');
INSERT INTO lig_cmd (lcd_cmd,lcd_art,lcd_qte,lcd_liv,lcd_pu,lcd_dateliv) VALUES ('C9409','A12',3,1,5,'2012-06-08');
INSERT INTO lig_cmd (lcd_cmd,lcd_art,lcd_qte,lcd_liv,lcd_pu,lcd_dateliv) VALUES ('C9409','A13',3,1,5,'2012-06-08');
INSERT INTO lig_cmd (lcd_cmd,lcd_art,lcd_qte,lcd_liv,lcd_pu,lcd_dateliv) VALUES ('C9409','A14',3,1,5,'2012-06-08');
INSERT INTO lig_cmd (lcd_cmd,lcd_art,lcd_qte,lcd_liv,lcd_pu,lcd_dateliv) VALUES ('C9409','A15',3,1,5,'2012-06-08');
INSERT INTO lig_cmd (lcd_cmd,lcd_art,lcd_qte,lcd_liv,lcd_pu,lcd_dateliv) VALUES ('C9410','A12',8,8,5,'2012-06-08');
INSERT INTO lig_cmd (lcd_cmd,lcd_art,lcd_qte,lcd_liv,lcd_pu,lcd_dateliv) VALUES ('C9410','A14',8,8,5,'2012-06-08');
INSERT INTO lig_cmd (lcd_cmd,lcd_art,lcd_qte,lcd_liv,lcd_pu,lcd_dateliv) VALUES ('C9411','A09',1,0,250,'2012-06-14');
INSERT INTO lig_cmd (lcd_cmd,lcd_art,lcd_qte,lcd_liv,lcd_pu,lcd_dateliv) VALUES ('C9411','A15',5,5,5,'2012-06-09');
INSERT INTO lig_cmd (lcd_cmd,lcd_art,lcd_qte,lcd_liv,lcd_pu,lcd_dateliv) VALUES ('C9412','A03',1,0,30,'2012-06-15');


----------------------------------------------------------------------------------
--
--                              lig_liv
--
----------------------------------------------------------------------------------
INSERT INTO lig_liv (llv_liv,llv_art,llv_qte,llv_cmd) VALUES ('L9401','A04',1,'C9401');
INSERT INTO lig_liv (llv_liv,llv_art,llv_qte,llv_cmd) VALUES ('L9402','A10',1,'C9402');
INSERT INTO lig_liv (llv_liv,llv_art,llv_qte,llv_cmd) VALUES ('L9402','A11',2,'C9402');
INSERT INTO lig_liv (llv_liv,llv_art,llv_qte,llv_cmd) VALUES ('L9402','A14',3,'C9402');
INSERT INTO lig_liv (llv_liv,llv_art,llv_qte,llv_cmd) VALUES ('L9403','A02',1,'C9403');
INSERT INTO lig_liv (llv_liv,llv_art,llv_qte,llv_cmd) VALUES ('L9403','A03',2,'C9403');
INSERT INTO lig_liv (llv_liv,llv_art,llv_qte,llv_cmd) VALUES ('L9403','A15',5,'C9403');
INSERT INTO lig_liv (llv_liv,llv_art,llv_qte,llv_cmd) VALUES ('L9403','A14',1,'C9403');
INSERT INTO lig_liv (llv_liv,llv_art,llv_qte,llv_cmd) VALUES ('L9403','A13',1,'C9403');
INSERT INTO lig_liv (llv_liv,llv_art,llv_qte,llv_cmd) VALUES ('L9404','A06',1,'C9405');
INSERT INTO lig_liv (llv_liv,llv_art,llv_qte,llv_cmd) VALUES ('L9404','A08',1,'C9405');
INSERT INTO lig_liv (llv_liv,llv_art,llv_qte,llv_cmd) VALUES ('L9405','A10',1,'C9406');
INSERT INTO lig_liv (llv_liv,llv_art,llv_qte,llv_cmd) VALUES ('L9406','A01',1,'C9408');
INSERT INTO lig_liv (llv_liv,llv_art,llv_qte,llv_cmd) VALUES ('L9407','A12',1,'C9409');
INSERT INTO lig_liv (llv_liv,llv_art,llv_qte,llv_cmd) VALUES ('L9407','A13',1,'C9409');
INSERT INTO lig_liv (llv_liv,llv_art,llv_qte,llv_cmd) VALUES ('L9407','A14',1,'C9409');
INSERT INTO lig_liv (llv_liv,llv_art,llv_qte,llv_cmd) VALUES ('L9407','A15',1,'C9409');
INSERT INTO lig_liv (llv_liv,llv_art,llv_qte,llv_cmd) VALUES ('L9408','A12',8,'C9410');
INSERT INTO lig_liv (llv_liv,llv_art,llv_qte,llv_cmd) VALUES ('L9408','A14',8,'C9410');
INSERT INTO lig_liv (llv_liv,llv_art,llv_qte,llv_cmd) VALUES ('L9409','A15',5,'C9411');


----------------------------------------------------------------------------------
--
--                              LIVRAISON
--
----------------------------------------------------------------------------------
INSERT INTO livraison (liv_num,liv_date,liv_clt,liv_mag) VALUES ('L9401','2012-06-06','C07','M03');
INSERT INTO livraison (liv_num,liv_date,liv_clt,liv_mag) VALUES ('L9402','2012-06-06','C06','M12');
INSERT INTO livraison (liv_num,liv_date,liv_clt,liv_mag) VALUES ('L9403','2012-06-06','C13','M01');
INSERT INTO livraison (liv_num,liv_date,liv_clt,liv_mag) VALUES ('L9404','2012-06-06','C08','M11');
INSERT INTO livraison (liv_num,liv_date,liv_clt,liv_mag) VALUES ('L9405','2012-06-06','C05','M04');
INSERT INTO livraison (liv_num,liv_date,liv_clt,liv_mag) VALUES ('L9406','2012-06-06','C03','M12');
INSERT INTO livraison (liv_num,liv_date,liv_clt,liv_mag) VALUES ('L9407','2012-06-08','C10','M11');
INSERT INTO livraison (liv_num,liv_date,liv_clt,liv_mag) VALUES ('L9408','2012-06-08','C01','M11');
INSERT INTO livraison (liv_num,liv_date,liv_clt,liv_mag) VALUES ('L9409','2012-06-09','C12','M01');


----------------------------------------------------------------------------------
--
--                              MAGASIN
--
----------------------------------------------------------------------------------
INSERT INTO magasin (mag_num,mag_loc,mag_ger) VALUES ('M01','PARIS 5','BERTON Louis');
INSERT INTO magasin (mag_num,mag_loc,mag_ger) VALUES ('M02','PARIS 10','JANNEAU Luc');
INSERT INTO magasin (mag_num,mag_loc,mag_ger) VALUES ('M03','LYON','MOUILLARD Marcel');
INSERT INTO magasin (mag_num,mag_loc,mag_ger) VALUES ('M04','MARSEILLE','CAMUS Marius');
INSERT INTO magasin (mag_num,mag_loc,mag_ger) VALUES ('M05','MONTPELLIER','BAIJOT Marc');
INSERT INTO magasin (mag_num,mag_loc,mag_ger) VALUES ('M06','BORDEAUX','DETIENNE Nicole');
INSERT INTO magasin (mag_num,mag_loc,mag_ger) VALUES ('M07','NANTES','DUMONT Henri');
INSERT INTO magasin (mag_num,mag_loc,mag_ger) VALUES ('M08','TOURS','DEMARTEAU Renée');
INSERT INTO magasin (mag_num,mag_loc,mag_ger) VALUES ('M09','ROUEN','NOSSENT Daniel');
INSERT INTO magasin (mag_num,mag_loc,mag_ger) VALUES ('M10','LILLE','NIZET Jean-Luc');
INSERT INTO magasin (mag_num,mag_loc,mag_ger) VALUES ('M11','BRUXELLES','VANDERSMISSEN Fernand');
INSERT INTO magasin (mag_num,mag_loc,mag_ger) VALUES ('M12','LIEGE','HANNEAU Vincent');






-- ajout des contraintes pour les clés étrangères
--ALTER TABLE chauffeur_vehicule ADD CONSTRAINT FK_chauffeur_vehicule_vehicule 
--	FOREIGN KEY (numVehicule) REFERENCES vehicule (numVehicule) 
--	;

ALTER TABLE article  ADD  CONSTRAINT FK_article_fournisseur FOREIGN KEY(art_frs)
REFERENCES fournisseur (frs_num)
ON DELETE CASCADE
GO

ALTER TABLE commande  ADD  CONSTRAINT FK_commande_client FOREIGN KEY(cmd_clt)
REFERENCES client (clt_num)
ON UPDATE CASCADE
GO

ALTER TABLE lig_cmd  ADD  CONSTRAINT FK_lig_cmd_article FOREIGN KEY(lcd_art)
REFERENCES article (art_num)
ON DELETE CASCADE
GO

ALTER TABLE lig_cmd  ADD  CONSTRAINT FK_lig_cmd_commande FOREIGN KEY(lcd_cmd)
REFERENCES commande (cmd_num)
GO

ALTER TABLE lig_liv  ADD  CONSTRAINT FK_lig_liv_commande FOREIGN KEY(llv_cmd)
REFERENCES commande (cmd_num)
GO

ALTER TABLE lig_liv  ADD  CONSTRAINT FK_lig_liv_livraison FOREIGN KEY(llv_liv)
REFERENCES livraison (liv_num)
GO

ALTER TABLE livraison  ADD  CONSTRAINT FK_livraison_client FOREIGN KEY(liv_clt)
REFERENCES client (clt_num)
ON UPDATE CASCADE
GO

ALTER TABLE livraison  ADD  CONSTRAINT FK_livraison_magasin FOREIGN KEY(liv_mag)
REFERENCES magasin (mag_num)
GO

