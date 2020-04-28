
Create database compagnie;
use compagnie;
CREATE USER 'ghaliak'@'localhost' IDENTIFIED BY 'Admin123';
GRANT ALL PRIVILEGES ON * . * TO 'ghaliak'@'localhost';
FLUSH PRIVILEGES;  



CREATE USER 'userg'@'localhost' IDENTIFIED BY '123456';
GRANT CREATE, SELECT ON * . * TO 'userg'@'localhost';
 


create table Client (
   codeclient           int                  not null,
   nom                  varchar(254)         null,
   adresse              varchar(254)         null,
   constraint PK_CLIENT primary key nonclustered (codeclient)
);

/*==============================================================*/
/* Table: Compagnie_aerienne                                    */
/*==============================================================*/
create table Compagnie_aerienne (
   Code_ca              int                  not null,
   Nom_ca               char(20)             not null,
   constraint PK_COMPAGNIE_AERIENNE primary key nonclustered (Code_ca)
);

/*==============================================================*/
/* Table: Reservation                                           */
/*==============================================================*/
create table Reservation (
   idRes                int                  not null,
   idVol                int                  not null,
   codeclient           int                  not null,
   date                 date             null,
   constraint PK_RESERVATION primary key nonclustered (idRes)
);

/*==============================================================*/
/* Index: ASSOCIATION_2_FK                                      */
/*==============================================================*/
create index ASSOCIATION_2_FK on Reservation (
idVol ASC
);

/*==============================================================*/
/* Index: REALISE_FK                                            */
/*==============================================================*/
create index REALISE_FK on Reservation (
codeclient ASC
);

/*==============================================================*/
/* Table: Vol                                                   */
/*==============================================================*/
create table Vol (
   idVol                int                  not null,
   Code_ca              int                  not null,
   Datedepart           date            null,
   Datearrivee          date             null,
   constraint PK_VOL primary key nonclustered (idVol)
);

/*==============================================================*/
/* Index: ASSOCIATION_1_FK                                      */
/*==============================================================*/
create index ASSOCIATION_1_FK on Vol (
Code_ca ASC
);

alter table Reservation
   add constraint FK_RESERVAT_ASSOCIATI_VOL foreign key (idVol)
      references Vol (idVol);

alter table Reservation
   add constraint FK_RESERVAT_REALISE_CLIENT foreign key (codeclient)
      references Client (codeclient);

alter table Vol
   add constraint FK_VOL_ASSOCIATI_COMPAGNI foreign key (Code_ca)
      references Compagnie_aerienne (Code_ca);



SELECT * from Vol;
SELECT * from Client;
SELECT * from Compagnie_aerienne;
SELECT * from Reservation;

INSERT INTO Client VALUES(1,'ghaliaaa','hdj ddk');
INSERT INTO Compagnie_aerienne VALUES(1,'comp'); 
INSERT INTO Vol VALUES(1,1,'2020-04-16','2020-04-16'); 
INSERT INTO Reservation VALUES(1,1,1,'2020-04-16'); 
INSERT INTO Client VALUES(2,'ghaliaaa','hdj ddk'); 
INSERT INTO Compagnie_aerienne VALUES(2,'comp'); 
INSERT INTO Vol VALUES(2,2,'2020-04-16','2020-04-16'); 
INSERT INTO Reservation VALUES(2,2,2,'2020-04-16'); 

UPDATE Client
SET nom='ghalia3'
WHERE codeclient=1;

UPDATE Vol
SET Datedepart ='2020-04-17'
WHERE idVol ='1';

UPDATE Compagnie_aerienne
SET Nom_ca='compagnieee'
WHERE Code_ca=1;

UPDATE Reservation
SET date='2020-04-30'
WHERE idRes=1;

DELETE FROM Reservation WHERE codeclient=2;
DELETE FROM Client WHERE codeclient=2;
DELETE FROM Vol WHERE Code_ca=2;
DELETE FROM Compagnie_aerienne WHERE Code_ca=2;