---
layout: post
status: publish
published: true
title: Introduction à l'algorithmique 12 - Le tri à bulles
author:
  display_name: Clément Demily
  login: devilslug
  email: demily.clement@gmail.com
  url: http://www.clement-demily.fr
author_login: devilslug
author_email: demily.clement@gmail.com
author_url: http://www.clement-demily.fr
date: '2013-10-31 09:00:52 +0100'
date_gmt: '2013-10-31 07:00:52 +0100'
categories:
- tutoriel
tags:
- algorithmique
comments: []
---

Bonjour à tous ! Aujourd'hui nous allons aborder notre premier algorithme de tri ! Grâce à cet algorithme nous allons revoir les notions suivantes : Les structures conditionnelles, les boucles, les tableaux et les fonctions. C'est un bon exercice !

Tout d'abord, un algorithme de tri permet de trier une structure de données (ici un tableau). Le tri à bulles et l'un des algorithmes de tri les plus connu, son principe est simple.
<ol>
 * L'algorithme parcourt le tableau et compare des pairs de valeurs. (tab[0] et tab[1], puis tab[1] et tab[2]&hellip;)
 * Lorsque deux éléments successifs ne sont pas dans l'ordre, on les échanges.
 * Après chaque parcours complet du tableau, l'algorithme vérifie si des variables ont été échangées. Si oui, alors l'algorithme refait un parcours entier. Si non, alors ça veut dire que le tableau est trié.
</ol>
Je vous propose une petite vidéo et un schéma qui illustrerons mieux ce principe (vous pouvez couper le son&hellip; :p )

<iframe width="560" height="315" src="https://www.youtube.com/embed/Ns4TPTC8whw" frameborder="0" allowfullscreen></iframe>

<img class="aligncenter size-full wp-image-327" alt="tri à bulle" src="{{ site.base_url }}/img/2013/10/bubble.gif" width="281" height="391" />

Vous devez avoir une vague idée de la manière dont on va s'y prendre pour le faire, n'est-ce pas ? Aller, on se lance !

Pseudo-code du module principal :
{% highlight bash %}DÉBUT
    atrier <- [6, 5, 1, 2, 8, 9, 3, 7, 4]
    ECRIRE "Voici le tableau a trier: ", atrier
    ECRIRE "Voici le tableau trié:", TRI_A_BULLES(atrier)
FIN
{% endhighlight %}
Pseudo-code du module TRI_A_BULLES
{% highlight bash %}ENTRER tab
    echange <- 1
    TANTQUE echange = 1 FAIRE
           echange <- 0
           POUR compteur = 1 JUSQU'À COMPTER(tab) - 1 FAIRE
               SI tab[compteur] > tab[compteur + 1] ALORS
                    tmp <- tab[compteur + 1]
                    tab[compteur + 1] <- tab[compteur]
                    tab[compteur] <- tmp
                    echange <- 1
               FINSI
           FINPOUR
    FINTANTQUE
RETOURNER tab
{% endhighlight %}
L'algorithme du tri à bulles est l'un des premiers vrais algorithmes que vous apprendrez en cours de programmation. Toutefois sa **complexité** informatique est élevée. Nous verrons ce que cela signifie&hellip; demain !
