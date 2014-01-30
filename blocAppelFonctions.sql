CREATE OR REPLACE PROCEDURE procDevis(modele in number,nombreJours in number) is
BEGIN
DBMS_OUTPUT.PUT_LINE(montantLocation(modele,nombreJours));
END;
/