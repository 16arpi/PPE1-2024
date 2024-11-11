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

## Mercredi 6 novembre

Cette séance a porté sur le mini-projet à faire individuellement pour nous préparer au projet de groupe. Cette section de journal vise à répondre aux questions posées dans le diaporama.

### Exercice 1

**Pourquoi ne pas utiliser cat ?**

Même si `cat` permet d'affichier puis piper le contenu d'un fichier vers une commande, dans notre cas son utilisation est inutile dans la mesure où l'instruction bash `<` fait se travail sans recourir à un programme supplémentaire.

**Comment transformer "urls/fr.txt" en paramètre du script ?**

Pour cela, il faut :
* assigner à une variable le premier argument de notre commande (par ex `FILENAME=$1`)
* vérifier l'existence (ou la nullité) de notre variable `$FILENAME`.
* remplacer `urls/fr.txt` par notre variable

**Comment afficher le numéro de ligne avant chaque URL (sur la même ligne) ?**

On peut garder une trace écrite de l'index de la ligne en incrémentant un entier à chaque tour de boucle. Pour cela, on peut déclarer une variable I en dehors de notre boucle que l'on incrémente à chaque tour. Il y a plusieurs manières de faire (réassignation de I avec `I + 1`, instruction `++` etc.)*. Dans notre exemple nous utilisons l'instruction `((I++))` entourée de deux parenthèses : celles-ci permet une opération arithmétique sans expression du résultat de l'opération**.

\* https://askubuntu.com/questions/385528/how-to-increment-a-variable-in-bash

\** https://stackoverflow.com/questions/31255699/double-parenthesis-with-and-without-dollar

## Exercice 2

**Ajouter le code HTTP de la réponse à la requête**

Le code HTTP est récupérable grâce aux métadonnées des réponses retournées par cURL. Avec l'option `-I`, cURL peut ne retourner que l'en-tête de la réponse. Celle-ci nous informe sur le code HTTP, mais aussi sur l'encodage de la page.

Dans le cas du code HTTP, on peut écrire une commande bash qui envoie dans une variable :
1. L'en-tête cURL de l'URL de la ligne en cours
2. La première ligne de cette en-tête
3. Le deuxième élément de cette ligne

En commande bash, on obtient `curl -i $line | head -n 1 | cut -d ' ' -f 2`. On peut ainsi assigner le résultat de cette commande à une variable `HTTP_CODE` : `HTTP_CODE=$(curl -i $line | head -n 1 | cut -d ' ' -f 2)`.

**Ajouter l'encodage de la page, s'il est présent**

On peut repartir de l'en-tête obtenu à la question précédente. Seulement, ici la sélection de la ligne pertinente peut être récupérée grâce à une commande `grep`. On obtient ici la commande : `curl -i $line | egrep 'charset=.+\b' | cut -d '=' -f 2`.

Cela nous donne l'assignation de variable : `ENCODING=$(curl -i $line | egrep 'charset=.+\b' | cut -d '=' -f 2)`. Par chance, grep ne retourne rien si il ne trouve rien. Il y aura ainsi une case vide si l'encoding n'est pas indiqué dans l'en-tête.

**Récupérer le nombre de mots**

Pour cela, on peut utiliser `lynx` et son option `-dump`. Ensuite, on peut isoler les mots à l'aide d'une expression régulière et `egrep` puis compter les mots grâces à `wc`. Cela nous donne `lynx -dump $line | egrep "\b[[:alnum:]]+\b" -o | wc -l`.
