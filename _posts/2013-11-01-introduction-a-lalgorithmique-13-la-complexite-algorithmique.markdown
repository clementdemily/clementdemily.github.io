---
layout: post
status: publish
published: true
title: Introduction à l'algorithmique 13 - La complexité
  algorithmique
author:
  display_name: Clément Demily
  login: cdemily
  email: demily.clement@gmail.com
  url: https://clementdemily.github.io/
author_login: cdemily
author_email: demily.clement@gmail.com
author_url: https://clementdemily.github.io/
date: "2013-11-01 09:00:11 +0100"
date_gmt: "2013-11-01 07:00:11 +0100"
categories:
  - tutoriel
tags:
  - algorithmique
comments: []
---

Bonjour ! Aujourd'hui nous allons voir quelque chose d'un peu plus théorique que d'habitude : la **complexité algorithmique**.

<blockquote>
Je me permets de faire un aparté : n'étant pas un spécialiste de la **complexité algorithmique**, je ne rentrerai pas dans les détails des opérations mathématiques.</blockquote>
La **complexité algorithmique** est un moyen mathématique de déterminer la performance d'un algorithme en fonction de la taille et de la nature des données.

Pour mesurer cette performance, nous avons besoin d'évaluer le nombre d'opérations élémentaires (affectation, comparaison&hellip;) qui sont effectuées dans l'algorithme étudié.

Il existe quelques configurations caractéristiques pour évaluer un algorithme :

- Le meilleur cas ;
- Le pire des cas ;
- Le cas moyen.

La notation " big oh " est la plus courante. Voici la plupart des notations, par ordre de performance :

- O(1) : temps constant (très bon)
- O(logn) : logarithmique (bon)
- O(n) : linéaire (bon dans certains cas)
- O(n&times;logn) : tris (par échanges)
- O(n&sup2;) : quadratique, polynomial (mauvais)
- O(2n) : exponentiel (problèmes très difficiles)

Ce tableau représente le temps que mettrais un algorithme en O(...) à s'exécuter en fonction de n élément.

<a href="{{ site.base_url }}/img/2013/10/tableau.jpg"><img alt="tableau complexite" src="{{ site.base_url }}/img/2013/10/tableau.jpg" width="759" height="562" /></a>

Une représentation un peu plus graphique:<a href="{{ site.base_url }}/img/2013/10/fonction.jpg"><img class="aligncenter size-full wp-image-342" alt="fonction complexite" src="{{ site.base_url }}/img/2013/10/fonction.jpg" width="693" height="486" /></a>

Je vous propose de regarder ensemble quelques petits exemples pour illustrer tout ça:
{% highlight bash %}DÉBUT
n <- 100
POUR compteur <- 0 JUSQU'À n FAIRE
ECRIRE compteur
FINPOUR
FIN
{% endhighlight %}
La complexité de cet algorithme est en O(n) car il faut n instructions pour arriver à la fin de l'algorithme.
{% highlight bash %}DÉBUT
n <- 100
POUR i <- 0 JUSQU'À n FAIRE
POUR j <- 0 JUSQU'À n FAIRE
ECRIRE "i:", i,"j:",j
FINPOUR
FINPOUR
FIN
{% endhighlight %}
Voici une complexité de O(n&sup2;), de manière générale, les boucles imbriquées sont en O(n&sup2;).
{% highlight bash %}DÉBUT
n <- 100
POUR i <- 0 JUSQU'À 10000 FAIRE
ECRIRE "i:", i
FINPOUR
FIN
{% endhighlight %}
Voici une complexité de O(1), en effet peu importe la taille des données, le nombre d'opérations élémentaires reste constant.
{% highlight bash %}DÉBUT
n <- 20
POUR i <- 0 JUSQU'À n FAIRE
POUR j <- 0 JUSQU'À (n * n) FAIRE
ECRIRE "i:",i, "j:",j
FINPOUR
FINPOUR
FIN
{% endhighlight %}
Cet algorithme est en O(n^3). Regardez bien la condition d'arrêt de la boucle *POUR \*imbriquée: il faut effectuer n&sup2; opérations pour satisfaire la condition.

Pour finir, je vais juste revenir sur l'algorithme du tri à bulles d'hier:

- Dans le meilleurs cas (le tableau est déjà trié) il est en O(n)
- Dans le cas moyen il est en O(n&sup2;)
- Dans le pire des cas il est en O(n&sup2;)

Le fait que cet algorithme est en majorité du temps en O(n&sup2;) fait de lui un "mauvais" algorithme de tri. Nous verrons demain un autre algorithme de tri, théoriquement plus performant que le _tri à bulles_.

<span style="line-height: 1.5;">Voilà ! J'espère que ce billet un peu plus théorique que d'habitude vous a plu, rendez-vous demain pour la suite !</span>
