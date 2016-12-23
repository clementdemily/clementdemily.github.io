---
layout: post
status: publish
published: true
title: Mettre à jour postgresql et la gem pg sur ubuntu
author:
  display_name: Clément Demily
  login: devilslug
  email: demily.clement@gmail.com
  url: http://www.clement-demily.fr
author_login: devilslug
author_email: demily.clement@gmail.com
author_url: http://www.clement-demily.fr
date: '2016-04-21 03:01:04 +0100'
date_gmt: '2016-04-21 01:01:04 +0100'
categories:
- tutoriel
- unix
tags:
- ubuntu
- postgresql
- ruby
- gem
comments: []
---

Recemment j'ai du mettre à jour Postgresql pour profiter des dernières features tel que l'indexation des données au format json (jsonb).

Voici un petit script qui permettra de mettre à jour postgresql (9.3 -> 9.5): 
<script src="https://gist.github.com/clementdemily/fd45ba8b13132103f0d3da1711838e6a.js"></script>

Il vous faut maintenant modifier les configurations de bundler sur votre serveur:

```
# Déplacer vous dans le dossier de votre app
cd /path/to/app

# Configurer le nouveau path de pg_config
bundle config build.pg --with-pg-config=/usr/lib/postgresql/9.5/bin/pg_config

# Desinstaller toutes les gems pg en cache
bundle exec gem uninstall pg

# Réinstaller la gem
bundle install
```