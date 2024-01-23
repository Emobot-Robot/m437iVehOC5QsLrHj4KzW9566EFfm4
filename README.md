# Emobot French Sentences Dataset Emotional Labeling

## Objectif

**Associer à chaque phrase la ou les émotions qui semblent cohérentes**, c'est-à-dire celles pour lesquelles prononcer la phrase avec cette émotion dans la voix semblerait plutôt naturel.

Pour chaque phrase, il s'agit en fait de répondre aux questions suivantes :
- Est-ce qu'il semblerait naturel de dire cette phrase de manière effrayée ? 😱
- Est-ce qu'il semblerait naturel de dire cette phrase de manière heureuse ? 😊
- Est-ce qu'il semblerait naturel de dire cette phrase de manière triste ? 😢
- Est-ce qu'il semblerait naturel de dire cette phrase de manière énervée ? 😠
- Est-ce qu'il semblerait naturel de dire cette phrase de manière surprise ? 😮

Lorsque qu'aucune des émotions ne semble pouvoir convenir, vous pourrez cocher la case "Aucune 🤷".


## 1 - Télécharger le dossier sur votre ordinateur

### Téléchargement

Pour ce faire, cliquez sur le bouton vert "<> Code" en haut de cette page, puis sur "Download ZIP" en bas de la popup.

