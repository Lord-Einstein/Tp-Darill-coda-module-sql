> PREMIERE requête : Prix moyen de la bière par quatier

```sql

SELECT qu.nom AS Nom_quartier, ROUND(AVG(prix.prix), 2) AS Prix_moyen 
--- J'ai du arrondir à deux décimales parce qu'il y'en avait trop.

FROM beerproject.quartier qu
JOIN beerproject.bar bar
ON bar.id_quartier = qu.id_quartier
JOIN beerproject.prix prix
ON prix.id_bar = bar.id_bar

GROUP BY qu.nom
ORDER BY Prix_moyen ASC;
--- Bonus juste pour voir le prix moyen par ordre croidsant.

```



> DEUXIEME requête : Bars vendant l'IPA la moins chère...

```sql

SELECT b.nom AS bar, p.prix
--J'ai aussi sélectionné le prix juste pour qu'on puisse vérifier que c'est bien le prix le plus élevé qui est dans ma base
FROM beerproject.bar b
JOIN beerproject.prix p ON p.id_bar = b.id_bar
JOIN beerproject.biere bi ON bi.id_biere = p.id_biere
WHERE bi.nom LIKE 'IPA%' 
AND p.prix = (
    SELECT MIN(prix)
    FROM beerproject.prix
    JOIN beerproject.biere ON biere.id_biere = prix.id_biere
    WHERE biere.nom LIKE 'IPA%'
);


```


