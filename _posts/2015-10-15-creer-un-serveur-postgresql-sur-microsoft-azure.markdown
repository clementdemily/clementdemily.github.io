---
layout: post
status: publish
published: true
title: Créer un serveur postgresql sur microsoft azure
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
  - microsoft azure
tags:
  - cloud
  - postgresql
  - unix
comments: []
---

## Création et configuration de l'instance

Rendez-vous sur le [portail azure](https://portal.azure.com)
Pour cet exemple, j'ai choisi de prendre une image ubuntu.

![create-instance]({{ site.base_url }}/img/2015/10/create-instance.png){: .center-image }

Une fois l'instance créée, vous pourrez consulter les informations de celle-ci:

![instance-details]({{ site.base_url }}/img/2015/10/instance-details.png){: .center-image }

Le champ qui nous intéresse ici est Virtual IP address.

Nous devons ensuite exposer un port de notre instance, pour cela, cliquer sur "All setting", puis sur "Endpoints".
Ajouter un nouveau champs correspondant aux ports que vous voulez exposé.
J'ai choisi d'exposer le port part défaut de postgresql (5432), mais libre a vous de choisir le port que vous désirez.

![open-port]({{ site.base_url }}/img/2015/10/open-port.png){: .center-image }

## Connexion à la machine et installation des packages

Une fois l'instance créée et configurée, vous pourrez vous connecter en SSH à l'aide la commande suivante:

{% highlight bash %}
\$> ssh username@ip
{% endhighlight %}

Téléchargeons le package postgresql (9.3) ainsi que les extensions correspondantes:
{% highlight bash %}
username@ip> sudo apt-get install -y postgresql postgresql-contrib-9.3
{% endhighlight %}

## Création des données de tests

Créons un nouvel utilisateur et une nouvelle base de donnée:
{% highlight bash %}
username@ip> sudo -u postgres createuser -r -d -s my_user
username@ip> createdb my_new_db
username@ip> echo "ALTER ROLE my_user WITH ENCRYPTED PASSWORD 'password';" | psql my_new_db
{% endhighlight %}

## Configuration de postgresql

Nous devons définir des règles d'accès dans le fichier pg_hba.conf. (/etc/postgresql/9.3/main/pg_hba.conf)
Le fichier de configuration est plutôt clair et les commentaires expliquent bien le formatage de la configuration.

Pour mon exemple, my_user et my_new_db correspond à l'utilisateur et à la base de données que venons de créer.
La valeur **IP_MACHINE_CLIENT** doit être remplacée par l'adresse IP de la machine que vous voulez utiliser pour vous connecter à votre base de données.

Cette commande permettra de configurer le fichier sans l'éditer.
{% highlight bash %}
username@ip> sudo echo "host my_new_db my_user IP_MACHINE_CLIENT/24 trust" >> /etc/postgresql/9.3/main/pg_hba.conf
{% endhighlight %}

Nous devons configurer postgresql pour qu'il écoute d'autre adresse que localhost.
Pour cela, nous devons trouver le champ "listen_address" dans le fichier postgresql.conf. ( /etc/postgresql/9.3/main/postgresql.conf)
Comme expliqué dans le fichier, vous pouvez utiliser plusieurs valeurs séparées par une virgule.
Dans cet exemple, j'utilise la valeur '\*' pour écouter toutes les adresses.

C'est également dans ce fichier que vous pourrez modifier le port d'écoute de postgresql.

Le champ "listen_address" est commenté par défaut (9.3), cette commande permettra de configurer le fichier sans l'éditer.
{% highlight bash %}
username@ip> sudo echo ‘listen_address="\*"' >> /etc/postgresql/9.3/main/postgresql.conf
{% endhighlight %}

Pour finir, nous devons redémarrer le service:
{% highlight bash %}
username@ip> sudo service postgresql restart
{% endhighlight %}

## Test

Depuis votre machine (celle qui a l'IP **IP_MACHINE_CLIENT**), vous pourrez vous connecter à l'aide de la commande suivante:

{% highlight bash %}
IP_MACHINE_CLIENT> psql -h IP_INSTANCE_DB -p 5432 -u my_new_db my_user
{% endhighlight %}

IP_INSTANCE_DB correspond à l'IP de votre instance serveur postgresql, celle que nous avons créé au début de cet article.
