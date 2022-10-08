/*SUPPRESSION DE TOUTE LES TABLES POUR LES RE-CREER JUSTE ENSUITE POUR EVITER LES ERREURS*/
DROP TABLE Produit CASCADE;
DROP TABLE Client CASCADE;
DROP TABLE Fournisseur CASCADE;
DROP TABLE fourni CASCADE;
DROP TABLE acheter CASCADE;
DROP TABLE Magasin CASCADE;
DROP TABLE Stock CASCADE;
DROP TABLE Fidelite CASCADE;



/*CREATION DES TABLES SQL DE LA SAE*/


CREATE TABLE Client(
	idClient char(4) PRIMARY KEY,
	nom varchar(30) NOT NULL,
	prenom varchar(30) NOT NULL,
	mail varchar(40) NOT NULL,
	tel varchar(10),
	pays varchar(30) NOT NULL,
	codePostal varchar(30) CHECK(codePostal LIKE '__000')
	);
CREATE TABLE Produit(
	idProduit char(4) PRIMARY KEY,
	designation varchar(30) NOT NULL,
	modele varchar(30) NOT NULL,
	couleur varchar(30) NOT NULL,
	prix numeric(8,2) NOT NULL
	);
CREATE TABLE Fournisseur(
	idFournisseur char(4) PRIMARY KEY,
	numTel varchar(15) NOT NULL,
	designation varchar(30) 
	);
CREATE TABLE fourni(
	idProduit char(4) REFERENCES Produit(idProduit),
	idFournisseur char(4) REFERENCES Fournisseur(idFournisseur),
	quantité numeric(5) NOT NULL,
	PRIMARY KEY(idProduit,idFournisseur)
	);


CREATE  TABLE Magasin(
	idMagasin char(4) PRIMARY KEY,
	rue varchar(30) NOT NULL,
	numero varchar(10) NOT NULL,
	ville varchar(30) NOT NULL,
	codePostal numeric(5) NOT NULL,
	designation varchar(30) NOT NULL
	);

CREATE TABLE acheter (
	idClient char(4) REFERENCES Client(idClient),
	idProduit char(4) REFERENCES Produit(idProduit),
	idMagasin char(4) REFERENCES Magasin(idMagasin),
	typeAchat varchar(30) CHECK (typeAchat LIKE 'En Ligne' OR typeAchat LIKE 'En Magasin') NOT NULL,
	dateAchat date NOT NULL CHECK (dateAchat-CURRENT_DATE<0),
	heure char(5) CHECK (heure LIKE '__h__'),
	PRIMARY KEY(idClient,idProduit)
	);

CREATE TABLE Stock(
	idMagasin char(4) REFERENCES Magasin(idMagasin),
	idProduit char(4) REFERENCES Produit(idProduit),
	quantite numeric(10) NOT NULL,
	PRIMARY KEY (idProduit,idMagasin)
	);

CREATE TABLE Fidelite(
	idCompte char(4) REFERENCES Client(idClient),
	pointFidelite numeric(5),
	dateCreation date NOT NULL,
	PRIMARY KEY (idCompte)
	);


/*REMPLISSAGE DES TABLES SQL DE LA SAE*/


