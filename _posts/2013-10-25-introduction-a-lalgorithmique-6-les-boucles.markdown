---
layout: post
status: publish
published: true
title: Introduction à l'algorithmique 6 - Les boucles
author:
  display_name: Clément Demily
  login: cdemily
  email: demily.clement@gmail.com
  url: https://clementdemily.github.io/
author_login: cdemily
author_email: demily.clement@gmail.com
author_url: https://clementdemily.github.io/
wordpress_id: 268
date: "2013-10-25 19:31:27 +0200"
date_gmt: "2013-10-25 17:31:27 +0200"
categories:
  - tutoriel
tags:
  - algorithmique
comments: []
---

Et voilà, nous y sommes ! Voici le premier mur auquel se confronte toutes personnes ayant appris un jour l'algorithmique, j'ai nommé les** boucles**.

Qu'est-ce qui se cache derrière ce vilain mot ? Je ne vais pas vous le dire de suite. Je vais juste poser un problème.

Imaginez que pour une raison quelconque, que vous ayez besoin d'écrire les chiffres **de 0 à 9** avec un retour à la ligne entre chaque chiffre. Avec ce qu'on a appris jusqu'à présent, la seule solution serait d'écrire successivement dix fois la fonction **ECRIRE** en commençant par **0** et en finissant par **9**. ça me semble réalisable. Malheureusement, une autre raison vous impose d'écrire les chiffres **de 0 à 9999** (toujours avec un retour à la ligne entre chaque chiffre). Ce n'est plus la même histoire ! Ecrire **10.000 lignes** de _pseudo-code_ pour ce genre de tâche est inconcevable !

C'est pour ce genre de problème que les **boucles** ont été inventées. Il existe trois types de boucles, ayant tous la même fonction à quelques subtilités près :

- La boucle **TANTQUE** 'conditions' **FAIRE &hellip; FINTANTQUE **;\*\*
- Cette boucle répétera le bloc de _pseudo-code _(entre le _FAIRE_ et le _FINTANTQUE_) tant que les _conditions_ seront **vraies**.

<a style="line-height: 1.5;" href="{{ site.base_url }}/img/2013/10/while.gif"><img class="aligncenter" alt="boucle tant que" src="{{ site.base_url }}/img/2013/10/while.gif" width="231" height="297" /></a><a href="{{ site.base_url }}/img/2013/10/flowchart_structure_loop.png">
</a>

