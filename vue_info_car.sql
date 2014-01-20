CREATE OR REPLACE VIEW info_car AS
	SELECT v.num_immatriculation, v.id_agence, vi.nom, t.prix_km, c.id_categorie
	FROM VILLES vi, AGENCES a, VEHICULES v, MODELES mo, CATEGORIES c, TARIFS t
	WHERE vi.id_ville=a.id_ville
	AND a.id_agence=v.id_agence
	AND v.id_modele=mo.id_modele
	AND mo.id_categorie=c.id_categorie
	AND c.id_categorie=t.id_categorie
/