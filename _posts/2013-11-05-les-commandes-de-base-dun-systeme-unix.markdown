---
layout: post
status: publish
published: true
title: "Les commandes de base d'un système UNIX"
author:
  display_name: Clément Demily
  email: demily.clement@gmail.com
  url: https://clementdemily.github.io/
author_login: cdemily
author_email: demily.clement@gmail.com
author_url: https://clementdemily.github.io/
date: "2013-11-05 10:35:34 +0100"
date_gmt: "2013-11-05 08:35:34 +0100"
categories:
  - tutoriel
  - unix
tags:
  - cli
  - bash
comments: []
---

Hello! Aujourd'hui on va parler des commandes indispensables a connaitre pour bien utiliser un environnement UNIX.
Ces commandes sont a entrer dans un terminale.

**ls** : cette commande permet de lister le contenu d'un répertoire. Quelques options intéressantes : -l pour lister le détails des données, -R pour lister de manière récursive.

Exemple d'utilisation: lister les données du dossier courant.
{% highlight bash %}
ls -l
{% endhighlight %}

**cd**: permet de naviguer entre les dossiers. "cd -" permet de revenir au dossier précédent.
Exemple d'utilisation: se déplacer a la racine du système.
{% highlight bash %}
cd /
{% endhighlight %}

**pwd**: affiche le chemin du dossier courant.
**cp**: copie un fichier / dossier.
**mv**: renomme **ou** déplace un fichier.

Exemple d'utilisation: renommer un fichier.
{% highlight bash %}
mv monfichier.txt toto.txt
{% endhighlight %}

**rm**: supprimer un fichier. rm -r permet de supprimer un dossier.
Exemple d'utilisation: supprimer un dossier.
{% highlight bash %}
rm -r mondossier
{% endhighlight %}

**env**: affiche les variables d'environnement.

**locate**: permet de trouver un fichier dans l'arborescence.
{% highlight bash %}
locate toto.txt
{% endhighlight %}

**mkdir**: créer un dossier.
{% highlight bash %}
mkdir nouveaudossier
{% endhighlight %}

**cat**: concatène les fichiers passés en entré puis les affiches sur le terminal. L'option -e permet d'afficher des "\$" à chaque retours à la ligne.

{% highlight bash %}
cat fichier1.txt fichier2.txt
{% endhighlight %}

**grep**: cherche dans un texte. Utilise les expressions régulières.
Exemple d'utilisation: cherche le mot "toto" dans le fichier fichier1.txt.
{% highlight bash %}
cat fichier1.txt | grep toto
{% endhighlight %}

**chmod**: change les droits du fichier. L'option -R permet d'appliquer la modification de manière récursive.
{% highlight bash %}
chmod 777 monbinaire
{% endhighlight %}

Voilà pour les commandes de base a connaitre par coeur! ;)
Bonne journée!
