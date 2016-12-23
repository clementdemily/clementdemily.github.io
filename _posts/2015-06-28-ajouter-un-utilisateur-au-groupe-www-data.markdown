---
layout: post
status: publish
published: true
title: Ajouter un utilisateur au groupe www-data
author:
  display_name: Clément Demily
  email: demily.clement@gmail.com
  url: http://www.clement-demily.fr
author_login: devilslug
author_email: demily.clement@gmail.com
author_url: http://www.clement-demily.fr
date: '2015-06-29 12:00:00 +0200'
date_gmt: '2015-06-29 10:00:00 +0200'
categories:
- tutoriel
- unix
tags:
- apache2
- nginx
comments: []
---

Certains fichiers et dossiers peuvent nécessiter que l'utilisateur fasse parti d'un groupe pour être ajouté, modifié ou supprimé. C'est le cas par exemple du groupe *www-data*. Si vous décider d'appliquer une règle de sécurité pour tout les dossiers et fichiers qui vont être vu par **apache2** ou **nginx**, votre utilisateur devra faire parti du groupe *www-data* pour les modifiers.

Nous allons voir ici comment créer un utilisateur et comment ajouter cet utilisateur à un groupe.

Création d'un nouvel utilisateur sous unix
---

Nous allons tout d'abord créer un nouvel utilsateur et lui attribuer un mot de passe. Nous prendrons pour exemple l'utilisateur "clement".

{% highlight bash %}

sudo useradd clement 
sudo passwd clement

{% endhighlight %}

Pour verifier les informations de cet utilisateur, vous pourrez utiliser les commandes suivantes:  

{% highlight bash %}

id clement
groups clement

{% endhighlight %}

Ajouter l'utilisateur à un groupe existant
---

Certains dossiers et fichiers ne peuvent être modifier ou executer seulement par les utilisateurs membre d'un groupe particulier.

Pour ajouter l'utilisateur clement à un groupe, nous pouvons utiliser la commande suivante:

{% highlight bash %}

sudo usermod -a -G www-data clement

{% endhighlight %}
