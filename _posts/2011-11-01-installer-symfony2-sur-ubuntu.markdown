---
layout: post
status: publish
published: true
title: Installer Symfony2 sur Ubuntu
author:
  display_name: Clément Demily
  login: devilslug
  email: demily.clement@gmail.com
  url: http://www.clement-demily.fr
author_login: devilslug
author_email: demily.clement@gmail.com
author_url: http://www.clement-demily.fr
date: '2011-11-01 21:36:58 +0100'
date_gmt: '2011-11-01 19:36:58 +0100'
categories:
- tutoriel
tags:
- PHP
- Symfony2
comments:
- id: 2
  author: Konan Claude
  author_email: konangbammy@gmail.com
  author_url: ''
  date: '2012-03-01 12:19:05 +0100'
  date_gmt: '2012-03-01 10:19:05 +0100'
  content: |-
    Bonjour,
    Je suis en train de tenter d'installer Symfony sur ma machine Ubuntu, mais je change "Date.timezone = Europe/Paris", mais lorsque je lance pour tester la configuration on me demande toujours de changer Date.timezone alors que je l'ai déja fait.
    J'aimerais que vous m'aidiez.
    Merci
- id: 3
  author: EdwoodBlues
  author_email: itzi@free.fr
  author_url: ''
  date: '2012-03-05 18:50:28 +0100'
  date_gmt: '2012-03-05 16:50:28 +0100'
  content: As tu décommenté, c'est à dire enlever le ";" au début
    de la ligne?
- id: 4
  author: shaft
  author_email: kang.frederic@gmail.com
  author_url: ''
  date: '2013-10-21 11:41:33 +0200'
  date_gmt: '2013-10-21 09:41:33 +0200'
  content: |-
    Bonjour,

    Je souhaite faire une refonte de quelques sites hébergés sur des mutualisé vers symfony2.

    je me suis donc procuré un tutos, et je coince sur un problème qui m'inquiète :

    Lorsque j'avance dans les chapitres, je teste plusieurs points et ca marche. Si je redémarre, je reviens et pouf, rien ne marche plus !

    Par contre si je réinstalle, tout fonctionne bien.

    Par exemple :

    Jour J

    Etape 1:  je teste l'URL localhost/Symfony/web/config.php

    => OK

    Etape 2 : je teste l'URL : localhost/Symfony/web/app_dev.php

    ==> OK

    Etape 3 : je teste l'URL : localhost/Symfony/web/app_dev.php/hello/winzou

    ==> OK

    J'arrive même à personnaliser un bundle hello-world"

    Le lendemain, je teste de nouveau et à l'étape 2 j'ai le message d'erreur :"Adresse introuvable"

    Je n'ai touché à rien entre les deux jours.

    Pour information, je suis sous Ubuntu 12.04, j'ai récupéré la dernière version officielle de Symfony  et lorsque j'ai copié le dossier Symfony dans var/www/, j'ai appliqué les droits 777 à toute l'arborescence.
    Le cache est également vidé.

    Si tu as une idée, je suis préneur

    Merci
- id: 5
  author: Clément Demily
  author_email: demily.clement@gmail.com
  author_url: http://www.zen-dev.net
  date: '2013-10-21 17:31:29 +0200'
  date_gmt: '2013-10-21 15:31:29 +0200'
  content: |-
    Hello,
    C'est pour le moins étrange! Je ne vois pas de solution miracle alors on va juste voir quelques points ensemble:
    - Assures toi de bien pointer sur app_dev.php et pas app.php (le deuxième n'affiche pas les erreurs);
    - Regardes les logs de Symfony2, tu auras peut être des informations complémentaires qui te mettrons sur la piste;
    - Il y a aussi les logs d'Apache2 qui peuvent d'aiguiller;


    Sinon pour informations appliquer les droits 777 récursivement sur l'arborescence ce n'est pas ce qui a de plus propre;
    Il y a en effet quelques dossiers où changer les droits s'avère nécessaire (app/logs; app/cache et certains assets que tu trouves dans le dossier web), néanmoins je ne pense pas que ça soit la cause de ton problème;
    Si cette erreur mystique persiste je te conseillerais de commencer un projet vierge.
- id: 6
  author: shaft
  author_email: kang.frederic@gmail.com
  author_url: ''
  date: '2013-10-27 12:45:00 +0100'
  date_gmt: '2013-10-27 10:45:00 +0100'
  content: |-
    Bonjour,


    merci de t'être penché sur le problème.
    Il s'agissait en fait d'un problème hardware. j'ai du remplacer mon DD pour que ca puisse marcher.
    Maintenant, tout va nickel :)
- id: 7
  author: ZenDev
  author_email: demily.clement@gmail.com
  author_url: ''
  date: '2013-10-28 01:46:00 +0100'
  date_gmt: '2013-10-27 23:46:00 +0100'
  content: D'accord! Bon développement ;)
---

Voici une des méthodes qui va vous permettre d'installer et d'utiliser symfony2.

Tout d'abord télécharger Symfony2 ( <a title="Symfony2 Download" href="http://symfony.com/download">http://symfony.com/download</a> ) puis rendez vous dans votre répertoire web ( /var/www/ ) et décompressez l'archive.

Vous pouvez dès maintenant tester si votre configuration actuelle permet de faire tourner Symfony à l'adresse suivante : <a href="http://localhost/Symfony/web/config.php">http://localhost/Symfony/web/config.php</a>

Voici quelques conseils qui vous permettrons de régler la majeur partie des problèmes :

 * Symfony2 pour fonctionner, a besoin des modules php suivant: sqlite, apc et intl. Installons-les!

{% highlight bash %}sudo apt-get install php5-sqlite php-apc php5-intl
sudo service apache2 restart
{% endhighlight %}

 * Changer les droits sur les dossiers du cache et des logs ainsi que sur le fichier de configuration de symfony.

{% highlight bash %}sudo chmod -R 777 /var/www/Symfony/app/cache
sudo chmod -R 777 /var/www/Symfony/app/logs
sudo chmod 644 /var/www/Symfony/app/config/parameters.yml
{% endhighlight %}

 * Modifier le timezone dans le fichier de configuration de PHP ( /etc/php5/apache2/php.ini ) dé-commenter et ajouter votre timezone ( Europe/Paris pour la France)

;date.timezone = Europe/Paris

 * Chercher ensuite la ligne "short_open_tag = On" et replacer "On" par "Off".

Si vous avez des questions n'hésitez pas à les poster en commentaire.
