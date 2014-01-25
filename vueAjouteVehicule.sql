CREATE OR REPLACE VIEW ajouteVehicule AS
	SELECT v.* , a.id_agence code_agence, c.id_categorie code_categ
	FROM AGENCES a, VEHICULES v, MODELES mo, CATEGORIES c
	WHERE a.id_agence=v.id_agence
	AND v.id_modele=mo.id_modele
	AND mo.id_categorie=c.id_categorie
	AND to_char(v.date_achat,'YYYY') like '2008'
/