- La boucle **RÉPÉTER **&hellip; **JUSQU'À \***conditions ;* Cette boucle répétera le bloc de *pseudo-code *(entre le *REPETER *et le *JUSQU'À)* jusqu'à ce que les *conditions* deviennent **vraies**. La réelle différence entre la boucle *TANTQUE* et *REPETER JUSQU'À\* est que cette dernière exécute le bloc de code au **moins une fois** (les conditions étant testées à la fin de l'exécution du bloc).

<a style="line-height: 1.5;" href="{{ site.base_url }}/img/2013/10/flowchart_structure_loop.png"><img class="aligncenter" alt="boucle repeter jusqu'a" src="{{ site.base_url }}/img/2013/10/flowchart_structure_loop.png" width="266" height="398" /></a>

- La boucle **POUR \***variable = valeur initiale **_JUSQU'À _**valeur finale **\*FAIRE &hellip; FINPOUR**; La boucle POUR est certainement la boucle la plus facile à appréhender : en effet, on définit une variable ayant une valeur initiale, puis on boucle jusqu'à ce que cette variable atteigne la valeur finale.

<a style="line-height: 1.5;" href="{{ site.base_url }}/img/2013/10/flowchart_structure_for_loop.png"><img class="size-full wp-image-274 aligncenter" alt="boucle pour" src="{{ site.base_url }}/img/2013/10/flowchart_structure_for_loop.png" width="245" height="592" /></a>

Reprenons notre exemple de tout à l'heure, comptons de 0 à 9 avec l'aide de la boucle **TANTQUE **!
{% highlight bash %}DÉBUT
COMPTEUR <- 0
TANTQUE COMPTEUR < 10 FAIRE
ECRIRE COMPTEUR
FINTANTQUE
FIN
{% endhighlight %}
Mmh ? Il y a un problème ? Vous ne voyez que des 0 à l'infini ? C'est normal ! Je vous ai délibérément donné un code <span style="text-decoration: underline;">incomplet</span>. Vous venez d'expérimenter votre première **boucle infinie **!

Mais qu'est-ce qui cloche au juste ? Si vous regardez bien le bloc au c&oelig;ur de la boucle, la variable *COMPTEUR *n'est pas modifiée, et donc par conséquent **la condition d'arrêt** n'est jamais atteinte ! Il faut donc ajouter **1** a cette variable, et ce à chaque tour de boucle ! L'action d'augmenter la valeur d'une variable de **1** est appelée **incrémentation**.

**La boucle infinie** un problème qui va être très récurent lors de vos premières expériences en programmation. Je préfère vous mettre face à l'erreur tout de suite, pour que vous sachiez à quoi vous en tenir pour la suite ! Corrigeons ça toute de suite !
{% highlight bash %}DÉBUT
COMPTEUR <- 0
TANTQUE COMPTEUR < 10 FAIRE
ECRIRE COMPTEUR
COMPTEUR <- COMPTEUR + 1
FINTANTQUE
FIN
{% endhighlight %}
C'est quand même beaucoup mieux ! Je vous invite à faire une exécution pas à pas (la flèche verte la plus à droite) pour comprendre exactement ce qu'il se passe.

Je ne vais pas vous mentir, **même les développeurs expérimentés** font encore ce genre d'erreur, bien que ça ne soit pas aussi évident a **débugger** à chaque fois !

Pour mettre en pratique la boucle **RÉPÉTER JUSQU' À**, je vous propose de reprendre l'algorithme du menu d'hier et de l'adapter pour qu'il ne quitte qu'après avoir saisie l'une des 6 possibilités offertes à l'utilisateur :
{% highlight bash %}DÉBUT
ECRIRE "Bonjour, veuillez séléctionner le plat que vous désirez: (1-6)"
ECRIRE "1. Pâtes à la bolognaise"
ECRIRE "2. Steak Frites"
ECRIRE "3. Pizza"
ECRIRE "4. Hot-Dog"
ECRIRE "5. Soupe"
ECRIRE "6. Quitter"
ENCORE <- 1
RÉPÉTER

LIRE PLAT

       SÉLECTIONNER PLAT
            '1' : RESULTAT <- "Des pâtes? Pas de problème!"
            ENCORE <- 0
            '2' : RESULTAT <- "Saignant le steak?"

           ENCORE <- 0

           '3' : RESULTAT = "Et une bonne pizza, une!"
            ENCORE <- 0
            '4' : RESULTAT <- "Miam un bon Hot-dog!"
            ENCORE <- 0
            '5' : RESULTAT <- "Une bonne soupe maison, il n'y a que ça de vrai!"
            ENCORE <- 0
            '6' : RESULTAT <- "Rien du tout?"
            ENCORE <- 0
         SINON
            RESULTAT <- "Veuiller saisir un chiffre entre 1 et 6."

    FINSÉLECTIONNER

    ECRIRE RESULTAT

JUSQU'À ENCORE = 0
FIN
{% endhighlight %}
Explication :

- L'habituelle fonction **ECRIRE** toujours au rendez-vous qui présente le menu à l'utilisateur.
- On peut voir que j'initialise une variable _ENCORE_ à 1. Nous verrons pourquoi par la suite.
- On voit le début de la boucle **RÉPÉTER JUSQU'**À\***\* ; ce qui veut dire que le bloc entre **RÉPÉTER** et **JUSQU'**À\*\*** sera répété. Il faut directement aller jusqu'au mot-clef **JUSQU'**À\*\* **pour voir la **condition d'arrêt\*\* que j'ai choisi : ENCORE = 0 ;
- Le bloc de _pseudo-code_ contenu dans la boucle à proprement parler fonctionne exactement comme l'algorithme de base d'hier, mise à part qu'on a ajouté une instruction pour les cas valides de saisies (1-6) : ENCORE <- 0 ; Ce qui veut dire que pour chaque cas valide, nous allons changer la valeur de ENCORE pour la faire basculer à 0.
- On écrit la valeur de la variable _RESULTAT._
- Un <span style="text-decoration: underline;">test </span>est effectué, si la variable *ENCORE *vaut 0, alors on peut s'arrêter ; sinon on est reparti pour un tour ! :)

Enfin, je vous propose de voir la boucle **POUR.** Et si on faisait un peu de math ? Les tables de multiplication par exemple ? Je vous propose en exercice de faire un algorithme qui nous demande un chiffre compris entre 1 et 10 (inclus) et qui affiche la table de multiplication de celui-ci. Cela ne devrait pas poser trop de problèmes si vous avez été bien suivis les derniers articles !

&hellip; Déjà fini ? Eh bien ! Voyons la correction ensemble !
{% highlight bash %}DÉBUT
ECRIRE "Bonjour, veuillez entrer un nombre entre 1 et 10"
LIRE NOMBRE

    SI NOMBRE > 0 ET NOMBRE < 11 ALORS
    POUR COMPTEUR <- 1 JUSQU'À 10 INCRÉMENT 1 FAIRE
        ECRIRE NOMBRE, "*", COMPTEUR, "=", NOMBRE * COMPTEUR
    FINPOUR

    SINON
        ECRIRE "mauvaise saisie"
    FINSI

FIN
{% endhighlight %}
Je vais passer très brièvement sur cet algorithme, les deux lignes qui nous intéressent sont la ligne du **POUR** et le bloc compris dans la boucle.

- Dans un premier temps, je vérifie que le chiffre saisie par l'utilisateur est bien compris entre 1 et 10.
- La syntaxe de la boucle **POUR** est assez particulière ; on crée une variable _COMPTEUR_, que nous **initialisons à 1**, nous définissons la valeur que doit avoir la variable pour arrêter de boucler (**10**) puis nous fixons l'**incrémentation à 1**.
- Pour la ligne suivante, je fais appel à la fonction **ECRIRE** en **concaténant** les différentes informations.
  Et voilà ! S'en est fini des boucles, sur ce je vous laisse vous entraîner afin de les maitriser sur le bout des doigts. ;)

A demain !
