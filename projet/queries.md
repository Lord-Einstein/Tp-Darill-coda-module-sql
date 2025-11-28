> Premiere requête : Prix moyen de la bière par quatier

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




