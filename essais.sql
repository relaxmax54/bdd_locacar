CREATE OR REPLACE PROCEDURE listeDisponible(cat in modeles.id_categorie%type,debut in dossiers.date_retrait%type,fin in dossiers.date_retour_prevu%type) is
CURSOR liste is 
select v.num_immatriculation,mo.nom
from vehicules v,modeles mo,dossiers d,categories c
where d.num_immatriculation=v.num_immatriculation
and v.id_modele=mo.id_modele
and mo.id_categorie=c.id_categorie
and (sysdate>d.date_retour_effectif or sysdate<d.date_retrait)
and c.id_categorie=cat
group by v.num_immatriculation,mo.nom;
var1 vehicules.num_immatriculation%type:='1';
var2 categories.id_categorie%type;
BEGIN
for indexMax in liste loop
DBMS_OUTPUT.PUT_LINE('le vehicule immatriculé '||var1);
end loop;
END;
/
