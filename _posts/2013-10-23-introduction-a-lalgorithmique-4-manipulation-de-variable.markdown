---
layout: post
status: publish
published: true
title: Introduction à l'algorithmique 4 - Manipulation de variable
author:
  display_name: Clément Demily
  login: cdemily
  email: demily.clement@gmail.com
  url: https://clementdemily.github.io/
author_login: cdemily
author_email: demily.clement@gmail.com
author_url: https://clementdemily.github.io/
date: "2013-10-23 18:57:48 +0200"
date_gmt: "2013-10-23 16:57:48 +0200"
categories:
  - tutoriel
tags:
  - algorithmique
comments: []
---

Bonjour à tous ! Aujourd'hui nous allons nous amuser un peu avec les variables.

Cela ne nous vous rappelle rien ? Mais si ! Souvenez-vous, j'en ai parlé <a title="Introduction à algorithmique 2 - Quelques notions" href="{{ site.base_url }}/2013/10/23/introduction-a-lalgorithmique-2/">**ici**</a> ! \*\* \*\*

<blockquote>
<span style="text-decoration: underline;">Un petit rappel</span> : une variable est une entité qui nous permettra de stocker des informations. Il y a plusieurs types de variable, celles qui contiennent du texte, celles qui contiennent des nombres&hellip;</blockquote>
Je vous propose de créer une variable, de lui affecter une valeur&hellip; disons le nombre **42 **!
{% highlight bash %}DÉBUT
	NOMBRE_A_AFFICHER <- 42
	ECRIRE NOMBRE_A_AFFICHER
FIN
{% endhighlight %}
<blockquote>
Sachez que le nom de la variable n'impacte pas avec le type de celle-ci&hellip; On pourrait très bien nommer nos variables a, b, c&hellip; mais vous avouerez que ce n'est pas très explicite !</blockquote>
Très bien ! La console nous affiche bien **42** ! Vous l'avez constaté, l'opérateur d'affectation se lit de <span style="text-decoration: underline;">droite à gauche</span>. Lorsque nous créons une variable, on dit qu'on **initialise** celle-ci.

Bon, et si on allait un peu plus loin ? On va utiliser la fonction **LIRE** pour rendre notre programme plus interactif puis nous utiliserons **l'opérateur mathématique \*** pour multiplier notre saisie par **deux**.
{% highlight bash %}DÉBUT
ECRIRE "Bonjour, veuillez taper un chiffre "
LIRE NOMBRE
NOMBRE_MULTIPLIE <- NOMBRE \* 2
ECRIRE "Voilà le nombre multiplié par 2 = ", NOMBRE_MULTIPLIE
FIN
{% endhighlight %}
Une petite explication s'impose :

<ol>
 * Dans un premier temps, nous affichons *la chaine de caractères* qui invite l'utilisateur à entrer un chiffre à l'aide de la fonction **ECRIRE**.
 * Nous récupérons ce que l'utilisateur a entré et nous la stockons dans la variable NOMBRE  grâce à la fonction **LIRE**.
 * N'oubliez pas, l'opérateur d'affectation se lit de droite à gauche : *NOMBRE* (qui comporte la valeur du nombre entrée par l'utilisateur) est multiplié par *2* ; Le résultat est ensuite affecté dans la variable *NOMBRE_MULTIPLIE*
 * Pour finir nous affichons la variable, *concaténé* avec un petit texte.
</ol>
Vous avez tout compris ! Parfait ! Je vous propose de faire un petit exercice de votre côté ;

Sur le modèle du dernier _pseudo-code_, faites en sorte de laisser l'utilisateur choisir les deux nombres qui seront multipliés&hellip; Bon courage !

A demain !
