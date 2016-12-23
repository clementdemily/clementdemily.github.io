---
layout: post
status: publish
published: true
title: Introduction à l'algorithmique 9 - Les tableaux multidimensionnel
author:
  display_name: Clément Demily
  login: devilslug
  email: demily.clement@gmail.com
  url: http://www.clement-demily.fr
author_login: devilslug
author_email: demily.clement@gmail.com
author_url: http://www.clement-demily.fr
date: '2013-10-28 21:09:23 +0100'
date_gmt: '2013-10-28 19:09:23 +0100'
categories:
- tutoriel
tags:
- algorithmique
comments: []
---

Bonjour ! Aujourd'hui nous allons encore nous pencher sur les tableaux, mais en compliquant un peu plus les choses.

Hier nous avons vu qu'un tableau était une structure de données permettant de stocker une suite de valeurs du même type (tableau d'entiers, tableau de chaine de caractères&hellip;).

Un tableau multidimensionnel est un tableau&hellip; de tableaux ! Pour imager un peu cette notion, je vous propose de regarder cet échiquier:

<img class="aligncenter size-full wp-image-317" alt="echiquier" src="{{ site.base_url }}/img/2013/10/echiquier_0.jpg" width="600" height="610" />

Pour un tableau unidimensionnel, on stocke une ligne. Dans un tableau multidimensionnel, on stocke les tableaux de ligne.

Voici la syntaxe si on souhaite accéder à la tour noire en (0,0) : *Echiquier[0][0]*. La première paire de crochets permet de se positionner à l'indice 0 de notre échiquier. Nous avons donc sélectionné la première ligne, ensuite la deuxième paire de crochets nous positionne à l'indice 0 (la colonne).

Je n'ai malheureusement pas d'idée d'application à mettre en avant pour aujourd'hui. Laisser un commentaire si vous en avez une !

A demain !
