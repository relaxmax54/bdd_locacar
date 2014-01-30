create or replace function simple(iddossier IN number)return number is
reponse number :=0;
begin
select id_dossier+1 INTO reponse from dossiers where id_dossier=iddossier;
return reponse;
end;
/
create or replace function devis(modeleVehicule in number)return number is
begin
for record in 1..5 loop
dbms_output.put_line('a');
end loop;
return 10;
end;
/
create or replace function devis(modeleVehicule in number)return number is
cursor modele is select id_modele from modeles;
begin
for record in modele loop
dbms_output.put_line('a');
end loop;
return 10;
end;
/
create or replace function devis(modeleVehicule in modeles.id_modele%type)return number is
cursor modele is select id_modele from modeles;
begin
for record in modele loop
dbms_output.put_line('a');
end loop;
return 10;
end;
/
create or replace function devis(modeleVehicule in modeles.id_modele%type)return number is
cursor modele is select id_modele from modeles;
reponse number :=0;
begin
for record in modele loop
dbms_output.put_line(reponse);
end loop;
return reponse;
end;
/
create or replace function devis(modeleVehicule in modeles.id_modele%type)return number is
cursor modele is select id_modele from modeles;
reponse number :=0;
begin
for record in modele loop
if(record>reponse) then
dbms_output.put_line(reponse);
end if;
end loop;
return reponse;
end;
/
create or replace function devis(modeleVehicule in modeles.id_modele%type)return number is
cursor modele is select id_modele from modeles;
reponse number :=0;
begin
for record in modele loop
if(record>reponse) then
dbms_output.put_line(reponse);
end if;
end loop;
return reponse;
end;
/
create or replace function devis(modeleVehicule in modeles.id_modele%type)return number is
cursor modele is select id_modele from modeles;
reponse number :=0;
begin
for record in modele loop
if(record.id_modele>reponse) then
dbms_output.put_line(reponse);
end if;
end loop;
return reponse;
end;
/
create or replace function calculTarif(dump in number)return number is
reponse number:=0;
begin
return reponse;
end;
/
create or replace function devis(modeleVehicule in modeles.id_modele%type,joursLocation in number)return number is
cursor modele is select id_categorie from modeles where id_modele=modeleVehicule;
cursor categorie is select id_categorie from categories;
cursor tarif is select id_categorie,prix_jour,prix_forfait from tarifs;
reponse number :=0;
begin
if(modeleVehicule>0 and joursLocation>0) then
	for record_modele in modele loop
		for record_categorie in categorie loop
			for record_tarif in tarif loop
				if(record_modele.id_categorie=record_categorie.id_categorie and record_categorie.id_categorie=record_tarif.id_categorie) then
					select calculTarif(1,1,1) into reponse from dual;
				end if;
			end loop;
		end loop;
	end loop;	
	return reponse;
	else
	return 0;
	end if;
end;
/
CREATE OR REPLACE TRIGGER update_km_parcourus
AFTER UPDATE OF km_arrivee ON DOSSIERS
DECLARE
	immat	VEHICULES.num_immatriculation%TYPE;
	kmarr	DOSSIERS.km_arrivee%TYPE;

BEGIN
	SELECT	d.km_arrivee, v.num_immatriculation 
	INTO	kmarr, immat
	FROM	VEHICULES v, DOSSIERS d
	WHERE	d.num_immatriculation = v.num_immatriculation;

	UPDATE VEHICULES 
	SET km_parcourus = kmarr
	WHERE num_immatriculation = immat;
END;
/
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
