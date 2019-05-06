---
layout: post
status: publish
published: true
title: Installer Elixir sur mac
author:
  display_name: Clément Demily
  email: demily.clement@gmail.com
  url: https://clementdemily.github.io/
author_login: cdemily
author_email: demily.clement@gmail.com
author_url: https://clementdemily.github.io/
date: "2015-09-11 12:00:00 +0200"
date_gmt: "2015-09-11 10:00:00 +0200"
categories:
  - tutoriel
  - elixir
tags:
  - mac
comments: []
---

Voilà quelques semaines que je me penche sur un nouveau langage: [Elixir](http://elixir-lang.org/).
Elixir est un langage fonctionnel dynamique, sa syntaxe se rapproche de celle de Ruby.
Elixir bénéficie de l'Erlang VM, Erlang étant utilisé pour construire des systèmes distribués et robustes.
D'ailleurs, les bibliothèques basées sur Erlang seront compatibles et utilisables avec Elixir.

![Logo-elixir]({{ site.base_url }}/img/2015/09/elixir.png){: .center-image }

## Pourquoi apprendre Elixir?

Tout d'abord Elixir est un langage fonctionnel et possède une syntaxe proche du Ruby (donc agréable) par opposition à l'OCAML ou du lisp qui ont une syntaxe qui pourraient en rebuter plus d'un.

Si vous faites majoritairement de la programmation orientée objet, la programmation fonctionnelle vous permettra de "casser" un peu la routine en résolvant des problèmes de manières différentes.
Il est intéressant de connaitre les différences pour tirer parti du meilleurs des deux approches.

Elixir possède une communauté jeune mais très active. Comme pour Ruby, Elixir possède son propre gestionnaire de package mettant à disposition des plugins réalisés par la communauté.
Il existe déjà un framework web [Phoenix](http://www.phoenixframework.org/) très fortement inspiré de Ruby On Rails.

## Installation sur mac

Pour installer Elixir (et Erlang) sur mac, vous devez au préalable avoir [Homebrew](http://brew.sh/) sur votre machine.

Ensuite il vous suffira de taper la commande suivante:

{% highlight bash %}
brew install elixir
{% endhighlight %}

Et voilà, Elixir ainsi qu'Erlang sont installé sur votre système!

Lancer iex (l'équivalent de irb):
{% highlight bash %}
iex
{% endhighlight %}

Puis taper le code suivant:
{% highlight elixir %}
IO.puts "Hello World"
{% endhighlight %}

Et voilà! :)
