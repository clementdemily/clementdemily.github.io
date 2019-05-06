---
layout: post
status: publish
published: true
title: Refonte du site
author:
  display_name: Clément Demily
  email: demily.clement@gmail.com
  url: https://clementdemily.github.io/
author_login: cdemily
author_email: demily.clement@gmail.com
author_url: https://clementdemily.github.io/
date: "2015-06-26 22:00:00 +0200"
date_gmt: "2015-06-26 20:00:00 +0200"
categories:
  - news
tags:
  - jekyll
comments: []
---

Hello!

Après réflexion et ayant peu de temps a concacrer à la maintenance de mon blog, j'ai pris la décision de changer de plateforme.
J'ai donc migré de wordpress à jekyll.

# Qu'est-ce que jekyll?

Jekyll est une gem ruby qui permet de générer des sites statiques à la volé. Cet outils me permet de rédiger mes billets dans un fichier au format markdown et de générer des pages HTML grace au parseur intégré.
Cela me permet donc de versionner le site et en même temps les articles (et pages) sur un repository.

# Pourquoi jekyll?

Comme dit plus haut, je n'ai malheureusement pas assez de temps ni l'envie de me concacrer à la maintenance d'un wordpress. Il me fallait trouver une solution simple, rapide et très facilement configurable.
Il me fallait aussi pouvoir importer mes billets précédemment rédégé sous wordpress.
De plus, je ne voulais plus me soucier de faire des backups de base de données régulières.
Jekyll était donc tout à fait capable de repondre a mes besoin.

L'installation se fait par la commande suivante:

{% highlight bash %}
gem install jekyll
{% endhighlight %}

Ensuite, nous pouvons créer une application jekyll:

{% highlight bash %}
jekyll new NOM_APPLICATION
{% endhighlight %}

Jekyll embarque un serveur intégré qui permet de générer le site statique, puis surveille les changements de vos fichiers et re-génère les pages automatiquement.

{% highlight bash %}
jekyll s
{% endhighlight %}

Il ne me reste plus qu'à écrire de nouveau articles! :-)

Vous pourrez retrouver toutes les resources nécessaires sur les sites suivant:

- [http://www.jekyllrb.com/doc/](http://www.jekyllrb.com/docs/)
- [http://import.jekyllrb.com/docs/wordpress/](http://import.jekyllrb.com/docs/wordpress/)
