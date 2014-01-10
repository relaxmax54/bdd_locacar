CREATE VIEW info_car AS
	SELECT v.num_immatriculation , v.id_agence, a.id_ville, t.prix_km, c.id_categorie
	FROM VEHICULES v, AGENCES a, TARIFS t, CATEGORIES c
	GROUP BY a.id_ville, v.id_agence, c.id_categorie, v.num_immatriculation, t.prix_km;