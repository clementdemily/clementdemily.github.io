---
layout: post
status: publish
published: true
title: Installer un Bundle tiers sur Symfony 2.1
author:
  display_name: Clément Demily
  login: cdemily
  email: demily.clement@gmail.com
  url: https://clementdemily.github.io/
author_login: cdemily
author_email: demily.clement@gmail.com
author_url: https://clementdemily.github.io/
date: "2012-10-11 16:18:25 +0200"
date_gmt: "2012-10-11 14:18:25 +0200"
categories:
  - tutoriel
tags:
  - PHP
  - Symfony2
comments: []
---

Voici un petit guide rapide pour installer un bundle tiers sous Symfony2.1. Dans notre exemple, nous installerons le bundle FOSJsRoutingBundle.

Vous si vous êtes sous windows, vous aurez besoin d'un interpréteur de commande ( <a href="http://code.google.com/p/msysgit/downloads/list">http://code.google.com/p/msysgit/downloads/list</a> par exemple) pour effectuer cette tâche.

Télécharger Symfony2 sur le site officiel puis rendez vous sur le site <a href="http://getcomposer.org/download/">http://getcomposer.org/download/</a> afin de télécharger la dernière version de composer.phar

Copier le fichier composer.phar à la racine du projet.

On édite ensuite le fichier composer.json et on ajoute dans la section "require" la ligne suivante :

"friendsofsymfony/jsrouting-bundle": "\*"

(Je vous conseille de prendre une version fixe du bundle tiers que vous voulez installer. )

Ce fichier contient la liste et les informations relative à vos bundles (version)

Entrer la commande suivante dans le shell:
{% highlight bash %}php composer.phar update

ou si vous rencontrez une erreur

php composer.phar update --prefer-dist
{% endhighlight %}
Le script va faire son boulot tout seul et installer notre nouveau bundle ! :)

Plutôt simple, non ?