INSERT INTO Produit VALUES ('0001','iPhone','13 Pro','Bleu Alpin',1200);
INSERT INTO Produit VALUES ('0002','iPhone','13 Pro','Graphite',1200);
INSERT INTO Produit VALUES ('0003','iPhone','13 Pro','Or',1200);
INSERT INTO Produit VALUES ('0004','iPhone','13','Rose',900);
INSERT INTO Produit VALUES ('0005','iPhone','13','Minuit',900);
INSERT INTO Produit VALUES ('0006','iPhone','13','Lumière Stélaire',900);
INSERT INTO Produit VALUES ('0007','iPhone','12 Mini','Rouge',500);
INSERT INTO Produit VALUES ('0008','iPhone','12 Mini','Gris Sidéral',500);
INSERT INTO Produit VALUES ('0009','iPhone','12 Mini','Blanc',500);
INSERT INTO Produit VALUES ('0010','iPhone','12','Rouge',700);
INSERT INTO Produit VALUES ('0011','iPhone','12','Gris Sidéral',700);
INSERT INTO Produit VALUES ('0012','iPhone','12','Blanc',700);
INSERT INTO Produit VALUES ('0013','iPad','Air','Or Rose',650);
INSERT INTO Produit VALUES ('0014','iPad','Air','Gris Sidéral',650);
INSERT INTO Produit VALUES ('0015','iPad','Air','Bleu Ciel',650);
INSERT INTO Produit VALUES ('0016','iPad','Pro','Gris Sidéral',900);
INSERT INTO Produit VALUES ('0017','iPad','Pro','Rose',900);
INSERT INTO Produit VALUES ('0018','iPad','Pro','Rouge',900);
INSERT INTO Produit VALUES ('0019','AirPods','Pro','Blanc',200);
INSERT INTO Produit VALUES ('0020','AirPods','Pro Max','Blanc',600);
INSERT INTO Produit VALUES ('0021','AirPods','Pro Max','Noir',600);
INSERT INTO Produit VALUES ('0022','Apple Watch','Series 3','Noir',200);
INSERT INTO Produit VALUES ('0023','Apple Watch','Series 3','Blanc',200);
INSERT INTO Produit VALUES ('0024','Apple Watch','SE','Violet',300);
INSERT INTO Produit VALUES ('0025','Apple Watch','SE','Jaune',300);
INSERT INTO Client VALUES ('0001','ARNAL','Rémi','remi.ARNAL@etu.uca.fr','0763464060','Louganda');
INSERT INTO Client VALUES ('0002','ASTOLFI','Vincent','vincent.ASTOLFI@etu.uca.fr','0658422644','France','12000');
INSERT INTO Client VALUES ('0003','BENBOULERBAH','Billel','billel.BENBOULERBAH@etu.uca.fr','0661129591','Algérie');
INSERT INTO Client VALUES ('0004','JAULT','Aurian','aurian.JAULT@etu.uca.fr','0784952685','France','81000');
INSERT INTO Client VALUES ('0005','CASALS','Jules','jules.CASALS@etu.uca.fr','0786519188','Estonie');
INSERT INTO Client VALUES ('0006','JAQUELIN','Bastien','bastien.JAQUELIN@etu.uca.fr','0652423311','Kazakhstan');
INSERT INTO Client VALUES ('0007','DE LA FUENTE','Axel','axel.DELAFUENTE@etu.uca.fr','0782996102','France','63000');
INSERT INTO Client VALUES ('0008','MIELKARECH','Félix','félix.MIELKARECH@etu.uca.fr','0769876409','France','63000');
INSERT INTO Client VALUES ('0009','LABORIE','Louis','louis.LABORIE@etu.uca.fr','0782988434','Longola');
INSERT INTO Client VALUES ('0010','PIMPAUD','Oscar','oscar.PIMPAUD@etu.uca.fr','0647246556','France','45000');
INSERT INTO Client VALUES ('0011','FAGES','Tony','tony.FAGES@etu.uca.fr','0787555691','France','12000');
INSERT INTO Client VALUES ('0012','LACOTE','Raphael','raphael.LACOTE@etu.uca.fr','0767474030','Espagne');
INSERT INTO Client VALUES ('0013','RAYSSAC','Mathys','mathys.RAYSSAC@etu.uca.fr','0786894037','France','63000');
INSERT INTO Client VALUES ('0014','HODIN','Dorian','dorian.HODIN@etu.uca.fr','0783769671','Allemagne');
INSERT INTO Fournisseur VALUES ('0001','+33 452189635','Apple France');
INSERT INTO Fournisseur VALUES ('0002','+1 24678923','Apple Unites States');
INSERT INTO Fournisseur VALUES ('0003','+49 56781203','Apple Deutschland');
INSERT INTO Fournisseur VALUES ('0004','+86 14578269','Apple 中國');
INSERT INTO Fournisseur VALUES ('0005','+81 78964215','Apple 日本');
INSERT INTO Magasin VALUES ('0001','Rue des petits pains','12 Bis','Landemont',49270,'Apple Store');
INSERT INTO Magasin VALUES ('0002','Rue des potiers','42','Lyon',69001,'Orange');
INSERT INTO Magasin VALUES ('0003','Rue du cassoulet','560','Paris',49270,'Apple Store');
INSERT INTO fourni VALUES ('0001','0002',200);
INSERT INTO fourni VALUES ('0002','0002',200);
INSERT INTO fourni VALUES ('0003','0002',200);
INSERT INTO fourni VALUES ('0020','0005',85);
INSERT INTO fourni VALUES ('0021','0005',90);
INSERT INTO Fidelite VALUES ('0001',50,'14/02/2019');
INSERT INTO Fidelite VALUES ('0003',150,'18/10/2018');
INSERT INTO Fidelite VALUES ('0005',125,'01/06/2020');
INSERT INTO Fidelite VALUES ('0009',250,'30/01/2016');
INSERT INTO Fidelite VALUES ('0012',25,'20/03/2019');
INSERT INTO Fidelite VALUES ('0013',300,'15/02/2021');
INSERT INTO Stock VALUES ('0001','0001',20);
INSERT INTO Stock VALUES ('0001','0002',20);
INSERT INTO Stock VALUES ('0001','0003',20);
INSERT INTO Stock VALUES ('0001','0004',15);
INSERT INTO Stock VALUES ('0001','0005',15);
INSERT INTO Stock VALUES ('0001','0006',15);
INSERT INTO Stock VALUES ('0001','0007',40);
INSERT INTO Stock VALUES ('0001','0008',40);
INSERT INTO Stock VALUES ('0001','0009',40);
INSERT INTO Stock VALUES ('0001','0010',35);
INSERT INTO Stock VALUES ('0001','0011',35);
INSERT INTO Stock VALUES ('0001','0012',35);
INSERT INTO Stock VALUES ('0001','0013',10);
INSERT INTO Stock VALUES ('0001','0014',10);
INSERT INTO Stock VALUES ('0001','0015',10);
INSERT INTO Stock VALUES ('0001','0016',15);
INSERT INTO Stock VALUES ('0001','0017',15);
INSERT INTO Stock VALUES ('0001','0018',15);
INSERT INTO Stock VALUES ('0001','0019',100);
INSERT INTO Stock VALUES ('0001','0020',25);
INSERT INTO Stock VALUES ('0001','0021',25);
INSERT INTO Stock VALUES ('0001','0022',10);
INSERT INTO Stock VALUES ('0001','0023',10);
INSERT INTO Stock VALUES ('0001','0024',15);
INSERT INTO Stock VALUES ('0001','0025',15);
INSERT INTO Stock VALUES ('0002','0001',40);
INSERT INTO Stock VALUES ('0002','0002',40);
INSERT INTO Stock VALUES ('0002','0003',40);
INSERT INTO Stock VALUES ('0002','0004',30);
INSERT INTO Stock VALUES ('0002','0005',30);
INSERT INTO Stock VALUES ('0002','0006',30);
INSERT INTO Stock VALUES ('0002','0007',80);
INSERT INTO Stock VALUES ('0002','0008',80);
INSERT INTO Stock VALUES ('0002','0009',80);
INSERT INTO Stock VALUES ('0002','0010',35);
INSERT INTO Stock VALUES ('0002','0011',35);
INSERT INTO Stock VALUES ('0002','0012',35);
INSERT INTO Stock VALUES ('0002','0013',20);
INSERT INTO Stock VALUES ('0002','0014',20);
INSERT INTO Stock VALUES ('0002','0015',20);
INSERT INTO Stock VALUES ('0002','0016',30);
INSERT INTO Stock VALUES ('0002','0017',30);
INSERT INTO Stock VALUES ('0002','0018',30);
INSERT INTO Stock VALUES ('0002','0019',150);
INSERT INTO Stock VALUES ('0002','0020',50);
INSERT INTO Stock VALUES ('0002','0021',50);
INSERT INTO Stock VALUES ('0002','0022',20);
INSERT INTO Stock VALUES ('0002','0023',20);
INSERT INTO Stock VALUES ('0002','0024',30);
INSERT INTO Stock VALUES ('0002','0025',30);
INSERT INTO Stock VALUES ('0003','0001',50);
INSERT INTO Stock VALUES ('0003','0002',50);
INSERT INTO Stock VALUES ('0003','0003',50);
INSERT INTO Stock VALUES ('0003','0004',40);
INSERT INTO Stock VALUES ('0003','0005',40);
INSERT INTO Stock VALUES ('0003','0006',40);
INSERT INTO Stock VALUES ('0003','0007',100);
INSERT INTO Stock VALUES ('0003','0008',100);
INSERT INTO Stock VALUES ('0003','0009',100);
INSERT INTO Stock VALUES ('0003','0010',80);
INSERT INTO Stock VALUES ('0003','0011',80);
INSERT INTO Stock VALUES ('0003','0012',80);
INSERT INTO Stock VALUES ('0003','0013',40);
INSERT INTO Stock VALUES ('0003','0014',40);
INSERT INTO Stock VALUES ('0003','0015',40);
INSERT INTO Stock VALUES ('0003','0016',50);
INSERT INTO Stock VALUES ('0003','0017',50);
INSERT INTO Stock VALUES ('0003','0018',50);
INSERT INTO Stock VALUES ('0003','0019',250);
INSERT INTO Stock VALUES ('0003','0020',50);
INSERT INTO Stock VALUES ('0003','0021',50);
INSERT INTO Stock VALUES ('0003','0022',40);
INSERT INTO Stock VALUES ('0003','0023',40);
INSERT INTO Stock VALUES ('0003','0024',50);
INSERT INTO Stock VALUES ('0003','0025',50);
INSERT INTO acheter VALUES ('0001','0019','0002','En Ligne','01/10/2021','14h55');
INSERT INTO acheter VALUES ('0001','0014','0002','En Ligne','06/10/2021','18h30');
INSERT INTO acheter VALUES ('0002','0007','0003','En Magasin','15/08/2021','09h12');
INSERT INTO acheter VALUES ('0002','0025','0003','En Ligne','24/03/2021','14h55');
INSERT INTO acheter VALUES ('0003','0001','0001','En Magasin','12/11/2021','10h54');
INSERT INTO acheter VALUES ('0004','0003','0002','En Ligne','09/12/2021','07h22');
INSERT INTO acheter VALUES ('0005','0023','0001','En Ligne','17/10/2021','15h14');
INSERT INTO acheter VALUES ('0008','0012','0003','En Magasin','08/12/2021','23h52');
INSERT INTO acheter VALUES ('0008','0001','0003','En Magasin','08/12/2021','23h54');
INSERT INTO acheter VALUES ('0009','0006','0002','En Magasin','27/11/2021','19h36');
INSERT INTO acheter VALUES ('0009','0012','0002','En Magasin','17/02/2020','14h23');
INSERT INTO acheter VALUES ('0011','0002','0001','En Ligne','06/07/2021','21h21');
INSERT INTO acheter VALUES ('0012','0003','0003','En Ligne','08/09/2020','02h05');
INSERT INTO acheter VALUES ('0012','0016','0003','En Magasin','18/03/2021','06h51');
INSERT INTO acheter VALUES ('0013','0004','0002','En Magasin','09/12/2021','07h36');
INSERT INTO acheter VALUES ('0013','0022','0002','En Magasin','09/12/2021','07h37');

