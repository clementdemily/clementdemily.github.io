---
layout: post
status: publish
published: true
title: Introduction à l'algorithmique 8 - Les tableaux
author:
  display_name: Clément Demily
  login: cdemily
  email: demily.clement@gmail.com
  url: https://clementdemily.github.io/
author_login: cdemily
author_email: demily.clement@gmail.com
author_url: https://clementdemily.github.io/
date: "2013-10-27 19:47:15 +0100"
date_gmt: "2013-10-27 17:47:15 +0100"
categories:
  - tutoriel
tags:
  - algorithmique
comments: []
---

Hello ! Aujourd'hui nous allons parler des **tableaux**.

Un tableau est une structure de données élémentaire où chaque cellule est du même type.

Ce charabia veut dire qu'un tableau ne pourra contenir que des entiers, que des réels, que des chaînes de caractères. Chaque valeur est accessible à l'aide d'un **indice**.

<a href="{{ site.base_url }}/img/2013/10/Tableau_à_une_dimension.png"><img class="aligncenter size-full wp-image-308" alt="tableau" src="{{ site.base_url }}/img/2013/10/Tableau_à_une_dimension.png" width="697" height="230" /></a>

Comme pour les _boucles_, je vais vous présenter un problème pour introduire cette nouvelle notion.

On vous demande dans un programme de calculer une moyenne basée sur des notes. Chaque note sera contenue dans une variable. Dans notre _pseudo-code_, nous aurions à déclarer autant de variables que de notes comme ici :
{% highlight bash %}DÉBUT
note_a <- 17
note_b <- 20
note_c <- 11
note_d <- 15
note_e <- 13

    ECRIRE "La moyenne des notes 17, 20, 11, 15 et 13:"
    moyenne <- (note_a + note_b + note_c + note_d + note_e) / 5
    ECRIRE moyenne

FIN
{% endhighlight %}
Voici le même _pseudo-code_ avec l'utilisation d'un tableau :
{% highlight bash %}DÉBUT
notes <- [17, 20, 11, 15, 13]
moyenne <- 0

    POUR compteur = 1 JUSQU'À COMPTER(notes) FAIRE
        moyenne <- moyenne + notes[compteur]
    FINPOUR

    moyenne <- moyenne / COMPTER(notes)
    ECRIRE moyenne

FIN
{% endhighlight %}

- La fonction **COMPTER** nous sert à compter le nombre d'élément d'un tableau.
- Je me sers de la boucle POUR pour boucler sur mon tableau. Je stocke dans la variable _moyenne_ toutes les notes additionnées ensemble.

ça peut paraitre plus compliqué au premier abord, mais très pratique à l'utilisation !

<blockquote>
! ATTENTION !Sur LARP vous pouvez constater que l'indice d'un tableau commence à 1. Or, dans la majorité (si ce n'est la totalité) des langages de programmation l'indice d'un tableau commence à 0. Soyez donc vigilent quand vous manipulerez des tableaux à l'avenir.
</blockquote>
A demain !
