/* Partie 2 | Trigger 5 | trigger qui incrémente/décrémente 
le nombre cumulé de jours de location de chaque véhicule. */

CREATE OR REPLACE TRIGGER update_count_days_loc
AFTER UPDATE OF date_retour_effectif ON DOSSIERS
DECLARE
	PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
	UPDATE VEHICULES
	SET compteur = compteur + (date_retour_effectif - date_retrait);
	WHERE num_immatriculation = :OLD.num_immatriculation;
	COMMIT;
END;
/


