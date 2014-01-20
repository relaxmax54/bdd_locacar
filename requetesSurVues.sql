/*requêtes sur les vues*/

select num_immatriculation from info_car where lower(nom)='nancy' group by num_immatriculation
select num_immatriculation from info_car where prix_km>30 group by num_immatriculation

/* ajout d'un nouveau véhicule à partir de la vue ajouteVehicule*/
INSERT INTO ajouteVehicule ( NUM_IMMATRICULATION, ID_MODELE, ID_COULEUR, ID_AGENCE, DATE_ACHAT, KM_PARCOURUS)
 VALUES ( 'NV999ZZ', 3, 3, 4);
 /*insertion d'un nouvel élément
	 * : une peugeot 508 de couleur bleue rattachée à l'agence strasbourgeoise, avec les valeurs des deux dernières colonnes par défaut)
*/	


/
