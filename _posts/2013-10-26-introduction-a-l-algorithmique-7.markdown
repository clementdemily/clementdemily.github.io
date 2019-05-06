---
layout: post
status: publish
published: true
title: Introduction à l'algorithmique 7 - Calculer le PGCD de deux nombres
author:
  display_name: Clément Demily
  login: cdemily
  email: demily.clement@gmail.com
  url: https://clementdemily.github.io/
author_login: cdemily
author_email: demily.clement@gmail.com
author_url: https://clementdemily.github.io/
wordpress_id: 301
date: "2013-10-26 19:16:51 +0200"
date_gmt: "2013-10-26 17:16:51 +0200"
categories:
  - tutoriel
tags:
  - algorithmique
comments: []
---

Hello ! Aujourd'hui on ne va pas apprendre de nouvelle notion à proprement parler, mais mettre en application toutes celles que nous avons apprises précédemment, à savoir :

- La manipulation de variable (affectation, incrémentation, opérations mathématiques);
- Les structures conditionnelles (et plus généralement les opérateurs conditionnels);
- Les boucles;

Je vous propose donc un algorithme qui vous rappellera quelques cours de mathématique de collège : calculer le **PGCD** d'un nombre !

Avant de se lancer, il est important de se renseigner sur la nature du problème.

<blockquote>
PGCD est l'acronyme de "Plus Grand Commun Diviseur " en ancien français. Il se calcule entre deux nombres (nous choisirons des nombres entiers non nuls)  a et b. Il permet de calculer, comme son nom l'indique, le plus grand diviseur commun de deux nombres.</blockquote>
Au collège, nous avons appris une **méthode** pour le calculer. **L'algorithme d'Euclide**, ça vous rappelle quelque chose ? ;)

Prenons par exemple 70 et 42 ; Calculons le PGCD de ces deux nombres :

70 = 42 \* 1 + 28

42 = 28 \* 1 + 14

28 = **14** \* 2 + 0

Le PGCD de 70 et 42 est **14**. Comment a-t-on fait ? Voici le schéma algorithmique du raisonnement :

<a href="{{ site.base_url }}/img/2013/10/PGCD.png"><img class="aligncenter size-full wp-image-302" alt="algorithme-pgcd" src="{{ site.base_url }}/img/2013/10/PGCD.png" width="418" height="355" /></a>

Cela devrait nous bien nous aider à mettre en place un algorithme ! _Astuce : l'opérateur % (modulo) retourne le reste d'une division._
{% highlight bash %}DÉBUT
ECRIRE "Bonjour, veuillez entrer deux nombres entiers non nuls (a > b)"
LIRE a
LIRE b

    afixe <- a
    bfixe <- b

    SI (a < 1 OU b < 1) OU (a < b) ALORS
        ECRIRE "Mauvaise saisie"
    SINON
        reste <- 1
        TANTQUE reste != 0 FAIRE
            reste <- a % b
            ECRIRE a,",",b,",",reste
            a <- b
            b <- reste
        FINTANTQUE
        ECRIRE "Le PGCD de", afixe, "et de", bfixe, "est", a
    FINSI

FIN
{% endhighlight %}
Une petite explication :

<ol>
 * J'écris les consignes, puis je récupère deux variables *a* et *b*.
 * Je les sauvegarde dans deux autres variables car *a* et b vont être amenés à changer au cours de l'exécution.
 * Le SI permet de contrôler si a et b sont bien conformes aux règles qu'on a fixés.
 * On initialise le reste à 1. On aurait pu très bien utiliser la boucle **RÉPÉTER JUSQU'A** (qui est certainement plus pertinente) mais c'est une affaire de go&ucirc;t !
 * On calcule le modulo de a par b.
 * On remplace a par b, puis b par le reste.
 * On répète jusqu'à trouver un reste nul.
</ol>
Pas si dur que ça finalement ! Je vous invite à essayer de retranscrire d'autres algorithmes mathématiques simples pour vous entraîner.

A demain !
