CREATE OR REPLACE FUNCTION montantLocation(modeleVehicule IN NUMBER,joursDeLocation IN NUMBER) RETURN NUMBER IS
prixjour tarifs.prix_jour%type;
prixforfait tarifs.prix_forfait%type;
prixLocation number:=0;
BEGIN
IF (joursDeLocation>0) THEN
	select t.prix_jour INTO prixjour
	from tarifs t, categories c, modeles mo
	where t.id_categorie=c.id_categorie
	and c.id_categorie=mo.id_categorie
	and mo.id_modele=modeleVehicule;
	select t.prix_forfait into prixforfait
	from tarifs t, categories c, modeles mo		
	where t.id_categorie=c.id_categorie
	and c.id_categorie=mo.id_categorie
	and mo.id_modele=modeleVehicule;
	IF (MOD(joursDeLocation,7)>0) then
		prixLocation:=prixLocation*MOD(joursDeLocation,7)*prixjour;
	END IF;
	prixLocation:=(joursDeLocation-MOD(joursDeLocation,7))*prixforfait;
END IF;
RETURN prixLocation;
END;
/
