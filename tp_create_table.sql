	CREATE TABLE 	DOSSIERS (
	id_dossier		NUMBER(4),
	id_client		NUMBER(4),	
	id_agence_reservation	NUMBER(4),
	id_agence_retrait	NUMBER(4),
	id_agence_retour	NUMBER(4),
	num_immatriculation	VARCHAR2(7),
	id_tarif		NUMBER(4),
	date_retrait		DATE CONSTRAINT dos_date_retrait_nn NOT NULL,
	date_retour_prevu	DATE CONSTRAINT dos_date_retour_prevu_nn NOT NULL,
	date_retour_effectif	DATE CONSTRAINT dos_date_retour_effectif_nn NOT NULL,
	km_depart		NUMBER(6) CONSTRAINT dos_km_depart_nn NOT NULL,
	km_arrivee		NUMBER(6) CONSTRAINT dos_km_arrivee_nn NOT NULL,
	assurance_prise		CHAR(1) CONSTRAINT dos_assurance_prise_nn NOT NULL,
	montant_remise		NUMBER(6),
	pourcentage_remise	NUMBER(3) 	
	);


CREATE TABLE	CLIENTS (
	id_client	NUMBER(4),
	id_ville	VARCHAR2(7)  CONSTRAINT clients_id_ville_nn NOT NULL,
	nom		VARCHAR2(25) CONSTRAINT clients_nom_nn NOT NULL,
	prenom		VARCHAR2(25),
	adresse		VARCHAR2(255)	
	);


CREATE TABLE	VEHICULES (
	num_immatriculation	VARCHAR2(7),
	id_modele		NUMBER(2),
	id_couleur		NUMBER(3),	
	id_agence		NUMBER(4),
	date_achat		DATE CONSTRAINT vehicules_date_achat_nn NOT NULL,
	km_parcourus	NUMBER(6) CONSTRAINT vehicules_km_parcourus_nn NOT NULL
	);

	
CREATE TABLE	AGENCES (
	id_agence	NUMBER(4),
	id_ville	VARCHAR2(7),
	adresse		VARCHAR2(255),
	num_telephone	VARCHAR2(10),
	nom_responsable	VARCHAR2(50) CONSTRAINT agences_nom_responsable_nn NOT NULL
	);


CREATE TABLE	PAIEMENTS (
	id_paiement	NUMBER(4),
	id_dossier	NUMBER(4),
	date_paiement	DATE CONSTRAINT paiements_date_paiement_nn NOT NULL,
	montant		NUMBER(8,2) 
	);


CREATE TABLE 	MODELES (
	id_modele	NUMBER(2),
	id_marque	VARCHAR2(7),
	id_categorie	NUMBER(4),
	nom		VARCHAR2(20) CONSTRAINT modeles_nom_nn NOT NULL
	);


CREATE TABLE 	MARQUES (
	id_marque	VARCHAR2(7),
	nom		VARCHAR2(20) CONSTRAINT marques_nom_nn NOT NULL
	);


CREATE TABLE 	CATEGORIES (
	id_categorie	NUMBER(4),
	nom		VARCHAR2(20),
	capacite	NUMBER(2),
	type_permis	VARCHAR2(2),
	prix_assurance	NUMBER(6,2) 	
	);
	
CREATE TABLE 	TARIFS (
	id_tarif	NUMBER(4),
	id_categorie	NUMBER(4),
	nom		VARCHAR2(20),
	prix_jour	NUMBER(6,2) CONSTRAINT tarifs_prix_jour_nn NOT NULL,
	prix_forfait	NUMBER(6,2) CONSTRAINT tarifs_prix_forfait_nn NOT NULL,
	km_autorises	NUMBER(6)	CONSTRAINT tarifs_km_autorises_nn NOT NULL,
	prix_km	NUMBER(6,2)	CONSTRAINT tarifs_prix_km_nn NOT NULL
	);

CREATE TABLE	COULEURS (
	id_couleur	NUMBER(4),
	nom	VARCHAR2(20)
	);

CREATE TABLE	PAYS ( 
	id_pays	CHAR(2 BYTE),
	nom 	VARCHAR2(40 BYTE)
	);

CREATE TABLE	VILLES	 ( 
	id_ville	VARCHAR2(7),
	id_pays	CHAR(2 BYTE),
	nom 	VARCHAR2(40 BYTE),
	CP 	VARCHAR2(12 BYTE)
	);