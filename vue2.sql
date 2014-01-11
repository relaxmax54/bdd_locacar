CREATE VIEW vue2 AS
	SELECT v.* , a.id_agence, c.id_categorie
	FROM VEHICULES v, AGENCES a, CATEGORIES c
	WHERE to_char(v.date_achat) like '2008'
	GROUP BY a.id_agence;