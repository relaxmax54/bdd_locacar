CREATE OR REPLACE FUNCTION montantLocation(modeleVehicule IN NUMBER,joursDeLocation IN NUMBER) RETURN NUMBER IS
prixLocation NUMBER;
BEGIN
	IF (modeleVehicule IS NOT NULL) THEN
		select t.prix_jour INTO prixLocation
		from tarifs t, categories c, modeles mo
		where t.id_categorie=c.id_categorie
		and c.id_categorie=mo.id_categorie
		and mo.id_modele=modeleVehicule;
		IF joursDeLocation>0 THEN
			prixLocation:=prixLocation*joursDeLocation;
		END IF;
	END IF;
	RETURN prixLocation;
END;
/
