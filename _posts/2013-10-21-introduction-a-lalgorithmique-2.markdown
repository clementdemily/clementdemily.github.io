---
layout: post
status: publish
published: true
title: Introduction à l'algorithmique 2 - Quelques notions-clé
author:
  display_name: Clément Demily
  login: devilslug
  email: demily.clement@gmail.com
  url: http://www.clement-demily.fr
author_login: devilslug
author_email: demily.clement@gmail.com
author_url: http://www.clement-demily.fr
date: '2013-10-21 03:07:13 +0200'
date_gmt: '2013-10-21 01:07:13 +0200'
categories:
- tutoriel
tags:
- algorithmique
comments: []
---

Hello! On va commencer par voir aujourd'hui quelques notions basique, propre à l'algorithmique:

 * <span style="text-decoration: underline;">Les fonctions (ou procédures)</span>:  on peut assimiler une fonction à la réalisation d'une tâche. ça veut dire qu'une fonction pourra décrire toute les actions élémentaires nécessaire a la réalisation de cette tâche.
 * <span style="text-decoration: underline;">Les constantes</span>: ça peut être un chiffre, une lettre, un mot... Bref, une entité quelconque qui ne changera pas lors de l'exécution  de notre algorithme.
 * <span style="text-decoration: underline;">Les variables</span>: c'est une entité qui permettra de stocker des chiffres, lettres... les valeurs des variables changeront pendant l'exécution de notre algorithme.

Nous allons nous concentrer sur les *constantes et les variables.* Celles-ci peuvent prendre différentes formes:

 * Un entier (42, -6000...);
 * Un Réel (1.45...);
 * Un booléen (Vrai **OU **Faux <=> 1 **OU** 0);
 * Un caractère ('a', 'b' ... );
 * Une chaîne de caractère ("biscuit"...);

Pour manipuler ces entités, nous allons utiliser des **opérateurs**. Ils se décomposent en plusieurs types:

 * <span style="text-decoration: underline;">Arithmétique</span>:

 * Addition **+** ;
 * Soustraction **-** ;
 * Multiplication *****;
 * Puissance **^**;
 * Division **/**;
 * modulo (c'est une division entière avec reste) **%;**


 * <span style="text-decoration: underline;">Comparaison</span>:

 * Supérieur **>**;
 * Supérieur ou égal **>=**;
 * Inférieur **<**;
 * Inférieur ou égal **<=**;
 * Strictement égal **==**;
 * Strictement Différent **!=**;


 * <span style="text-decoration: underline; line-height: 1.5;">Opérateur d'affectation:</span>

 * <- ; cet opérateur permettra d'affecter une valeur dans variable.


 * <span style="line-height: 1.5;"><span style="text-decoration: underline;">Fonction logique</span>: </span>

 * ET, OU, OUX, NON, NON ET, NON OU, <<, >>;



Ces derniers opérateurs méritent d'être éclaircis (ceux qui ont fait de l'électronique ne vont pas être dépaysés). Voici ce qu'on appelle une "table de vérité":

<a href="{{ site.base_url }}/img/2013/10/Table_de_verite_du_circuit_ET1.gif"><img class="size-full wp-image-223 aligncenter" alt="tableau-et" src="{{ site.base_url }}/img/2013/10/Table_de_verite_du_circuit_ET1.gif" width="262" height="189" /></a>

Ces tables permettent de connaitre le résultat de sortie en fonction des deux entrées et de l'opération logique appliquée. Rassurez-vous, vous allez vite comprendre!

Reprenons ma fameuse recette de steak frite de l'article précédent; Pour réussir la recette, il nous faut un steak **ET** des pommes de terre. En terme algorithmique, on pourrait commencer notre **fonction** par une **condition**: *Si* j'ai un steak **et** des pommes de terres, *alors* je peux commencer a cuisiner... (bon en vérité il faut aussi une friteuse, une poêle... mais là n'est pas la question!)

Dans la grande majorité des cas, vous utiliserez le **ET** logique et le **OU **logique.

Pour le prochain article, nous aborderons *les fonctions LIRE et ECRIRE.*
