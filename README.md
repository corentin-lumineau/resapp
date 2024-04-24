# README

Bienvenue sur l'application Resapp !

Cette application permet de scrapper les informations d'un fichier csv pour créer des rapports et visualiser ainsi un ensemble de KPI.

## Configuration requise

- Ruby 2.7.4
- Ruby on Rails 7.0.8
- PostgrSQL 1.1

## Installation

1. Clonez le dépôt GitHub :

```
git clone git@github.com:corentin-lumineau/resapp.git
```

2. Installez les gemmes Ruby requises :

```
bundle install
```

3. Migration de la base de données :

```
rails db:migrate
```

4. Lancer un serveur local sur le port 3000 :

```
rails s
```

## Utilisation

Vous êtes invité à fournir un fichier csv en entrée. Lorsque votre fichier sera uploadé, vous serez automatiquement redirigés vers le rapport concernant ce fichier.
Vous pourrez également retrouver l'ensemble des rapports déjà enregistrés dans la secction "Mes rapports".

## Test

Ce projet bénéficie de quelques tests unitaires pour assurer le bon fonctionnement du modele Report.
Il serait nécessaire d'implémenter un ensemble de tests plus complets pour l'ensemble des modèles, des controlleurs et des services.

Pour lancer les tests de Resapp :

```
bundle exec rspec
```

## Auteur

- [Corentin LUMINEAU](https://github.com/corentin-lumineau/)

## License

Ce project bénéficie de la license MIT.
