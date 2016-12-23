---
layout: post
status: publish
published: true
title: Introduction à l'algorithmique 3 - Les fonctions LIRE et ECRIRE
author:
  display_name: Clément Demily
  login: devilslug
  email: demily.clement@gmail.com
  url: http://www.clement-demily.fr
author_login: devilslug
author_email: demily.clement@gmail.com
author_url: http://www.clement-demily.fr
date: '2013-10-22 02:42:56 +0200'
date_gmt: '2013-10-22 00:42:56 +0200'
categories:
- tutoriel
tags:
- algorithmique
comments: []
---

Bonjour! Dans cet article nous allons voir les *fonctions système LIRE et ECRIRE!*
<blockquote>
A partir de cet article, du pseudo-code sera fournis; je vous invite a télécharger le logiciel suivant: <a href="http://larp.marcolavoie.ca/fr/download/download_ok.htm">http://larp.marcolavoie.ca/fr/download/download_ok.htm</a>. C'est un logiciel qui permet d'interpréter le pseudo-code et les organigrammes; en somme c'est l'outils parfait pour nous entraîner à l'algorithmique!</blockquote>
Chaque langage de programmation dispose de fonctions qui permet d'interagir avec l'utilisateur; Les fonctions les plus élémentaires sont les fonctions **LIRE** et **ECRIRE**.

 * La fonction **ECRIRE** permet comme son nom l'indique, *d'écrire* une valeur à l'écran. Cela peut être un chiffre, une chaîne de caractères, les deux...
 * La fonction **LIRE** permet de récupérer ce que l'utilisateur tape sur son clavier.

Pour bien comprendre ce que font ces fonctions, je vous invite a tester le *pseudo-code* suivant:
{% highlight bash %}DÉBUT
    ECRIRE "COUCOU"
FIN
{% endhighlight %}
<blockquote>
Pour tester ce *pseudo-code, *vous devez avoir installer le logiciel **LARP** cité plus haut. Lancer le logiciel, puis cliquer sur Fichier->Nouveau... Un fenêtre apparaîtra. Laisser cocher le bouton "pseudo-code" et cliquer sur **OK**. Il ne vous restera plus qu'a remplacer le *pseudo-code* initial par le pseudo-code d'exemple que j'ai fournis. Cliquer ensuite sur la flèche verte, en haut du logiciel pour exécuter l'algorithme.</blockquote>
Cette fenêtre devrait s'afficher:

<a href="{{ site.base_url }}/img/2013/10/coucou.jpg"><img class="size-full wp-image-241 aligncenter" alt="console" src="{{ site.base_url }}/img/2013/10/coucou.jpg" width="646" height="435" /></a>

Cette  **console** (ou **terminale**) sera l'intermédiaire entre vous et l'ordinateur lorsque vous afficherez un texte (fonction **ECRIRE**) ou lorsque vous demanderez à l'utilisateur de saisir un texte/nombre (fonction **LIRE**).

Nous allons maintenant tester la fonction **LIRE**!
{% highlight bash %}DÉBUT
    ECRIRE "Salut, je suis capable de répéter ce que tu vas me dire!"
    LIRE variable
    ECRIRE variable
FIN
{% endhighlight %}
Super, n'est-ce pas? ;)

A bientôt pour la suite!
