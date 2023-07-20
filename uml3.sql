/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  20/07/2023 09:59:25                      */
/*==============================================================*/


drop table if exists clients;

drop table if exists couture;

drop table if exists depenses_entreprise;

drop table if exists mesure;

drop table if exists modele;

drop table if exists payements;

drop table if exists personnel;

drop table if exists rendez_vous;

drop table if exists roles;

/*==============================================================*/
/* Table : clients                                              */
/*==============================================================*/
create table clients
(
   id_clients           int not null,
   id_rendvous          int not null,
   id_mesure            int not null,
   id_couture           int not null,
   id_payement          int not null,
   nom                  varchar(254),
   genre                varchar(254),
   adresse              varchar(254),
   telephone            int,
   primary key (id_clients),
   key AK_Identifiant_1 (id_clients)
);

/*==============================================================*/
/* Table : couture                                              */
/*==============================================================*/
create table couture
(
   id_couture           int not null,
   id_mode              int not null,
   nom                  varchar(254),
   atelier              varchar(254),
   date_lancement       datetime,
   primary key (id_couture)
);

/*==============================================================*/
/* Table : depenses_entreprise                                  */
/*==============================================================*/
create table depenses_entreprise
(
   id_depenses          int not null,
   description          varchar(254),
   montant              int,
   date_pyteffectue     datetime,
   primary key (id_depenses),
   key AK_Identifiant_1 (id_depenses)
);

/*==============================================================*/
/* Table : mesure                                               */
/*==============================================================*/
create table mesure
(
   id_mesure            int not null,
   tour_taille          numeric(8,0),
   tour_epaules         numeric(8,0),
   tour_pointrine       numeric(8,0),
   tour_hanches         numeric(8,0),
   hauteur_epaules      numeric(8,0),
   longueur_bras        numeric(8,0),
   hauteur_hanches      numeric(8,0),
   longueur_finie       numeric(8,0),
   prix_couture         int,
   telephone            int,
   primary key (id_mesure)
);

/*==============================================================*/
/* Table : modele                                               */
/*==============================================================*/
create table modele
(
   id_mode              int not null,
   nom                  varchar(254),
   description          varchar(254),
   primary key (id_mode)
);

/*==============================================================*/
/* Table : payements                                            */
/*==============================================================*/
create table payements
(
   id_payement          int not null,
   id_personnel         int,
   date_payement        datetime,
   mode_paiement        int,
   primary key (id_payement)
);

/*==============================================================*/
/* Table : personnel                                            */
/*==============================================================*/
create table personnel
(
   id_personnel         int not null,
   id_depenses          int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   genre                varchar(254),
   adresse              varchar(254),
   telephone            varchar(254),
   primary key (id_personnel)
);

/*==============================================================*/
/* Table : rendez_vous                                          */
/*==============================================================*/
create table rendez_vous
(
   id_rendvous          int not null,
   nom                  varchar(254),
   avance_prix          int,
   reste_montant        int,
   montant_solde        int,
   date_rendezvous      datetime,
   primary key (id_rendvous)
);

/*==============================================================*/
/* Table : roles                                                */
/*==============================================================*/
create table roles
(
   id_role              int not null,
   nom                  varchar(254),
   utilisateur          varchar(254),
   administrateur       varchar(254),
   primary key (id_role)
);

alter table clients add constraint FK_Association_10 foreign key (id_payement)
      references payements (id_payement) on delete restrict on update restrict;

alter table clients add constraint FK_Association_6 foreign key (id_rendvous)
      references rendez_vous (id_rendvous) on delete restrict on update restrict;

alter table clients add constraint FK_Association_7 foreign key (id_mesure)
      references mesure (id_mesure) on delete restrict on update restrict;

alter table clients add constraint FK_Association_9 foreign key (id_couture)
      references couture (id_couture) on delete restrict on update restrict;

alter table couture add constraint FK_Association_8 foreign key (id_mode)
      references modele (id_mode) on delete restrict on update restrict;

alter table personnel add constraint FK_Association_4 foreign key (id_depenses)
      references depenses_entreprise (id_depenses) on delete restrict on update restrict;

