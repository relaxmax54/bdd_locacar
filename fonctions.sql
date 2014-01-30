--Question 1
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
--Question 1 bis
DECLARE
modele number:=1;
nombreJours number:=10;
BEGIN
DBMS_OUTPUT.PUT_LINE(montantLocation(modele,nombreJours));
END;
/
--Question 2
CREATE OR REPLACE PROCEDURE estDisponible(evoiture in vehicules.num_immatriculation%type,debut in dossiers.date_retrait%type,fin in dossiers.date_retour_prevu%type) is
reservation dossiers.id_dossier%type;
BEGIN
select d.id_dossier into reservation
from vehicules v,dossiers d
where d.num_immatriculation=v.num_immatriculation
and d.num_immatriculation=voiture
and (debut>d.date_retour_effectif or fin>d.date_retrait);
DBMS_OUTPUT.PUT_LINE('Véhicule disponible');
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('véhicule non disponible à cette période');
END;
/
--Question 2 bis
DECLARE
debut date:='01/01/2013';
fin date:='02/01/2013';
voiture varchar(2):='QQ030KK';
nombreJours number:=10;
BEGIN
DBMS_OUTPUT.PUT_LINE(estDisponible(voiture,debut,fin));
END;
/