/*AFFICHAGE DES TABLES DE LA SAE (dé-commenter pour voir)*/

/*
SELECT * FROM Produit;

SELECT * FROM Client ORDER BY nom;

SELECT * FROM Fournisseur;

SELECT * FROM Magasin;

SELECT * FROM fourni;

SELECT * FROM Fidelite;

SELECT * FROM Stock WHERE idMagasin LIKE '0001';

SELECT * FROM Stock WHERE idMagasin LIKE '0002';

SELECT * FROM Stock WHERE idMagasin LIKE '0003';

SELECT * FROM acheter;
*/



/*REQUETES SQL SUR LES TABLES DE LA SAE*/


/*1-Liste des produits non achetés*/

SELECT DISTINCT *
FROM Produit
WHERE idProduit NOT LIKE ALL(SELECT idProduit FROM acheter) ORDER BY idProduit;


/*2-Action commerciale sur clients Auvergnats*/

SELECT COUNT(c.*) AS Commandes_Auvergnoises_Après_l_Action_Commerciale
FROM acheter a, Client c
WHERE c.idClient LIKE a.idClient AND codePostal LIKE '63000' AND (CURRENT_DATE-a.dateAchat)<7;


/*3-Liste des client qui n'ont pas faiut d'achat*/

SELECT DISTINCT *
FROM Client
WHERE idClient NOT LIKE ALL(SELECT idClient FROM acheter);

