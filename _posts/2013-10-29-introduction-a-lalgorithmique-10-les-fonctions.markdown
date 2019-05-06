---
layout: post
status: publish
published: true
title: Introduction à l'algorithmique 10 - Les fonctions
author:
  display_name: Clément Demily
  login: cdemily
  email: demily.clement@gmail.com
  url: https://clementdemily.github.io/
author_login: cdemily
author_email: demily.clement@gmail.com
author_url: https://clementdemily.github.io/
date: "2013-10-29 21:58:09 +0100"
date_gmt: "2013-10-29 19:58:09 +0100"
categories:
  - tutoriel
tags:
  - algorithmique
comments: []
---

Bonjours à tous ! Aujourd'hui nous allons parler des fonctions.

J'avais déjà introduit le terme fonction dans <a title="cet article" href="/2013/10/21/introduction-a-lalgorithmique-2">cet article</a>, un petit rappel:

<blockquote>
Une fonction est un bloc de pseudo-code. Elle est souvent assimilée à une tâche bien distincte du reste du programme et renvoie généralement une valeur.</blockquote>
Une fonction prend en général une ou plusieurs variables, appelées **paramètre**.
<blockquote>
*Afin de créer une fonction, vous allez devoir créer un module. Après avoir ouvert le logiciel LARP puis ouvert un nouveau projet pseudo-code, créer un nouveau module : sur la gauche du logiciel dans le panneau "Navigateur", clique droit, nouveau module. Nommer le " MOYENNE ".*</blockquote>
Je vous propose de voir un exemple tout de suite en reprenant le principe du calcul de la moyenne :

Pseudo-code du module principal:
{% highlight bash %}DÉBUT
notes <- [20, 15]
ECRIRE MOYENNE(notes)
FIN
{% endhighlight %}
Pseudo-code du module MOYENNE:
{% highlight bash %}ENTRER tab
moy <- 0
POUR compteur <- 1 JUSQU'À COMPTER(tab) FAIRE
moy <- moy + tab[compteur]
FINPOUR
moy <- moy / COMPTER(tab)
RETOURNER moy
{% endhighlight %}

- L'exécution commence dans le module principal, on demande d'écrire le résultat de la fonction **MOYENNE** qui **prend en paramètre** un tableau d'entiers.
- Nous arrivons au module **MOYENNE** : le mot-clé **ENTRER** introduit le début de la fonction ainsi que les paramètres fournis en entré.
- Nous calculons la moyenne à l'aide d'une boucle, comme nous l'avons vu il y a quelques jours.
- On retourne la moyenne et on clôture la fonction par la même occasion à l'aide du mot-clé **RETOURNER**.
- On revient sur le module principal, qui écrit donc le résultat de la fonction **MOYENNE**.

Je vous conseille de faire une exécution pas à pas pour vraiment bien comprendre tout ce qu'il se passe.

Les variables contenues dans les fonctions ne sont pas accessibles depuis bloc d'exécution principale. Le " scope " n'est pas le même ;

Je vous propose de faire un petit exercice :

<blockquote>
Faites une fonction qui calculera la factorielle d'un nombre entier positif. Rappel : factorielle(0) = 1 ; factorielle(4) = 4*3*2*1 = 24.</blockquote>
Pseudo-code du module principal:
{% highlight bash %}DÉBUT
     ECRIRE FACTORIELLE(4)
FIN
{% endhighlight %}
Pseudo-code du module FACTORIELLE
{% highlight bash %}ENTRER n
    SI (n > 1) ALORS
        POUR compteur = 1 JUSQU'À (n - 1) FAIRE
            n <- n * compteur
        FINPOUR
    SINON
        n <- 1
    FINSI
RETOURNER n
{% endhighlight %}
Parfait ! Ce dernier exemple servira de tremplin pour le sujet de demain, les **fonctions récursives** !

À demain !
