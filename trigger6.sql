/* Partie 2 | Trigger 6 | trigger qui met à jour le kilométrage d’un véhicule 
après mise à jour du kilométrage effectif du véhicule au retour d’une location. */

CREATE OR REPLACE TRIGGER update_km_parcourus
AFTER UPDATE OF km_arrivee ON DOSSIERS
FOR EACH ROW
DECLARE
	PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
	UPDATE VEHICULES
	SET km_parcourus = :NEW.km_arrivee;
	WHERE num_immatriculation = :OLD.num_immatriculation;
	COMMIT;
END;
/