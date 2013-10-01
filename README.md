Transformations UNICODE
=======================

Jouons avec l’unicode pour créer plein d’effets amusants.



## Syntaxe
```bash
$ transformations-unicode --help
Usage transformations-unicode [OPTIONS] <arguments séparé par des espaces>
-h --help            Affiche cette aide et termine 
-V --version         Affiche la version et termine 
-s --souligne        Souligne le texte 
-S --souligne-double Double souligne le texte 
-v --souligne-vague  Souligne le texte avec une vague 
-u --surligne        Surligne le texte 
-U --surligne-double Double surligne le texte 
-b --barre           barre le texte 
-B --barre-long      barre longuement le texte 
-i --italique        transforme le texte en italique (pour les caractères possibles) 
-c --code <value>    Applique le modificateur désigné par son code UNICODE 

Les arguments ne prenant pas de paramètres peuvent être niés avec le préfix --no-<name> ou --<name>=0
```



## Exemples d’usage

Souligner du texte :
```bash
$ date | transformations-unicode --souligne
̲M̲a̲r̲ ̲j̲u̲l̲ ̲2̲3̲ ̲1̲6̲:̲4̲7̲:̲5̲9̲ ̲C̲E̲S̲T̲ ̲2̲0̲1̲3̲
```

Souligne d’une vague et surligner du texte :
```bash
$ date | transformations-unicode -v --surligne
̼̅M̼̅a̼̅r̼̅ ̼̅j̼̅u̼̅l̼̅ ̼̅2̼̅3̼̅ ̼̅1̼̅6̼̅:̼̅4̼̅6̼̅:̼̅0̼̅0̼̅ ̼̅C̼̅E̼̅S̼̅T̼̅ ̼̅2̼̅0̼̅1̼̅3̼̅
```

Enrichi les caractères du texte avec « U+07F0 NKO COMBINING LONG LOW TONE » 
````bash
$ date | transformations-unicode --code  ߰
߰M߰a߰r߰ ߰j߰u߰l߰ ߰2߰3߰ ߰1߰6߰:߰5߰4߰:߰4߰3߰ ߰C߰E߰S߰T߰ ߰2߰0߰1߰3߰
```



## Problème connu
La récupération de la chaîne de caractères en entrée, son traitement, et sa sortie, se font sans soucis particulier. En revanche, pour afficher le résultat vous *devez* avoir :
* un terminal ayant un support correct de l’unicode;
* une police de caractères comportant les symboles à afficher.



## Dépendances
L'outil transformations-unicode utilise à la compilation [GBCli: Objective C foundation tool command line interface library](https://github.com/tomaz/GBCli/) (licence MIT) pour faciliter le traitement des paramètres. GBCli est inclus dans le dépôt (submodule git), et n'est pas nécessaire pour l’exécution.



## Compilation

### xcode, ligne de commande
```bash
$ xcodebuild clean
$ xcodebuild
```

`transformations-unicode` est installé dans `build/Release/transformations-unicode`

### xcode, interface graphique
1. Menu `Product > Clean`
1. Menu `Product > Build`

`transformations-unicode` est installé dans `$HOME/bin`


## Licence
L'outil transformations-unicode est réalisé par [Damien Clauzel](http://Damien.Clauzel.eu) et est placé sous la [GPLv3](https://www.gnu.org/licenses/gpl-3.0.fr.html).