![Github download](https://eapi.pcloud.com/getpubthumb?code=XZuPseZGnbNfeQ0JrHDnvxXwXm5BusrF53k&linkpassword=undefined&size=414x428&crop=0&type=auto)

Choisissez un emplacement de téléchargement sur votre ordinateur dans lequel enregistrer ce fichier .zip.

### Extraction

Rendez-vous à l'emplacement de téléchargement, puis **décompressez le dossier .zip** :

- sur **MacOS** : double-cliquez sur le dossier compressé depuis le Finder, le dossier décompressé apparaît à côté
- sur **Windows** : clic-droit > Extraire tout... > Extraire, le dossier décompressé apparaît à côté

**Double-cliquez sur le dossier décompressé** pour l'ouvrir.

Le contenu du dossier est organisé de la sorte :
```
├── DATA
│ ├── sentences.csv
├── MacOS
│ ├── LAUNCH.command
│ ├── SETUP.command
├── Windows
│ ├── LAUNCH.bat
│ ├── SETUP.bat
├── README.md
```

## ⚠️ Si vous êtes sur MacOS :

Avant de poursuivre, vous devez effectuer une petite étape supplémentaire :

- Depuis le Finder, sélectionnez le dossier `MacOS`

- Utilisez le `Clic secondaire` (ou clic-droit) pour faire apparaître ce menu :
<img src="https://eapi.pcloud.com/getpubthumb?code=XZjUDeZutbuweuPnmzNLafhCXsLA7USINmV&linkpassword=undefined&size=588x870&crop=0&type=auto" alt="Right click menu" width="300" height="auto">

- En bas, cliquez sur `Nouveau terminal au dossier`
<img src="https://eapi.pcloud.com/getpubthumb?code=XZIGDeZDErJew4IswSRSsquOtwGHVNVWywV&linkpassword=undefined&size=984x744&crop=0&type=auto" alt="MacOS terminal" width="500" height="auto">

- Dans la fenêtre qui souvre, copiez (Cmd ⌘ + C) / **collez (Cmd ⌘ + V**) la commande suivante :
`sudo chmod u+x LAUNCH.command SETUP.command`

- Appuyez sur **Entrée ⏎**
<img src="https://eapi.pcloud.com/getpubthumb?code=XZXvDeZtwBRE9hReXbDucGYqARB67KPfayk&linkpassword=undefined&size=984x742&crop=0&type=auto" alt="MacOS terminal" width="500" height="auto">

- Entrez le mot de passe de votre session et appuyez à nouveau sur **Entrée ⏎**

- Vous pouvez fermer la fenêtre

#### Vous êtes prêt à labelliser !


## 2 - Labelliser les données la 1ère fois

### Ouverture du dossier

Selon votre système d'exploitation (MacOS ou Windows), ouvrez le dossier correspondant.
Ce dernier devrait contenir un fichier `SETUP` et un fichier `LAUNCH`.

### Installation et lancement de Label Studio

Lorsque vous commencez à labelliser un jeu de données pour la 1ère fois, **lancez le fichier** `SETUP` en faisant : **Clic-droit** (clic secondaire sur Mac) > **Ouvrir**.

**⚠️ Sur MacOS :**
Une popup s'ouvre :

<img src="https://eapi.pcloud.com/getpubthumb?code=XZ8iDeZ2Kti7nCEf14o0HJsySeNGbpPDEYk&linkpassword=undefined&size=610x698&crop=0&type=auto" alt="MacOS open" width="300" height="auto">

Cliquez sur **Ouvrir** pour lancer le SETUP.

Ensuite, **le SETUP s'exécute automatiquement** dans un fenêtre de terminal.
Ce script installe tout ce qu'il faut pour vous permettre de labelliser simplement, et ouvre ensuite l'interface de labellisation.

### Création de votre compte

Lorsque vous utilisez Label Studio pour la 1ère fois, vous devrez **créer un compte** que vous réutiliserez par la suite.

1. Dans l'onglet **SIGN UP**, entrez un email et un mot de passe.
L'email peut être faux, du moment qu'il est valide (example@gmail.com).

2. Cliquez sur **CREATE ACCOUNT** pour créer votre compte et ouvrir l'interface de labellisation.

### Création d'un projet

1. Cliquez sur le bouton bleu **Create Project** au centre, ou sur le bouton bleu **Create** en haut à droite.
2. Entrez un nom pour ce projet de labellisation dans **Project Name**.
3. Cliquez sur **Save** en haut à droite pour créer le projet.

### Préparation de l'interface

1. En haut à droite, cliquez sur **Settings**.
2. Dans le menu à gauche, choisissez **Labeling Interface**.
3. Assurez-vous d'être dans la vue **Code** (et non *Visual*).
4. Effacez le contenu du champ de texte et remplacez-le par ceci :
```xml
<View>
  <View style="font-size: 2em; font-weight: 500; display: flex; flex-direction: column; align-items: center; margin-top: 1em; overflow: hidden;">
  	<View style="overflow: hidden;">
  	  <Text name="text" value="$text"/>
    </View>
  </View>
  <View style="padding: 1em; margin-top: 2em;">
    <View style="font-size: 1.4em;">
  	  <Text name="instruction" value="Emotions possiblement associées :"/>
    </View>
    <Choices name="sentiment" toName="text" choice="multiple" showInLine="true">
		<Choice  value="Effrayé 😱"  style="zoom: 1.5;"  hotkey="1"/>
		<Choice  value="Heureux 😊"  style="zoom: 1.5;"  hotkey="2"/>
		<Choice  value="Triste 😢"  style="zoom: 1.5;"  hotkey="3"/>
		<Choice  value="Énervé 😠"  style="zoom: 1.5;"  hotkey="4"/>
		<Choice  value="Surpris 😮"  style="zoom: 1.5;"  hotkey="5"/>
		<Choice  value="Aucune 🤷"  style="zoom: 1.5;"  hotkey="6"/>
    </Choices>
  </View>
</View>
```
#### L'interface de prévisualisation à droite devrait maintenant ressembler à cela :
![Labeling interface](https://eapi.pcloud.com/getpubthumb?code=XZyPPeZ3dFwMXdnucy9SEHJQxmSguuyvjzV&linkpassword=undefined&size=838x414&crop=0&type=auto)

5. Cliquez sur **Save** en bas à droite de la zone de texte.
6. Vous pouvez maintenant retourner sur la page du projet en **cliquant sur le nom du projet** dans la barre du haut (`Projects / Project name`).


### Importation des données

1. Cliquez sur le bouton bleu **Go to import** au centre, ou sur le bouton gris **Import** en haut à droite.

2. Cliquez sur **Upload Files** en haut.

3. Naviguez jusqu'au dossier précédemment téléchargé et extrait, puis dans le dossier **DATA** sélectionnez et ouvrez `sentences.csv`.

4. Dans la zone qui s'affiche en haut "**Treat CSV/TSV as**", sélectionnez **List of tasks**.

5. Cliquez sur le bouton bleu **Import** en haut à droite

#### La configuration est terminée !

### Commencer à labelliser

De retour sur la page du projet, cliquez sur le bouton bleu **Label All Tasks** vers le haut, et commencez à labelliser les phrases affichées.

Pour chaque phrase à labelliser, l'interface suivante s'affiche :

![Labeling interface](https://eapi.pcloud.com/getpubthumb?code=XZ4qseZioRovaN4aefYY7iGSKEEFYe0Bzbk&linkpassword=undefined&size=1359x868&crop=0&type=auto)

### Raccourcis pour gagner du temps

Vous pouvez bien sûr utiliser votre souris pour cocher les cases et cliquer sur **Submit**.
Mais vous avez également la possibilité d'**utiliser votre clavier** pour gagner du temps comme ceci :
- les **touches 1 à 6** de votre clavier vous permettent de cocher/décocher les cases comme indiqué entre crochets

-  **Cmd ⌘ + Entrée ⏎** sur Mac ou **Ctrl + Entrée ⏎** sur Windows vous permet de valider et passer au suivant, comme en cliquant sur le bouton **Submit**


### Enregistrement de votre progression

Votre progression est enregistrée **automatiquement** dans votre ordinateur, vous pouvez donc quitter à tout moment (pour faire une pause par exemple) et continuer plus tard, la labellisation reprendra là où vous vous étiez arrêté.

#### Les instructions permettant de quitter Label Studio sont détaillées partie 5.

## 3 - Labelliser les données les fois suivantes

### Ouverture du dossier

Selon votre système d'exploitation (MacOS ou Windows), ouvrez le dossier correspondant.
Ce dernier devrait contenir un fichier `SETUP` et un fichier `LAUNCH`.

### Lancement de Label Studio

**Lancez le fichier** `LAUNCH` en faisant : **Clic-droit** (clic secondaire sur Mac) > **Ouvrir**.

**⚠️ Sur MacOS :**
Une popup s'ouvre :

<img src="https://eapi.pcloud.com/getpubthumb?code=XZ8iDeZ2Kti7nCEf14o0HJsySeNGbpPDEYk&linkpassword=undefined&size=610x698&crop=0&type=auto" alt="MacOS open" width="300" height="auto">

Cliquez sur **Ouvrir** pour lancer LAUNCH.

Ce dernier va charger Label Studio et ouvrir l'interface de labellisation.

### Connexion à votre compte

Si la page de connexion s'affiche, **connectez-vous à votre compte** précédemment créé.

1. Dans l'onglet **LOG IN**, entrez votre email et mot de passe précédemment configurés.
2. Cliquez sur **LOG IN** pour vous connecter à votre compte et ouvrir l'interface de labellisation.

Si vous avez oublié vos identifiants, créez un nouveau compte avec un autre email dans l'onglet **SIGN UP** comme à l'étape 2. Vous aurez toujours accès aux données précedemment labellisées.

### Ouverture du projet

Double-cliquez sur le **nom du projet** dans la page qui s'affiche pour accéder à votre projet de labellisation en cours.

### Commencer à labelliser

Sur la page du projet, cliquez sur le bouton bleu **Label All Tasks** vers le haut, et commencez à labelliser les phrases affichées.

Pour chaque phrase à labelliser, l'interface suivante s'affiche :

![Labeling interface](https://eapi.pcloud.com/getpubthumb?code=XZ4qseZioRovaN4aefYY7iGSKEEFYe0Bzbk&linkpassword=undefined&size=1359x868&crop=0&type=auto)

### Raccourcis pour gagner du temps

Vous pouvez bien sûr utiliser votre souris pour cocher les cases et cliquer sur **Submit**.
Mais vous avez également la possibilité d'**utiliser votre clavier** pour gagner du temps comme ceci :
- les **touches 1 à 6** de votre clavier vous permettent de cocher/décocher les cases comme indiqué entre crochets

-  **Cmd ⌘ + Entrée ⏎** sur Mac ou **Ctrl + Entrée ⏎** sur Windows vous permet de valider et passer au suivant, comme en cliquant sur le bouton **Submit**


### Enregistrement de votre progression

Votre progression est enregistrée **automatiquement** dans votre ordinateur, vous pouvez donc quitter à tout moment (pour faire une pause par exemple) et continuer plus tard, la labellisation reprendra là où vous vous étiez arrêté.

#### Les instructions permettant de quitter Label Studio sont détaillées partie 5.

## 4 - Exporter vos labels

- Une fois que vous avez fini de labelliser toutes les phrases, revenez à la page d'accueil du projet et cliquez sur le bouton **Export** en haut à droite.

- Sélectionnez le format `CSV` et cliquez sur le bouton **Export** en bas à droite.

- **Enregistrez le fichier .csv** à l'emplacement souhaité sur votre ordinateur et envoyez-le par courrier électronique.


## 5 - Quitter Label Studio

Pour quitter Label Studio, **commencez par fermer l'onglet de navigateur** dans lequel Label Studio s'est ouvert. Ensuite :

- sur **MacOS** : 
	- localisez dans votre Dock l'icône de Terminal <img src="https://eapi.pcloud.com/getpubthumb?code=XZNz1eZlwyafjzm34Qquc26R6izl82B7xS7&linkpassword=undefined&size=112x116&crop=0&type=auto" alt="MacOS open" width="36" height="auto">
	- fermez la fenêtre de Terminal en cliquant sur le rond rouge en haut à gauche puis sur **Terminer**
	<img src="https://eapi.pcloud.com/getpubthumb?code=XZYL1eZ0HauGPQXLObzJLBqm9d4DSooLvjk&linkpassword=undefined&size=984x746&crop=0&type=auto" alt="MacOS open" width="360" height="auto">

- sur **Windows** : 
	- localisez dans votre barre des tâches l'icône de Terminal <img src="https://eapi.pcloud.com/getpubthumb?code=XZgL1eZwDiVkwijKfzXWkQLwj1xpRn7YA2V&linkpassword=undefined&size=50x40&crop=0&type=auto" alt="MacOS open" width="36" height="auto">
	- fermez la fenêtre de Terminal en cliquant sur la croix rouge en haut à droite
	<img src="https://eapi.pcloud.com/getpubthumb?code=XZxL1eZL2FcxwGNmVYR4LJEWIb5t7iQRXlk&linkpassword=undefined&size=999x518&crop=0&type=auto" alt="MacOS open" width="520" height="auto">