CREATE OR REPLACE PROCEDURE enregistreReservation(voiture vehicules.num_immatriculation%type,debut dossiers.date_retrait%type,fin dossiers.date_retour_prevu%type) is
BEGIN
select v.num_immatriculation
from vehicules v,dossiers d
where d.num_immatriculation=v.num_immatriculation
and (fin>d.date_retour_effectif or debut<d.date_retrait);
END;
/
select d.id_dossier,TO_Date('01/15/2013','MM/DD/YYYY') as debut,d.date_retour_effectif,TO_Date( '02/15/2013', 'MM/DD/YYYY') as fin , d.date_retrait,v.num_immatriculation
from vehicules v,dossiers d
where d.num_immatriculation=v.num_immatriculation
and v.num_immatriculation='KK030QQ'
and (TO_Date('01/15/2013','MM/DD/YYYY')>d.date_retour_effectif or TO_Date('02/15/2013','MM/DD/YYYY')>d.date_retrait)
/