---
layout: post
status: draft
published: no
title: Utiliser Capistrano avec Jekyll
author:
  display_name: Clément Demily
  email: demily.clement@gmail.com
  url: https://clementdemily.github.io/
author_login: cdemily
author_email: demily.clement@gmail.com
author_url: https://clementdemily.github.io/
date: "2015-10-15 12:00:00 +0200"
date_gmt: "2015-10-15 10:00:00 +0200"
categories:
  - tutoriel
  - ruby
tags:
  - capistrano
  - jekyll
comments: []
---

## Installation de Capistrano

via gem:
{% highlight bash %}
\$> gem install capistrano
{% endhighlight %}

Via bundler: Ajouter la ligne suivante à votre Gemfile: _gem 'capistrano'_
puis:
{% highlight bash %}
\$> bundle install
{% endhighlight %}

## Configuration de Capistrano

{% highlight bash %}
\$> cap install
{% endhighlight %}
