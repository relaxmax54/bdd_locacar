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
for record_modele in modele loop
	for record_categorie in categorie loop
		for record_tarif in tarif loop
			if(record_modele.id_categorie=record_categorie.id_categorie and 

record_categorie.id_categorie=record_tarif.id_categorie) then
				select calculTarif(1) into reponse from dual;
			end if;
		end loop;
	end loop;
end loop;	
return reponse;
end;
/