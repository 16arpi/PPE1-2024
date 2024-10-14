# Journal de bord du projet encadré

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