/*4-Liste montant en focntion des pays et continent*/

SELECT SUM(p.prix) AS Somme_Achat_Client_Français
FROM Produit p, acheter a, Client c
WHERE p.idProduit LIKE a.idProduit AND a.idClient LIKE c.idClient AND c.pays LIKE 'France';


SELECT SUM(p.prix) AS Somme_Achat_Client_Etranger_Hors_UE
FROM Produit p, acheter a, Client c
WHERE p.idProduit LIKE a.idProduit AND a.idClient LIKE c.idClient 
/*Liste des pays européens pour savoir les clients hors Union Européenne*/
AND c.pays NOT LIKE 'Allemagne'
AND c.pays NOT LIKE 'Autriche'
AND c.pays NOT LIKE 'Belgique'
AND c.pays NOT LIKE 'Bulgarie'
AND c.pays NOT LIKE 'Chypre'
AND c.pays NOT LIKE 'Croatie'
AND c.pays NOT LIKE 'Danemark'
AND c.pays NOT LIKE 'Espagne'
AND c.pays NOT LIKE 'Estonie'
AND c.pays NOT LIKE 'Finlande'
AND c.pays NOT LIKE 'France'
AND c.pays NOT LIKE 'Grèce'
AND c.pays NOT LIKE 'Hongrie'
AND c.pays NOT LIKE 'Irlande'
AND c.pays NOT LIKE 'Italie'
AND c.pays NOT LIKE 'Lettonie'
AND c.pays NOT LIKE 'Lituanie'
AND c.pays NOT LIKE 'Luxembourg'
AND c.pays NOT LIKE 'Malte'
AND c.pays NOT LIKE 'Pays-Bas'
AND c.pays NOT LIKE 'Pologne'
AND c.pays NOT LIKE 'Portugal'
AND c.pays NOT LIKE 'République tchèque'
AND c.pays NOT LIKE 'Roumanie'
AND c.pays NOT LIKE 'Slovaquie'
AND c.pays NOT LIKE 'Slovénie'
AND c.pays NOT LIKE 'Suède';

