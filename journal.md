# Journal de bord du projet encadré

Dépôt du projet de groupe : [mot](https://github.com/16arpi/mot);

## Mercredi 2 octobre 2024

Nous nous sommes initiés à l'utilisation du programme `git`. Nous avons créé un dépôt initial pour notre projet final en y ajoutant le fichier de notre journal de bord. Nous nous sommes familiarisé avec la récupération de fichiers distants et l'envoie de modifications locales vers le serveur.

## Mercredi 9 octobre 2024

### Pipelines

Lors de cette séance, nous avons découvert les pipelines en bash. Il s'agit d'une méthode permettant de renvoyer à la commande suivante le résultat de la commande précédente. Cela tire profit de l'écriture dans le flux `stdin` (pour standard input) et `stdout` (pour standard output).

Pour le TD, j'ai utilisé une boucle bash (`for n in list; do command; done`) n'ayant pas eu l'idée du `cat ./*.ann`. J'ai trouvé la syntaxe de la boucle sur StackOverflow. J'ai compté par erreur le nombre de fichiers et non le nombre d'annotations car j'ai mal compris la consigne (je pensais que un fichier = une annotation).

### Exercices sur git

Cette ligne doit rester après correction
Ecriture du fichier oups.md

Cet exercice a était compliqué pour moi car je n'ai pas compris le scénario de conflit demandé par la fiche de TD. J'ai mes propres manières de résoudre mes conflits git et cela m'a rendu confu pour comprendre la stratégie de résolution expliquée dans la fiche (par exemple, `défaire` signifie `revert` ou `reset` ?).

## Mercredi 16 octobre

Découverte du langage Bash pour écrire des scripts permettant d'ordonner et de conditionner l'éxecution de commandes. Le TD permet de s'initier à l'écriture de scripts bash.

Pour la question 2.b., il s'avère difficile de permettre la prise en charge de l'asterix car celui-ci est automatiquement interprété comme tous les sous-dossiers du répertoire. Si on execute le script à l'aide de l'entête `#!/bin/bash -f`, l'asterix est bien reconnu mais ça ne marche plus quand l'argument est passé à la commande `cat` car il n'y a littérallement aucun fichier appelé, par exemple, `*.ann`.

Mon ajout des vérifications d'arguments consiste à vérifier d'une part que les variables ne sont pas vides (dans le cas où l'utilisateur ne mentionne rien) et, d'autre part, que les arguments numériques sont bien des nombres. Pour cela, on vérifie que les arguments numériques respecte l'expression régulière `^[0-9]+$`.

### Script du diaporama : explication

Ce script permet d'itérer dans un fichiers d'URLs. Le nom du fichier est donné en argument. Le script commence par vérifier s'il y a bien un argument. Puis une boucle permet de lire chaque ligne une à une. Pour chaque ligne, le script vérifie à l'aide d'une expression régulière si la ligne commence par `http://` ou `https://`, pour ainsi conclure si oui ou non l'URL semble valide. Selon si l'URL est valide, deux compteurs s'incrémentent au fur et à mesure de l'itération. À la fin, le programme renvoie le nombre de lignes comprenant des URLs valides et le nombre de lignes comprenant des URLs invalides.

## Mercredi 23 octobre

Ce cours nous a introduit au requêtage HTTP et à la récuparation de contenus HTML distants. Quelques programmes ont été présentés : Lynx, un navigateur web en ligne de commande, mais aussi `wget` ou `curl` permettant d'éxecuter des requêtes HTTP.

Cela a aussi été l'occasion de créer un dépôt Github pour le travail de groupe. Dans notre cas, le dépôt suivant : [mot](https://github.com/16arpi/mot).
