---
layout: post
status: publish
published: true
title: Installer Ruby et RVM sur Ubuntu
author:
  display_name: Clément Demily
  email: demily.clement@gmail.com
  url: https://clementdemily.github.io/
author_login: cdemily
author_email: demily.clement@gmail.com
author_url: https://clementdemily.github.io/
date: "2014-03-15 22:00:00 +0200"
date_gmt: "2014-03-15 20:00:00 +0200"
categories:
  - tutoriel
  - ruby
  - unix
tags:
  - gems
  - rvm
  - ubuntu
comments: []
---

Bonjour tout le monde! Aujourd’hui nous allons voir comment installer Ruby et RVM.

## Qu’est-ce que RVM?

**RVM**, pour Ruby Version Manager permet comme son nom l’indique, de gérer différentes versions de ruby sur votre système.

En effet, certaines gems peuvent utiliser une version spécifique de **Ruby**, et inversement.

D’une même façon pour une application rails, la plupart du temps vous préciserez une version de **Ruby** accompagnée de toutes les configurations de vos gems dans le ficher Gemfile de votre application.

Pour rappel, une gem est librairie externe, fourni par la communauté.

Voici la commande a éxecuter pour installer **RVM** et **Ruby**

{% highlight C++ %}

curl -sSL "https://get.rvm.io" | bash -s stable --ruby

{% endhighlight %}

Après un petit temps de téléchargerment, **RVM** s’installera automatiquement.

Vous pourrez ensuite regarder la version de **Ruby** que vous utilisez à l’aide de cette commande:

{% highlight C++ %}

ruby -v

{% endhighlight %}

## Installer une autre version de Ruby

Si vous désirez installer un autre version de **Ruby** (par exemple, la 2.0.0), faites le via **RVM**:

{% highlight C++ %}

rvm install 2.0.0

{% endhighlight %}

puis:

{% highlight C++ %}

rvm use 2.0.0

{% endhighlight %}

Sources:

- [https://rvm.io/rvm/install](https://rvm.io/rvm/install)
- [https://rvm.io/rubies/installing](https://rvm.io/rubies/installing)
