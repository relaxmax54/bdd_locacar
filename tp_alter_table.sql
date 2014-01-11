-- Definition des contraintes de CLES PRIMAIRES --

ALTER TABLE DOSSIERS 	ADD CONSTRAINT	dos_id_dossier_pk PRIMARY KEY (id_dossier);
ALTER TABLE CLIENTS 	ADD CONSTRAINT	clients_id_client_pk PRIMARY KEY (id_client);
ALTER TABLE VEHICULES 	ADD CONSTRAINT	vehicules_num_immat_pk PRIMARY KEY (num_immatriculation);
ALTER TABLE AGENCES 	ADD CONSTRAINT	agences_id_agence_pk PRIMARY KEY (id_agence);
ALTER TABLE PAIEMENTS 	ADD CONSTRAINT	paiements_id_paiement_pk PRIMARY KEY (id_paiement);
ALTER TABLE MODELES 	ADD CONSTRAINT	modeles_id_modele_pk PRIMARY KEY (id_modele);
ALTER TABLE MARQUES 	ADD CONSTRAINT	marques_id_marque_pk PRIMARY KEY (id_marque);
ALTER TABLE CATEGORIES 	ADD CONSTRAINT	categories_id_categorie_pk PRIMARY KEY (id_categorie);
ALTER TABLE TARIFS 		ADD CONSTRAINT	tarifs_id_tarif_pk PRIMARY KEY (id_tarif);
ALTER TABLE COULEURS 	ADD CONSTRAINT	couleurs_id_couleur_pk PRIMARY KEY (id_couleur);
ALTER TABLE PAYS 		ADD CONSTRAINT	pays_id_pays_pk PRIMARY KEY (id_pays);
ALTER TABLE VILLES 		ADD CONSTRAINT	villes_id_ville_pk PRIMARY KEY (id_ville);

-- Definition des contraintes de CLES ETRANGERES --

ALTER TABLE DOSSIERS 	ADD (
	CONSTRAINT	dos_id_client_fk FOREIGN KEY (id_client)
	REFERENCES	CLIENTS(id_client),
	CONSTRAINT	dos_id_ag_res_fk FOREIGN KEY (id_agence_reservation)
	REFERENCES	AGENCES(id_agence),
	CONSTRAINT	dos_id_ag_retrait_fk FOREIGN KEY (id_agence_retrait)
	REFERENCES	AGENCES(id_agence),
	CONSTRAINT	dos_id_ag_retour_fk FOREIGN KEY (id_agence_retour)
	REFERENCES	AGENCES(id_agence),
	CONSTRAINT	dos_num_immat_fk FOREIGN KEY (num_immatriculation)
	REFERENCES	VEHICULES(num_immatriculation),
	CONSTRAINT	dos_id_tarif_fk FOREIGN KEY (id_tarif)
	REFERENCES	TARIFS(id_tarif) 
	);	
ALTER TABLE CLIENTS 	ADD (
	CONSTRAINT	clients_id_ville_fk	FOREIGN KEY (id_ville)
	REFERENCES	VILLES(id_ville)
	);
ALTER TABLE VEHICULES 	ADD (
	CONSTRAINT	vehicules_id_modele_fk FOREIGN KEY (id_modele)
	REFERENCES	MODELES(id_modele),
	CONSTRAINT	vehicules_id_couleur_fk	FOREIGN KEY (id_couleur)
	REFERENCES	COULEURS(id_couleur),
	CONSTRAINT	vehicules_id_agence_fk	FOREIGN KEY (id_agence)
	REFERENCES	AGENCES(id_agence),
	);
ALTER TABLE AGENCES 	ADD	(
	CONSTRAINT	agences_id_ville_fk	FOREIGN KEY (id_ville)
	REFERENCES	VILLES(id_ville)
	);
ALTER TABLE PAIEMENTS 	ADD (
	CONSTRAINT	paiements_id_dossier_fk	FOREIGN KEY (id_dossier)
	REFERENCES	DOSSIERS(id_dossier)
	);
ALTER TABLE MODELES 	ADD (
	CONSTRAINT 	modeles_id_marque_fk FOREIGN KEY (id_marque)
	REFERENCES 	MARQUES(id_marque),
	CONSTRAINT	modeles_id_categorie_fk	FOREIGN KEY (id_categorie)
	REFERENCES	CATEGORIES(id_categorie),
	);
ALTER TABLE TARIFS 		ADD (
	CONSTRAINT	tarifs_id_categorie_fk	FOREIGN KEY (id_categorie)
	REFERENCES	CATEGORIES(id_categorie)
	);
ALTER TABLE VILLES 		ADD (	
	CONSTRAINT	villes_id_pays_fk	FOREIGN KEY	(id_pays)
	REFERENCES	PAYS(id_pays)
	);

-- Definition des contraintes de CHECK --

ALTER TABLE DOSSIERS 	ADD (
	CONSTRAINT	chk_dossiers_retour_theorique_after_retrait CHECK (date_retour_prevu > date_retrait),
	CONSTRAINT	chk_dossiers_retour_after_retrait CHECK (date_retour_effectif > date_retrait),
	CONSTRAINT	chk_dossiers_km_positif CHECK (km_arrivee > km_depart),
	CONSTRAINT	chk_dossiers_boolean_assurance CHECK (assurance_prise = UPPER('O') or assurance_prise = UPPER('N'))
	);		
ALTER TABLE PAIEMENTS 	ADD (
	CONSTRAINT	chk_paiements_montant_positif	CHECK (montant >= 0)
	);
ALTER TABLE CATEGORIES 	ADD (
	CONSTRAINT	chk_categories_prix_assurance_positif	CHECK (prix_assurance >= 0)
	);
ALTER TABLE TARIFS 		ADD (
	CONSTRAINT	chk_tarifs_prix_jour_positif	CHECK (prix_jour >= 0),
	CONSTRAINT	chk_tarifs_prix_km_positif	CHECK (prix_km >= 0)
	);

