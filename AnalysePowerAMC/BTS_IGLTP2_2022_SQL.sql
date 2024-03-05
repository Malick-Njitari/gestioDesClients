/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  22/04/2023 11:44:12                      */
/*==============================================================*/


drop table if exists CLIENT;

drop table if exists COMMANDEPRODUIT;

drop table if exists CONCERNER;

drop table if exists PRODUIT;

/*==============================================================*/
/* Table : CLIENT                                               */
/*==============================================================*/
create table CLIENT
(
   IDCLIENT             int AUTO_INCREMENT not null,
   NOMCLIENT            varchar(50),
   PRENOMCLIENT         varchar(50),
   TELEPHONECLIENT      varchar(25),
   primary key (IDCLIENT)
);

/*==============================================================*/
/* Table : COMMANDEPRODUIT                                      */
/*==============================================================*/
create table COMMANDEPRODUIT
(
   REFERENCECOMMANDEPRODUIT varchar(25) not null,
   IDCLIENT             int not null,
   DATECOMMANDEPRODUIT  date,
   ADRESSELIVRAISONCOMMANDEPRODUIT varchar(50),
   primary key (REFERENCECOMMANDEPRODUIT)
);

/*==============================================================*/
/* Table : CONCERNER                                            */
/*==============================================================*/
create table CONCERNER
(
   REFERENCECOMMANDEPRODUIT varchar(25) not null,
   CODEPRODUIT          varchar(25) not null,
   QUANTITECOMMANDE     int,
   primary key (REFERENCECOMMANDEPRODUIT, CODEPRODUIT)
);

/*==============================================================*/
/* Table : PRODUIT                                              */
/*==============================================================*/
create table PRODUIT
(
   CODEPRODUIT          varchar(25) not null,
   LIBELLEPRODUIT       varchar(50),
   PRIXPRODUIT          int,
   primary key (CODEPRODUIT)
);

alter table COMMANDEPRODUIT add constraint FK_PASSER foreign key (IDCLIENT)
      references CLIENT (IDCLIENT) on delete restrict on update restrict;

alter table CONCERNER add constraint FK_CONCERNER foreign key (REFERENCECOMMANDEPRODUIT)
      references COMMANDEPRODUIT (REFERENCECOMMANDEPRODUIT) on delete restrict on update restrict;

alter table CONCERNER add constraint FK_CONCERNER2 foreign key (CODEPRODUIT)
      references PRODUIT (CODEPRODUIT) on delete restrict on update restrict;