SELECT SUM(p.prix) AS Somme_Achat_Client_Etranger_Dans_UE
FROM Produit p, acheter a, Client c
WHERE p.idProduit LIKE a.idProduit AND a.idClient LIKE c.idClient 
/*Liste des pays européens pour savoir les clients dans Union Européenne mais pas en France*/
AND c.pays NOT LIKE 'France'
AND (c.pays LIKE 'Allemagne'
OR c.pays LIKE 'Autriche'
OR c.pays LIKE 'Belgique'
OR c.pays LIKE 'Bulgarie'
OR c.pays LIKE 'Chypre'
OR c.pays LIKE 'Croatie'
OR c.pays LIKE 'Danemark'
OR c.pays LIKE 'Espagne'
OR c.pays LIKE 'Estonie'
OR c.pays LIKE 'Finlande'
OR c.pays LIKE 'Grèce'
OR c.pays LIKE 'Hongrie'
OR c.pays LIKE 'Irlande'
OR c.pays LIKE 'Italie'
OR c.pays LIKE 'Lettonie'
OR c.pays LIKE 'Lituanie'
OR c.pays LIKE 'Luxembourg'
OR c.pays LIKE 'Malte'
OR c.pays LIKE 'Pays-Bas'
OR c.pays LIKE 'Pologne'
OR c.pays LIKE 'Portugal'
OR c.pays LIKE 'République tchèque'
OR c.pays LIKE 'Roumanie'
OR c.pays LIKE 'Slovaquie'
OR c.pays LIKE 'Slovénie'
OR c.pays LIKE 'Suède');