SPOOL BAO_NHAN_LISTING.log

PROMPT >> Liste des citoyens d’une ville
SELECT CITOYEN.IDENTIFIANT, CITOYEN.NOM_PRINCIPAL, CITOYEN.PRENOM_PRINCIPAL
FROM CITOYEN 
INNER JOIN ADRESSE on (ADRESSE.IDENTIFIANT_ADRESSE = CITOYEN.IDENTIFIANT_ADRESSE)
WHERE UPPER(ADRESSE.NOM_VILLE) = UPPER('Paris');

PROMPT >> Liste des citoyens d’un departement
SELECT CITOYEN.IDENTIFIANT,CITOYEN.NOM_PRINCIPAL, CITOYEN.PRENOM_PRINCIPAL
FROM CITOYEN 
INNER JOIN ADRESSE on (ADRESSE.IDENTIFIANT_ADRESSE = CITOYEN.IDENTIFIANT_ADRESSE)
INNER JOIN VILLE on ( VILLE.NOM_VILLE = ADRESSE.NOM_VILLE)
WHERE NUMERO_DEPARTEMENT= ('67');

PROMPT >> Liste des citoyens d’une region
SELECT CITOYEN.IDENTIFIANT,CITOYEN.NOM_PRINCIPAL, CITOYEN.PRENOM_PRINCIPAL
FROM CITOYEN
INNER JOIN ADRESSE on (ADRESSE.IDENTIFIANT_ADRESSE = CITOYEN.IDENTIFIANT_ADRESSE)
INNER JOIN VILLE on (VILLE.NOM_VILLE = ADRESSE.NOM_VILLE)
INNER JOIN DEPARTEMENT on (DEPARTEMENT.NUMERO_DEPARTEMENT = VILLE.NUMERO_DEPARTEMENT)
INNER JOIN REGION on (REGION.NOM_REGION = DEPARTEMENT.NOM_REGION)
WHERE UPPER(REGION.NOM_REGION) = UPPER('GRAND EST');

PROMPT >> Liste des citoyens parents d’autres citoyens
SELECT citoyen.IDENTIFIANT
FROM citoyen
INNER JOIN PARENTE on (citoyen.IDENTIFIANT = PARENTE.ID_PARENT);

PROMPT >> Liste des maires de villes
SELECT CITOYEN.NOM_PRINCIPAL, CITOYEN.PRENOM_PRINCIPAL, VILLE.NOM_VILLE
FROM CITOYEN
INNER JOIN VILLE on (VILLE.NOM_VILLE = CITOYEN.MAIRIE_VILLE_TRAVAILLE)
WHERE UPPER(LIBELLE_POSTE) = UPPER('MAIRE DE VILLE');

PROMPT >> Liste des villes d’une région
SELECT VILLE.NOM_VILLE
FROM VILLE 
INNER JOIN DEPARTEMENT on (DEPARTEMENT.NUMERO_DEPARTEMENT = VILLE.NUMERO_DEPARTEMENT)
WHERE UPPER(DEPARTEMENT.NOM_REGION) = UPPER('ILE DE FRANCE');

PROMPT >> Liste des certificats de mariage saisis dans une ville donnée
SELECT *
FROM MARIAGE 
WHERE NOM_VILLE = 'STRASBOURG';

SPOOL off