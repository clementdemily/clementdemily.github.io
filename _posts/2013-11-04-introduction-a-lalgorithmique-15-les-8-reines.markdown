---
layout: post
status: publish
published: true
title: Introduction à l'algorithmique 15 - Les 8 reines
author:
  display_name: Clément Demily
  login: cdemily
  email: demily.clement@gmail.com
  url: https://clementdemily.github.io/
author_login: cdemily
author_email: demily.clement@gmail.com
author_url: https://clementdemily.github.io/
date: "2013-11-04 10:30:34 +0100"
date_gmt: "2013-11-04 08:30:34 +0100"
categories:
  - tutoriel
tags:
  - algorithmique
comments: []
---

Hello! Nous voici déjà arrivé au 15<sup>ème</sup> article sur l'algorithmique! Je vous propose de fêter ça avec un problème vraiment très populaire: Les 8 reines.

L'une des raisons de sa popularité est du fait qu'il est souvent utilisé en cours d'informatique pour introduire la récursivité... Ne croyez pas que ce problème soit simple pour autant! Surtout si la notion de récursivité est encore un peu vague pour vous.

Bon, rentrons dans le vif du sujet: les 8 reines. Le but de ce problème est de réussir à placer 8 reines d'un jeu d'échecs sur un échiquier classique (8x8 cases) sans que celles-ci ne puissent se menacer.

Pour ceux qui ne connaissent pas les règles des échecs: Chaque pièce se déplace d'une manière différente. La reine peut se déplacer du nombre de cases qu'elle désirs sur une rangée, colonne ou diagonale.

![Mouvement Reine]({{ site.base_url }}/img/2013/11/mouvement_reine..jpg)

Exemple de solution:
![Solution]({{ site.base_url }}/img/2013/11/reine.png)

J'ai trouvé sur le net un petit programme fait en JAVA qui permet de vraiment bien comprendre le déroulement de l'algorithme:

<a title="8 reines" href="http://wwwdi.supelec.fr/fb/downloads/FISDA/HuitReines.jar" target="_blank">
    http://wwwdi.supelec.fr/fb/downloads/FISDA/HuitReines.jar
</a>

En bref: La fonction récursive empile les bons résultats au fur et à mesure qu'une reine supplémentaire peut être placée, a la première erreur, l'algorithme dépile le résultat de la fonction.

On appelle ce type d'algorithme "programmation par contrainte"

Bon, on s'y met?

Pseudo-code de la fonction principale:

{% highlight bash %}
DéBUT
lignes <- [0, 0, 0, 0, 0, 0, 0, 0]
HUIT_REINES(lignes, 1)
FIN
{% endhighlight %}

Pseudo-code de la fonction _HUIT_REINES_
{% highlight bash %}
ENTRER lignes, y
POUR x <- 1 JUSQU'à COMPTER(lignes) FAIRE
SI PEUT_POSER(lignes, x, y) = 1 ALORS
lignes[y] <- x
SI y = 7 ALORS
AFFICHER_ECHIQUIER(lignes)
SINON
HUIT_REINES(lignes, y + 1)
FINSI
FINSI
FINPOUR
RETOURNER
{% endhighlight %}

Pseudo-code de la fonction _PEUT_POSER_
{% highlight bash %}
ENTRER lignes, x, y
boucler <- 1
i <- 1
ret <- 1
TANTQUE i < y ET boucler = 1 FAIRE
SI lignes[y-i] = x OU lignes[y-i] = x-i OU lignes[y-i] = x+i ALORS
boucler <- 0
ret <- 0
FINSI
i <- i + 1
FINTANTQUE
RETOURNER ret
{% endhighlight %}

Pseudo-code de la fonction _AFFICHER_ECHIQUIER_
{% highlight bash %}
ENTRER lignes
output <- ""
ECRIRE "Une solution possible:"
ECRIRE "-------------------------"
POUR y <- 1 JUSQU'à 8 FAIRE
POUR x <- 1 JUSQU'à 8 FAIRE
SI x = lignes[y] ALORS
output <- output + "| Q"
SINON
output <- output + "| "
FINSI
FINPOUR
output <- output + "|"
ECRIRE output
ECRIRE "-------------------------"
output <- ""
FINPOUR
RETOURNER
{% endhighlight %}

à demain!
