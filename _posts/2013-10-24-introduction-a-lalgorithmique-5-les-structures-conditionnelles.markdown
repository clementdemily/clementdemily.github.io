---
layout: post
status: publish
published: true
title: Introduction à l'algorithmique 5 - Les structures conditionnelles
author:
  display_name: Clément Demily
  login: devilslug
  email: demily.clement@gmail.com
  url: http://www.clement-demily.fr
author_login: devilslug
author_email: demily.clement@gmail.com
author_url: http://www.clement-demily.fr
date: '2013-10-24 00:16:39 +0200'
date_gmt: '2013-10-23 22:16:39 +0200'
categories:
- tutoriel
tags:
- algorithmique
comments: []
---

Bonjour ! Aujourd'hui nous allons aborder les premières difficultés de l'algorithmique : Les structures conditionnelles !
<blockquote>
<span style="text-decoration: underline;">Rappel</span> : nous allons avoir besoin des opérateurs logique pour continuer, je vous invite à jeter un rapide coup d'&oelig;il <a title="Introduction à l'algorithmique 2 - Quelques notions-clé" href="{{ site.base_url }}/2013/10/21/introduction-a-lalgorithmique-2/">ici</a>, partie opérateurs de comparaison et opérateurs logique.</blockquote>
<span style="text-decoration: underline;">Qu'est-ce que c'est ?</span> C'est une **instruction **qui permet de tester si une condition est **VRAIE** ou **FAUSSE** (en informatique ça se traduit par **1** ou **0**).

<span style="text-decoration: underline;">A quoi ça sert ?</span> Cela va nous permettre d'adapter le comportement de notre algorithme en fonction de la valeur de nos variables.

<span style="text-decoration: underline;">A quoi ça ressemble </span>? Il existe deux syntaxes la plus commune étant le **SI ***conditions* **ALORS **&hellip; **FINSI **; L'autre étant plus rare, j'en donnerai un exemple plus tard dans cet article.

Plutôt que de me lancer dans de longues explications, je vous propose de voir ensemble un petit bout de *pseudo-code* :
{% highlight bash %}DÉBUT
    ECRIRE "Quel est votre âge?"
    LIRE AGE
    SI AGE >= 18 ALORS
        ECRIRE "Vous êtes majeur!"
    SINON
        ECRIRE "Vous êtes mineur!"
    FINSI
FIN
{% endhighlight %}
Analysons ça ensemble :
<ol>
 * Vous commencez à être familier avec la fonction **ECRIRE**, je ne vais pas revenir là-dessus ; on affiche juste un texte invitant l'utilisateur à entrer son âge.
 * Nous stockons dans la variable *AGE* la valeur récupérée à l'aide de la fonction **LIRE**
 * Voici le fameux branchement logique ! Vous voyez entre le **SI** et le **ALORS **la **condition **suivante : *AGE* *>= 18*. Au moment où l'ordinateur exécute cette ligne, il **teste** si la valeur contenue dans *AGE* est supérieure ou égale à 18. Si c'est le cas, **alors** on exécute le bloc de *pseudo-code* suivant (entre **ALORS** et **SINON**), **sinon **c'est le bloc de pseudo-code entre **SINON** et **FINSI** qui est exécuté.
</ol>
Vous êtes toujours ici ? Parfait ! Sachez que comprendre les **structures conditionnelles** et les **conditions** est essentielle dans l'algorithmique, n'hésitez pas à vous entrainer.

Je vous propose un autre algorithme pour vous montrer les **structures conditionnelles imbriquées **:
{% highlight bash %}DÉBUT
    ECRIRE "Bonjour, veuillez taper un chiffre en 1 et 3"
    LIRE CHIFFRE
    SI CHIFFRE < 1 OU CHIFFRE > 3 ALORS
        ECRIRE "Ce n'est pas un chiffre entre 1 et 3!"
    SINON
        SI CHIFFRE = 1 ALORS
            ECRIRE "Vous avez tapé le chiffre 1"
        SINON SI CHIFFRE = 2 ALORS
            ECRIRE "Vous avez tapé le chiffre 2"
        SINON
            ECRIRE "Vous avez tapé le chiffre 3"
        FINSI
    FINSI
