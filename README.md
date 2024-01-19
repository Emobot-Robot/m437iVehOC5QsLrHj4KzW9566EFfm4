
# Emobot French Sentences Dataset Emotional Labeling

## Objectif

Associer à chaque phrase la ou les émotions qui semblent cohérentes, c'est-à-dire celles pour lesquelles prononcer la phrase avec cette émotion dans la voix semblerait plutôt naturel. 

  Pour chaque phrase, il s'agit en fait de répondre aux questions suivantes :
  - Est-ce qu'il semblerait naturel de dire cette phrase de manière effrayée ? 😱
  - Est-ce qu'il semblerait naturel de dire cette phrase de manière heureuse ? 😊
  - Est-ce qu'il semblerait naturel de dire cette phrase de manière triste ? 😢
  - Est-ce qu'il semblerait naturel de dire cette phrase de manière énervée ? 😠
  - Est-ce qu'il semblerait naturel de dire cette phrase de manière surprise ? 😮
 
 Lorsque qu'aucune des émotions ne semble pouvoir convenir, vous pourrez cocher la case "Aucune 🤷".


## 1 - Télécharger le dossier sur votre ordinateur

### Téléchargement

Pour ce faire, cliquez sur le bouton vert "<> Code", puis sur "Download ZIP" en bas de la popup.

