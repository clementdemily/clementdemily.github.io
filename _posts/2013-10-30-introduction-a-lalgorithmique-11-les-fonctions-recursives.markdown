---
layout: post
status: publish
published: true
title: Introduction à l'algorithmique 11 - Les fonctions récursives
author:
  display_name: Clément Demily
  login: devilslug
  email: demily.clement@gmail.com
  url: http://www.clement-demily.fr
author_login: devilslug
author_email: demily.clement@gmail.com
author_url: http://www.clement-demily.fr
date: '2013-10-30 09:00:49 +0100'
date_gmt: '2013-10-30 07:00:49 +0100'
categories:
- tutoriel
tags:
- algorithmique
comments: []
---

Bonjour à tous ! Aujourd'hui nous allons reparler des fonctions et plus précisément parler d'un type de fonction : **Les fonctions récursives**.

Jusqu'à présent nous avons créé nos algorithmes de façon **itérative**, au moyen de boucles **POUR**, **TANTQUE**&hellip;

Par définition en informatique, une fonction récursive est une fonction qui s'appelle elle-même.

Je vais reprendre le dernier exemple d'hier, la factorielle itérative (telle que nous l'avions écrite). Je vous propose d'en faire une fonction récursive afin d'illustrer la notion d'aujourd'hui :

Pseudo-code du module principal :
{% highlight bash %}DÉBUT
    ECRIRE FACTORIELLE(4)
FIN
{% endhighlight %}
Pseudo-code du module FACTORIELLE :
{% highlight bash %}ENTRER n
    SI (n = 0) ALORS
        nfac <- 1
    SINON
        nfac <- n * FACTORIELLE(n - 1)
    FINSI
RETOURNER nfac
{% endhighlight %}

 * Le module principal fait appel à la fonction **FACTORIELLE**
 * En fonction de la valeur du paramètre, si *n* est égale à 0 on retourne 1, sinon on retourne le résultat de n * le rappel de la fonction factorielle à n - 1.

Je vous conseille une fois de plus de regarder l'exécution pas à pas pour bien saisir le concept de récursivité ! C'est une notion très intéressante à maitriser.

A Demain !
