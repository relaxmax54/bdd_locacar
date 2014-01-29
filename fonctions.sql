CREATE OR REPLACE FUNCTION montantLocation(modeleVehicule IN NUMBER,joursDeLocation IN NUMBER) RETURN NUMBER IS
prixjour tarifs.prix_jour%type;
prixforfait tarifs.prix_forfait%type;
nombreDeModeles number:=0;
prixLocation number:=0;
BEGIN
IF (joursDeLocation>0) THEN
	select count(*) into nombreDeModeles from modeles;
	IF (modeleVehicule<=nombreDeModeles) THEN
		select nvl(t.prix_jour,0) INTO prixjour
		from tarifs t, categories c, modeles mo
		where t.id_categorie=c.id_categorie
		and c.id_categorie=mo.id_categorie
		and mo.id_modele=modeleVehicule
		and rownum=1
		order by t.id_tarif;
		select nvl(t.prix_forfait,0) into prixforfait
		from tarifs t, categories c, modeles mo		
		where t.id_categorie=c.id_categorie
		and c.id_categorie=mo.id_categorie
		and mo.id_modele=modeleVehicule
		and rownum=1
		order by t.id_tarif;
		IF (MOD(joursDeLocation,7)>0) then
			prixLocation:=MOD(joursDeLocation,7)*prixjour;
		END IF;
		prixLocation:=prixLocation+((joursDeLocation-MOD(joursDeLocation,7))/7)*prixforfait;
	END IF;
END IF;
RETURN prixLocation;
END;
/