# Codes - Stage LNE

Codes réalisés dans le cadre du stage sur l'exploration de modèles bayésiens pour l’évaluation des degrés d’équivalence et leur incertitude associée en métrologie

## Organisation

- **CCQM-K147**

  Modèles complets et simplifiés étudiés dans le cadre de la comparaison *CCQM-K147*

  → voir le dossier [`CCQM-K147/`](./CCQM-K147)

- **Errors-in-variables calibration**

  Code pincipal et modèles utilisé dans le cadre des études présentées par l'article *Errors-in-variables calibration with dark uncertainty*

  → voir le dossier [`Errors-in-variables_calibration/`](./Errors-in-variables_calibration)

- **Etudes secondaires** :

  Analyse de variance réalisée pour l'étude des données du LNE dans le cadre de la comparaison *EURAMET-QM.S13* et code de simulation de données réalisé suite à cette étude

  → voir le dossier [`Etudes_secondaires/`](./Etudes_secondaires)

## Utilisation

Notebooks Jupyter ouverts dans un environnement Python 3.12.11 avec les librairies suivantes :

- **CCQM-K147 complet**
  
  pandas 2.2.2 &nbsp;&nbsp; - &nbsp;&nbsp; numpy 2.0.2 &nbsp;&nbsp; - &nbsp;&nbsp; matplotlib 3.10.0 &nbsp;&nbsp; - &nbsp;&nbsp; seaborn 0.13.2 &nbsp;&nbsp; - &nbsp;&nbsp; pymc 5.25.1 &nbsp;&nbsp; - &nbsp;&nbsp; arviz 0.22.0 &nbsp;&nbsp; - &nbsp;&nbsp; scipy 1.16.1 &nbsp;&nbsp; - &nbsp;&nbsp; pytensor 2.31.7

- **CCQM-K147 simplifié**

  pandas 2.2.2 &nbsp;&nbsp; - &nbsp;&nbsp; numpy 2.0.2 &nbsp;&nbsp; - &nbsp;&nbsp; pymc 5.25.1 &nbsp;&nbsp; - &nbsp;&nbsp; arviz 0.22.0
  
- **ANOVA LNE**

  pandas 2.2.2 &nbsp;&nbsp; - &nbsp;&nbsp; seaborn 0.13.2 &nbsp;&nbsp; - &nbsp;&nbsp; statsmodels 0.14.5 &nbsp;&nbsp; - &nbsp;&nbsp; matplotlib 3.10.0

- **Simulation Notebook**

  numpy 2.0.2 &nbsp;&nbsp; - &nbsp;&nbsp; pandas 2.2.2 &nbsp;&nbsp; - &nbsp;&nbsp; pymc 5.25.1 &nbsp;&nbsp; - &nbsp;&nbsp; arviz 0.22.0 &nbsp;&nbsp; - &nbsp;&nbsp; matplotlib 3.10.0 &nbsp;&nbsp; - &nbsp;&nbsp; seaborn 0.13.2 &nbsp;&nbsp; - &nbsp;&nbsp; ipywidgets 7.7.1

Document Quarto ouvert dans un environnement R 4.4.2 avec les librairies suivantes :

- **Errors-in-variables calibration with dark uncertainty**
  
  cmdstanr 0.9.0 &nbsp;&nbsp; - &nbsp;&nbsp; plotly 4.11.0 &nbsp;&nbsp; - &nbsp;&nbsp; bayesplot 1.14.0
