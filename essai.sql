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
