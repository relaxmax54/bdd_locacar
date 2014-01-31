/* Partie 2 | Trigger 5 | trigger qui incrémente/décrémente 
le nombre cumulé de jours de location de chaque véhicule. */

CREATE OR REPLACE TRIGGER update_count_days_loc
AFTER UPDATE OF date_retour_effectif ON DOSSIERS
FOR EACH ROW
DECLARE
CURSOR curdos is
(select v.compteur,v.num_immatriculation immat,d.date_retour_effectif dre,d.date_retrait dr from vehicules v, dossiers d where d.num_immatriculation=v.num_immatriculation);
BEGIN
for boucle in curdos loop
	UPDATE VEHICULES
	SET compteur = boucle.compteur + (boucle.dre - boucle.dr)
	WHERE boucle.immat = :OLD.num_immatriculation;
end loop;
END;
/


