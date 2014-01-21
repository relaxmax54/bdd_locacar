CREATE OR REPLACE FUNCTION montantLocation(modeleVehicule IN NUMBER,joursDeLocation IN NUMBER) RETURN NUMBER IS

DECLARE
prix tarifs%ROWTYPE;
prixLocation NUMBER :=0;

BEGIN
	IF (modeleVehicule IS NOT NULL) THEN
		select * INTO prix
		from tarifs t, categories c, modeles mo
		where t.id_categorie=c.id_categorie
		and c.id_categorie=mo.id_categorie
		and mo.id_modele=modeleVehicule;
		IF (joursDeLocation>0) THEN
			IF (MOD(joursDeLocation,7)>0)
				prixLocation:=prixLocation*MOD(joursDeLocation,7)*prix.prix_jour;
			ENDIF;
			joursDeLocation:=joursDeLocation-MOD(joursDeLocation,7);
			prixLocation=joursDeLocation*prix.prix_forfait;
		END IF;
	END IF;

	RETURN prixLocation;

END;

/
