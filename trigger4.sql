/* Partie 2 | Trigger 4 | trigger qui enregistre dans un fichier ‘audit’ 
toutes les locations dont la durée est > 7 jours.*/

CREATE OR REPLACE TRIGGER update_loc_sup_semaine
AFTER UPDATE OF date_retour_effectif ON DOSSIERS
FOR EACH ROW
DECLARE
	PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
	IF date_retour_effectif-date_retrait + 1 > 7
	THEN (
		INSERT INTO LOC_SUP_SEMAINE (id_dossier, nom_client, prenom_client, nom_marque, modele, date_du_jour)
		VALUES (	(SELECT 	d.id_dossier, c.nom, c.prenom, ma.nom, mo.nom
					FROM	DOSSIERS d, CLIENTS c, MODELES mo, MARQUES ma, VEHICULES v
					WHERE	c.id_client = d.id_client
					AND		d.num_immatriculation = v.num_immatriculation
					AND		v.id_modele = mo.id_modele
					AND		mo.id_marque = ma.id_marque),
				SYSDATE);
		WHERE id_dossier = :OLD.id_dossier;);
	END IF;
	COMMIT;
END;
/



