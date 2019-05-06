---
layout: post
status: publish
published: true
title: Configurer son serveur web local sur Ubuntu 11.10
author:
  display_name: Clément Demily
  login: cdemily
  email: demily.clement@gmail.com
  url: https://clementdemily.github.io/
author_login: cdemily
author_email: demily.clement@gmail.com
author_url: https://clementdemily.github.io/
date: "2011-11-01 03:01:04 +0100"
date_gmt: "2011-11-01 01:01:04 +0100"
categories:
  - tutoriel
  - unix
tags:
  - PHP
  - Symfony2
  - ubuntu
comments: []
---

Voici un petit tutorial qui vous permettra d'être opérationnel sur Ubuntu en quelques étapes.

Tout d'abord un petit **sudo apt-get install tasksel **qui est un outils qui vous permettra d'installer plusieurs paquets spécifique en même temps.

tapez ensuite **sudo tasksel **et choisissez ensuite LAMP Server. On vous demandera de choisir le mot de passe root pour se connecter à votre futur base MySQL.

Vous pouvez dès maintenant tester si apache2 fonctionne (dans votre navigateur http://localhost/ ).

Éditez un fichier dans le répertoire /var/www/ et insérez-y le code suivant :

test.php
{% highlight php %}

<?php
  phpinfo();
?>

{% endhighlight %}

Relancer votre serveur apache2 à l'aide de cette commande : **sudo /etc/init.d/apache2 restart**

Vous devriez pouvoir obtenir les configurations de php sur le serveur en accédant à la page http://localhost/test.php

Pour finir, nous allons installer phpmyadmin, qui comme vous le savez, permet d'administrer via une interface graphique, vos bases de données.

Utiliser la commande **sudo apt-get install phpmyadmin **et suivez l'installation.

Tester maintenant à l'adresse suivante : http://localhost/phpmyadmin

Erreurs fréquentes :

<span style="text-decoration: underline;">-Impossible d'accéder a phpmyadmin (404)</span> :

Essayez la commande suivante :

**sudo cp /etc/phpmyadmin/apache.conf /etc/apache2/conf.d**

<span style="text-decoration: underline;">- Impossible de se connecter :</span>

Si vous n'avez pas mis de mot de passe root lors de l'installation de phpmyadmin, vous ne pourrez pas vous connecter, car par défaut phpmyadmin n'autorise pas les connexions sans mot de passe. Il est possible de régler cela en dé-commentant la ligne suivante dans le fichier qui se trouve dans : /etc/phpmyadmin/config.inc.php.

**// $cfg['Servers'][$i]['AllowNoPassword'] = TRUE;**

Pour plus de détails sur ce fichier :<a title="config" href="http://wiki.phpmyadmin.net/pma/Config/Servers" target="_blank"> http://wiki.phpmyadmin.net/pma/Config/Servers</a>

Voilà ! J'espère que j'ai été assez clair pour ce premier petit tutoriel.
