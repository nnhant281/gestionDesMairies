SPOOL BAO_NHAN_CITOYEN.log

PROMPT >> Carte nationale d’identité d’une personne donnée
SELECT IDENTIFIANT, NOM_PRINCIPAL, NOM_SECONDAIRE, PRENOM_PRINCIPAL, PRENOM_SECONDAIRES, SEXE, NATIONALITE, DATE_NAISSANCE, VILLE_NAISSANCE
FROM CITOYEN
WHERE IDENTIFIANT = 'FR02';

PROMPT >> Pour un citoyen donné , on vérifie s’il est maire d’une ville, si oui on affiche le détail de la ville
SELECT LIBELLE_POSTE
FROM CITOYEN
WHERE IDENTIFIANT = 'FR08';

SELECT VILLE.NOM_VILLE, VILLE.SUPERFICIE_VILLE, VILLE.NOM_PRENOM_MAIRE, VILLE.NOMBRE_HABITANT, VILLE.NOMBRE_ARRONDISSEMENT
FROM CITOYEN
INNER JOIN VILLE on (CITOYEN.MAIRIE_VILLE_TRAVAILLE = VILLE.NOM_VILLE)
WHERE IDENTIFIANT = 'FR08';

PROMPT >> Pour un citoyen donné , on vérifie s’il est maire d’un arrondissement, si oui on affiche le détail de l’arrondissement
SELECT LIBELLE_POSTE
FROM CITOYEN
WHERE IDENTIFIANT = 'FR07';

SELECT ARRONDISSEMENT.NOM_ARRONDISSEMENT, ARRONDISSEMENT.NOM_PRENOM_MAIRE
FROM CITOYEN
INNER JOIN ARRONDISSEMENT on (CITOYEN.MAIRIE_ARRONDISSEMENT_TRAVAILLE = ARRONDISSEMENT.NOM_ARRONDISSEMENT)
WHERE IDENTIFIANT = 'FR07';

PROMPT >> Pour un citoyen donné , on vérifie s’il est responsable administratif et si oui , à quelle mairie il travail.
PROMPT >> Si oui, selon la mairie où il travaille, on lancera l’une de deux requêtes suivantes:
SELECT LIBELLE_POSTE, MAIRIE_ARRONDISSEMENT_TRAVAILLE, MAIRIE_VILLE_TRAVAILLE
FROM CITOYEN
WHERE IDENTIFIANT = 'FR02';

PROMPT >> Affiche le détail du maire s'il est administratif d'arrondissement
SELECT ARRONDISSEMENT.NOM_ARRONDISSEMENT, ARRONDISSEMENT.TELEPHONE, ARRONDISSEMENT.FAX, ARRONDISSEMENT.EMAIL, ARRONDISSEMENT.SITE_INTERNET, ARRONDISSEMENT.NOM_PRENOM_RESPONSABLE_ADMINISTRATIF, ARRONDISSEMENT.NOM_RUE_MAIRIE, ARRONDISSEMENT.NUMERO_ADRESSE_MAIRIE, ARRONDISSEMENT.CODE_POSTALE_MAIRIE, ARRONDISSEMENT.BP_MAIRIE 
FROM  CITOYEN
INNER JOIN ARRONDISSEMENT on (CITOYEN.MAIRIE_ARRONDISSEMENT_TRAVAILLE = ARRONDISSEMENT.NOM_ARRONDISSEMENT)
WHERE IDENTIFIANT = 'FR02';

PROMPT >> Affiche le détail du maire s'il est administratif d'une ville
SELECT VILLE.NOM_VILLE,VILLE.TELEPHONE, VILLE.FAX, VILLE.EMAIL, VILLE.SITE_INTERNET, VILLE.NOM_PRENOM_RESPONSABLE_ADMINISTRATIF, VILLE.NOM_RUE_MAIRIE, VILLE.NUMERO_ADRESSE_MAIRIE, VILLE.CODE_POSTALE_MAIRIE, VILLE.BP_MAIRIE
FROM CITOYEN
INNER JOIN VILLE on (CITOYEN.MAIRIE_VILLE_TRAVAILLE = VILLE.NOM_VILLE)
WHERE IDENTIFIANT = 'FR02';

SPOOL off