![Github download](  
https://eapi.pcloud.com/getpubthumb?code=XZuPseZGnbNfeQ0JrHDnvxXwXm5BusrF53k&linkpassword=undefined&size=414x428&crop=0&type=auto)

Choisissez un emplacement de téléchargement sur votre ordinateur dans lequel enregistrer ce fichier .zip.

### Extraction

Rendez-vous à l'emplacement de téléchargement, puis décompressez le dossier .zip :

- sur MacOS : double cliquez sur le dossier compressé depuis le Finder, le dossier décompressé apparaît à côté
- sur Windows : clic-droit > Extraire tout... > Extraire,  le dossier décompressé apparaît à côté

Ouvrez le dossier décompressé.

Le contenu du dossier est organisé de la sorte :
```
├── DATA
│   ├── sentences.csv
├── MacOS
│   ├── LAUNCH.command
│   ├── SETUP.command
├── Windows
│   ├── LAUNCH.bat
│   ├── SETUP.bat
├── README.md
```

### Ouverture du dossier

Selon votre système d'exploitation (MacOS ou Windows), ouvrez le dossier correspondant.
Ce dernier devrait contenir un fichier SETUP et un fichier LAUNCH.

## Si vous êtes sur MacOS :

Avant de poursuivre, vous devez effectuer une petite étape supplémentaire :

- à l'aide du Finder, naviguez vers le dossier parent de manière à pouvoir sélectionner le dossier `MacOS`
- utilisez le `Clic secondaire` (ou clic-droit) pour faire apparaître ce menu :

![Labeling interface](https://eapi.pcloud.com/getpubthumb?code=XZjUDeZutbuweuPnmzNLafhCXsLA7USINmV&linkpassword=undefined&size=588x870&crop=0&type=auto)
- en bas, cliquez sur `Nouveau terminal au dossier`
- dans la fenêtre qui souvre, copiez-collez la commande suivante : 
`sudo chmod u+x LAUNCH.command SETUP.command`
- appuyez sur Entrée ⏎
- vous pouvez fermer la fenêtre


Vous êtes prêt à labelliser !

## 2 - Labelliser les données la 1ère fois

  

### Installation et lancement de Label Studio

Lorsque vous commencez à labelliser un jeu de données pour la 1ère fois, lancez le fichier **SETUP** en double cliquant dessus. 
Ce dernier va installer tout ce qu'il faut pour vous permettre de labelliser simplement, et ensuite ouvrir l'interface de labellisation.

### Création de votre compte

  Lorsque vous utilisez Label Studio pour la 1ère fois, vous devrez créer un compte que vous réutiliserez par la suite.

1. Dans l'onglet **SIGN UP**, entrez un email et un mot de passe.
L'email peut être faux, du moment qu'il est valide (example@gmail.com).

2. Cliquez sur **CREATE ACCOUNT** pour créer votre compte et ouvrir l'interface de labellisation.


### Création d'un projet

1. En haut à droite, cliquez sur **Create**.

2. Entrez un nom pour ce projet de labellisation

3. Cliquez sur **Save** pour créer le projet.
  

### Préparation de l'interface

1. En haut à droite, cliquez sur **Settings**.

2. Dans le menu à gauche, choisissez **Labeling Interface**.

3. Assurez-vous d'être dans la vue **Code** (et non *Visual*).

4. Remplacer le contenu du champ de texte par ceci :

```xml
<View>
  <Header name="sentence" value="$text"/>
  <Text name="Break_Line" value=" "/>
  <Text name="Associated_Emotions" value="Emotions possiblement associées :"/>
  <Choices name="sentiment" toName="sentence" choice="multiple" showInLine="true">
    <Choice value="Effrayé 😱" style="zoom: 1.5;" hotkey="1"/>
    <Choice value="Heureux 😊" style="zoom: 1.5;" hotkey="2"/>
    <Choice value="Triste 😢" style="zoom: 1.5;" hotkey="3"/>
    <Choice value="Énervé 😠" style="zoom: 1.5;" hotkey="4"/>
    <Choice value="Surpris 😮" style="zoom: 1.5;" hotkey="5"/>
    <Choice value="Aucune 🤷" style="zoom: 1.5;" hotkey="6"/>
  </Choices>
</View>
```

#### L'interface de prévisualisation à droite devrait maintenant ressembler à cela :

![Labeling interface](https://eapi.pcloud.com/getpubthumb?code=XZVKseZVfcDQeYuDzXfxwOK0TfbdfNsmgOV&linkpassword=undefined&size=775x311&crop=0&type=auto)

  

5. Cliquez sur **Save** sous la zone de texte.

6. Vous pouvez maintenant retourner sur la page du projet en **cliquant sur le nom du projet** dans la barre du haut (`Projects / Project name`).

  
  

###  Importation des données

 1. Cliquez sur le bouton bleu **Go to import** au centre, ou sur le bouton gris **Import** en haut à droite.
 
 2. Cliquez sur **Upload Files** en haut vers la gauche.

 3. Naviguez jusqu'au dossier précédemment téléchargé et extrait, puis dans le dossier **DATA** sélectionnez et ouvrez `sentences.csv`.

 4. Dans la zone qui s'affiche en haut "**Treat CSV/TSV as**", sélectionnez **List of tasks**.

 5. Cliquez sur le bouton bleu **Import** en haut à droite

La configuration est terminée !

### Commencer à labelliser

De retour sur la page du projet, cliquez sur le bouton bleu **Label All Tasks** vers le haut, et commencez à labelliser les phrases affichées.

Pour chaque phrase à labelliser, l'interface suivante s'affiche :

![Labeling interface](https://eapi.pcloud.com/getpubthumb?code=XZ4qseZioRovaN4aefYY7iGSKEEFYe0Bzbk&linkpassword=undefined&size=1359x868&crop=0&type=auto)


### Raccourcis pour gagner du temps

Vous pouvez bien sûr utiliser votre souris pour cocher les cases et cliquer sur **Submit**.
Mais vous avez également la possibilité d'utiliser votre clavier pour gagner du temps comme ceci :

- les **touches 1 à 6** de votre clavier vous permettent de cocher/décocher les cases comme indiqué entre crochets
- **Cmd ⌘ + Entrée ⏎** sur Mac ou **Ctrl + Entrée ⏎** sur Windows vous permet de valider et passer au suivant, comme en cliquant sur le bouton **Submit**


### Enregistrement de votre progression

Votre progression est enregistrée automatiquement dans votre ordinateur, vous pouvez donc quitter à tout moment (pour faire une pause par exemple) et continuer plus tard, la labellisation reprendra là où vous vous étiez arrêté.



## 3 - Labelliser les données les fois suivantes

### Lancement de Label Studio

Lancez le fichier **LAUNCH** en double cliquant dessus. 
Ce dernier va charger Label Studio et ouvrir l'interface de labellisation.


### Connexion à votre compte

  Connectez à votre compte précédemment créé.

1. Dans l'onglet **LOG IN**, entrez votre email et mot de passe précédemment configurés.

2. Cliquez sur **LOG IN** pour vous connecter à votre compte et ouvrir l'interface de labellisation.


### Ouverture du projet

Double cliquez sur le nom du projet dans la page qui s'affiche pour accéder à votre projet de labellisation en cours.


### Commencer à labelliser

Sur la page du projet, cliquez sur le bouton bleu **Label All Tasks** vers le haut, et commencez à labelliser les phrases affichées.

Pour chaque phrase à labelliser, l'interface suivante s'affiche :

![Labeling interface](https://eapi.pcloud.com/getpubthumb?code=XZ4qseZioRovaN4aefYY7iGSKEEFYe0Bzbk&linkpassword=undefined&size=1359x868&crop=0&type=auto)


### Raccourcis pour gagner du temps

Vous pouvez bien sûr utiliser votre souris pour cocher les cases et cliquer sur **Submit**.
Mais vous avez également la possibilité d'utiliser votre clavier pour gagner du temps comme ceci :

- les **touches 1 à 6** de votre clavier vous permettent de cocher/décocher les cases comme indiqué entre crochets
- **Cmd ⌘ + Entrée ⏎** sur Mac ou **Ctrl + Entrée ⏎** sur Windows vous permet de valider et passer au suivant, comme en cliquant sur le bouton **Submit**


### Enregistrement de votre progression

Votre progression est enregistrée automatiquement dans votre ordinateur, vous pouvez donc quitter à tout moment (pour faire une pause par exemple) et continuer plus tard, la labellisation reprendra là où vous vous étiez arrêté.



## 4 - Exporter vos labels

- Une fois que vous avez fini de labelliser toutes les phrases, revenez à la page d'accueil du projet et cliquez sur le bouton **Export** en haut à droite.

- Sélectionnez le format `CSV` et cliquez sur le bouton **Export** en bas à droite.

- **Enregistrez le fichier .csv** à l'emplacement souhaité sur votre ordinateur et envoyez-le par courrier électronique.