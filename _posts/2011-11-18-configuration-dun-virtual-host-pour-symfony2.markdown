---
layout: post
status: publish
published: true
title: Configuration d'un virtual host pour symfony2
author:
  display_name: Clément Demily
  login: devilslug
  email: demily.clement@gmail.com
  url: http://www.clement-demily.fr
author_login: devilslug
author_email: demily.clement@gmail.com
author_url: http://www.clement-demily.fr
date: '2011-11-18 20:49:34 +0100'
date_gmt: '2011-11-18 18:49:34 +0100'
categories:
- tutoriel
tags:
- Symfony2
- ubuntu
- unix
- virtual host
comments: []
---

Editez un fichier dans le dossier /etc/apache2/sites-available/ que vous nommerez symfony2.
{% highlight bash %}
  NameVirtualHost 127.0.0.1
  <VirtualHost 127.0.0.1:80>
    ServerName symfony2
    DocumentRoot "/var/www/symfony2/web"
    DirectoryIndex app_dev.php
    <Directory "/var/www/symfony2/web">
            Options Indexes FollowSymLinks MultiViews
            AllowOverride None
            Order allow,deny
            allow from all
    </Directory>
    ErrorLog ${APACHE_LOG_DIR}/error.log
   </VirtualHost>
{% endhighlight %}

Activer le via la commande

{% highlight bash %}
  sudo a2ensites symfony2
{% endhighlight %}

Editez votre fichier hosts ( /etc/hosts ) et ajouter la ligne 127.0.0.1 symfony2

et redémarrer apache2.

Lorsque vous taperez "symfony2" dans votre navigateur, vous serez automatiquement rediriger vers la page index de symfony2.

Bonne chance !
