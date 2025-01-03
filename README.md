# TP1 Flutter - UE HAI912I
## TP1 - Création d'interfaces graphiques en Flutter

Ce projet contient deux applications développées en Flutter : une application de carte de profil et une application de quiz réalisées dans le cadre du TP1 Flutter du cours HAI912I - Développement mobile avancé, IOT et embarqué à l'Université de Montpellier.

## Auteur 
- **[Eric Gilles](https://github.com/eric-gilles)**

## Applications

### 1. Application de Carte de Profil - [Profile Card App](https://github.com/eric-gilles/FlutterTP1/profile_card)

Cette application affiche plusieurs cartes de profil avec les informations suivantes :
- Nom, prénom, email
- Photo de profil
- Liens vers les réseaux sociaux, etc.

### 2. Application de Quiz - [Quiz App](https://github.com/eric-gilles/FlutterTP1/quiz_app)

Cette application propose un quiz interactif avec les fonctionnalités suivantes :
- Affichage des questions
- Choix de la réponse (oui ou non)
- Affichage de la progression
- Calcul et affichage du score
- Possibilité de recommencer le quiz

## Prérequis

- Flutter SDK: [Installation Guide](https://flutter.dev/docs/get-started/install)
- Dart SDK

## Installation

1. Clonez le dépôt :
    ```bash
    git clone https://github.com/eric-gilles/FlutterTP1
    ```
2. Accédez au répertoire du projet souhaité :
    ```bash
    cd FlutterTP1/[profile_card|quiz_app]
    ```
3. Installez les dépendances :
    ```bash
    flutter pub get
    ```

## Exécution en ligne de commande

Pour exécuter l'application de carte de profil ou l'application de quiz, utilisez la commande suivante dans le répertoire du projet correspondant :

```bash
flutter run -t lib/main.dart
```

## Exécution avec Android Studio

1. Ouvrez le projet de l'application souhaitée avec Android Studio.
2. Sélectionnez un émulateur ou un appareil physique pour exécuter l'application.
2. Exécutez l'application en cliquant sur le bouton "Run" ou en utilisant le raccourci clavier `Shift + F10`.
