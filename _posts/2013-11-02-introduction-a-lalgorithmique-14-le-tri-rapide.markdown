---
layout: post
status: publish
published: true
title: Introduction à l'algorithmique 14 - Le tri rapide
author:
  display_name: Clément Demily
  login: devilslug
  email: demily.clement@gmail.com
  url: http://www.clement-demily.fr
author_login: devilslug
author_email: demily.clement@gmail.com
author_url: http://www.clement-demily.fr
date: '2013-11-02 10:00:21 +0100'
date_gmt: '2013-11-02 08:00:21 +0100'
categories:
- tutoriel
tags:
- algorithmique
comments: []
---

Bonjour à tous! Comme prévu aujourd'hui on va voir un autre algorithme de tri, plus performant que le tri à bulles: il s'agit du "tri rapide" (aussi appelé "Quick sort").

Cet algorithme est un peu plus exotique que celui du tri à bulles, il fait appel à plusieurs notions importantes: notamment la **récursivité**. Si vous n'êtes pas encore à l'aise avec ce concept, je vous invite à revoir <a title="Fonctions récursives" href="{{ site.base_url }}/2013/10/30/introduction-a-lalgorithmique-11-les-fonctions-recursives.html">ce billet</a>.

Le principe de cet algorithme est de placer un "pivot", puis de faire passer les valeurs plus petites que ce pivot à *gauche*et de faire passer les valeurs plus grandes à *droite*de celui-ci.

On appellera cette étape le *partitionnement* du tableau. Cette étape est répétée récursivement, sur tous les sous-tableaux! "diviser pour régner"

Pseudo-code de la fonction principale:

{% highlight bash %}
DéBUT
    tab <- [5, 6, 42, 1, 5, 2, 121, 9, 8, 7, 3, 12, 0, 38, 33, 25, 23, 87, 96]

    ECRIRE "Voici le tableau a trier", tab
    ECRIRE "Voici le tableau trié", QUICK_SORT(tab, 1, COMPTER(tab))
FIN
{% endhighlight %}

Pseudo-code de la fonction PARTITIONNER:

{% highlight bash %}
ENTRER REFERENCE tab, index_debut, taille
    pivot <- tab[index_debut]
    index_gauche <- p - 1
    index_droite <- taille + 1
    boucler <- 1

    TANTQUE boucler = 1 FAIRE
        RéPéTER
            index_droite <- index_droite - 1
        JUSQU'à tab[index_droite] <= pivot
        RéPéTER
            index_gauche <- index_gauche + 1
        JUSQU'à tab[index_gauche] >= pivot
        SI index_gauche < index_droite ALORS
            tmp <- tab[index_gauche]
            tab[index_gauche] <- tab[index_droite]
            tab[index_droite] <- tmp
        SINON
            boucler <- 0
        FINSI

    FINTANTQUE
RETOURNER index_droite

{% endhighlight %}

Comme expliqué plus haut, le principe de l'algorithme réside en partie dans cette fonction.

J'aimerais juste revenir sur le mot-clé **REFERENCE**. Vous avez du le remarquer: les paramètres des fonctions ne gardent pas les modifications que l'on fait dans le corps de la fonction. Les paramètres sont donc des variables **copiées**depuis la fonction principale. (dans ce cas)

*Le seul moyen que l'on connaissait jusqu'à présent pour récupérer des informations d'une fonction était par la valeur de retour.*

Le mot-clé **REFERENCE** sert à contrer ce problème, maintenant toutes modifications sur la variable "tab" sera répercutée partout dans l'algorithme.

Cet aparté fait, on peut revenir à la suite de l'algorithme!

Pseudo-code de la fonction QUICK_SORT:

{% highlight bash %}
ENTRER tab, index_debut, taille
    SI index_debut < taille ALORS
        index_droite <- PARTITIONNER(tab, index_debut, taille)
        QUICK_SORT(tab, index_debut, index_droite)
        QUICK_SORT(tab, index_droite + 1, taille)
    FINSI
RETOURNER tab
{% endhighlight %}

J'ai essayé de donner un nom clair à mes variables, afin que ça soit le plus simple possible à comprendre.

Je vous conseille une fois de plus de regarder **l'exécution pas à pas** pour bien tout comprendre.

Un mot sur la complexité algorithmique du tri rapide:

 * Pour le meilleurs des cas (tableau trié): O(n)
 * Pour un cas moyen: O(nlog(n))
 * Pour le pire des cas: O(n&sup2;)

En vérité, la complexité algorithmique varie beaucoup selon la manière de la sélection du pivot: pour une sélection arbitraire, la complexité algorithmique tend plus vers le O(n&sup2;). En revanche, pour un pivot aléatoire ou un pivot optimal, la complexité algorithmique passe en O(nlog(n)).

<blockquote>
La récursivité est certainement l'une des notions les plus délicates à appréhender. C'est un peu "mystique" au début mais à force, on s'y habitue!
</blockquote>

Je vous propose de voir demain un problème algorithmique très connu!

A demain!
