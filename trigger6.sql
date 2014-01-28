/* Partie 2 | Trigger 6 | trigger qui met à jour le kilométrage d’un véhicule 
après mise à jour du kilométrage effectif du véhicule au retour d’une location. */

CREATE OR REPLACE TRIGGER update_km_parcourus
AFTER UPDATE OF km_arrivee ON DOSSIERS
DECLARE
	immat	VEHICULES.num_immatriculation%TYPE;
	kmarr	DOSSIERS.km_arrivee%TYPE;

BEGIN
	SELECT	d.km_arrivee, v.num_immatriculation 
	INTO	kmarr, immat
	FROM	VEHICULES v, DOSSIERS d
	WHERE	d.num_immatriculation = v.num_immatriculation
	AND		d.id_agence_retrait = v.id_agence
	AND		d.km_depart = v.km_parcourus;
	
	UPDATE VEHICULES 
	SET km_parcourus = kmarr
	WHERE num_immatriculation = immat;
END;
/