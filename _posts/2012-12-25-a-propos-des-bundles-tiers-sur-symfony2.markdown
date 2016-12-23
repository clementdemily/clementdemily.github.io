---
layout: post
status: publish
published: true
title: A propos des bundles tiers sur Symfony2
author:
  display_name: Clément Demily
  login: devilslug
  email: demily.clement@gmail.com
  url: http://www.clement-demily.fr
author_login: devilslug
author_email: demily.clement@gmail.com
author_url: http://www.clement-demily.fr
date: '2012-12-25 03:37:41 +0100'
date_gmt: '2012-12-25 01:37:41 +0100'
categories:
- tutoriel
tags:
- PHP
- Symfony2
comments: []
---

Bonsoir à tous,

Voici un petit billet à propos de la recherche et l'installation de bundles tiers sur Symfony2.

Tout d'abord, google est votre ami, la plupart du temps vous trouverez un bundle qui corresponds plus ou moins a votre besoin... Pour les plus flemmard, il existe un "<a title="http://knpbundles.com/" href="http://knpbundles.com/">annuaire</a>" de bundle.

Je vous conseille avant chaque installation de nouveaux bundles de vérifier les dépendances de ceux-ci... Il se peut parfois qu'un bundle (b1) ait une dépendance sur une version antérieur (ou supérieur) à un ou plusieurs bundles(b2,b42) déjà présent dans l'application.Pas de problème... En théorie!

En effet, si ce bundles(b2) a une version donnée, est une dépendance d'un autre bundle (b3), nous sommes coincé!

La seule solution, c'est de jongler avec les versions, voir si une version antérieur ou future satisfait entièrement les dépendances du coté du bundle déjà installé et du bundle que nous voulons installer...

Bref, ça peut être un sacré casse tête!

Pour résumer, pour mettre à jour votre application:

 * Chercher LE bundle qu'il vous faut
 * Faire bien attention à la version du-dit bundle ("dev-master" n'est pas le numéro de version.)
 * Satisfaire les dépendances avec le composer.phar + composer.json (commande update "nomdubundle")
 * Installer le bundle tiers
 * ???
 * Profiter!

 