FIN
{% endhighlight %}
Une petite explication :
<ol>
 * Comme pour l'algorithme précédent, nous demandons a l'utilisateur de saisir une donnée ; en l'occurrence ici c'est un chiffre entre 1 et 3.
 * Cette saisie est stockée dans la variable *CHIFFRE*.
 * La variable *CHIFFRE* est soumise cette fois ci à **deux conditions **! **SI** la valeur de *CHIFFRE* est inférieure à 1 **OU** si la valeur de *CHIFFRE* est supérieure à 3, **ALORS** on informe l'utilisateur que sa saisie est incorrecte.
 * **SINON**, on passe à l'exécution du bloc suivant : à cet endroit, nous savons que la valeur de la variable est bien comprise entre 2 et 3. **SI** la valeur de *CHIFFRE* est **égale** à 1, **ALORS** on écrit sur la console que l'utilisateur à tapé le chiffre 1 **SINON SI** la valeur de *CHIFFRE *est **égale** à 2, **ALORS** on écrit que l'utilisateur a tapé le chiffre 2 (et enfin) **SINON **on écrit tout simplement que l'utilisateur a tapé le chiffre 3.
</ol>
Vous trouvez ça peu lisible et pas forcément compréhensible (de premier abord ?) ? Moi aussi ! Mais heureusement, il existe une structure conditionnelle pour palier a ce genre d'écriture fastidieuse&hellip; et j'ai l'exemple parfait pour illustrer tout ça !
{% highlight bash %}DÉBUT
    ECRIRE "Bonjour, veuillez séléctionner le plat que vous désirez: (1-6)"
    ECRIRE "1. Pâtes à la bolognaise"
    ECRIRE "2. Steak Frites"
    ECRIRE "3. Pizza"
    ECRIRE "4. Hot-Dog"
    ECRIRE "5. Soupe"
    ECRIRE "6. Quitter"
    LIRE PLAT
    SÉLECTIONNER PLAT
        '1' : RESULTAT <- "Des pâtes? Pas de problème!"
        '2' : RESULTAT <- "Saignant le steak?"
        '3' : RESULTAT <- "Et une bonne pizza, une!"
        '4' : RESULTAT <- "Miam un bon Hot-dog!"
        '5' : RESULTAT <- "Une bonne soupe maison, il n'y a que ça de vrai!"
     SINON
        RESULTAT <- "Rien du tout?"
    FINSÉLECTIONNER
    ECRIRE RESULTAT
FIN
{% endhighlight %}
Voyons ensemble :
<ol>
 * 7 appels à la fonction **ECRIRE** ; j'écris le " menu " pour que l'utilisateur soit au courant des possibilités qui s'offrent à lui.
 * On utilise la fonction **LIRE** pour stocker la valeur saisie par l'utilisateur dans la variable *PLAT *;
 * Une nouveauté : La structure conditionnelle **SELECTIONNER **! En observant bien, vous pouvez déduire son fonctionnement. Selon la valeur contenue dans la variable *PLAT*, la structure détermine le bloc de *pseudo-code* qui sera exécuté ; une petite attention sur le **SINON** à la fin : en effet, si la valeur contenu dans la variable *PLAT* ne correspond à aucune des valeurs que nous avons retenu,  alors on exécutera le bloc de pseudo-code entre **SINON** et **FINSELECTIONNER**.  Chacun des blocs exécute le même type d'instruction : on affecte une chaine de caractère à la variable *RESULTAT*.
 * Pour finir, on écrit le contenu de la variable *RESULTAT*.
</ol>
Ouf ! Eh bien, je n'aimerai pas à avoir à faire le même algorithme rien qu'avec des** SI-ALORS-SINON-SI**&hellip; !

J'espère avoir été assez clair dans mes explications. Retenez bien les **conditions **et tout ce qu'on a vu ensemble aujourd'hui de façon générale, demain on passe à la vitesse supérieure !
