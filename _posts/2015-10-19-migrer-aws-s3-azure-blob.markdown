---
layout: post
status: publish
published: true
title: Migrer de Amazon Web Service S3 vers Microsoft Azure Blob
author:
  display_name: Clément Demily
  email: demily.clement@gmail.com
  url: http://www.clement-demily.fr
author_login: devilslug
author_email: demily.clement@gmail.com
author_url: http://www.clement-demily.fr
date: '2015-10-15 12:00:00 +0200'
date_gmt: '2015-10-15 10:00:00 +0200'
categories:
- tutoriel
- microsoft azure
tags:
- cloud
- s3
- blob
comments: []
---

Backups des buckets S3
---

Dans un premier temps, nous ferons une copie locale de nos buckets **S3**.

Pour cela, nous devrons utiliser l'utilitaire **awscli** qui nous permet de manipuler nos services **AWS** depuis notre console.

Installation de awscli sur mac (via homebrew):
{% highlight bash %}
  $> brew install awscli
{% endhighlight %}

Installation de awscli sur unix (via pip):
{% highlight bash %}
  $> pip install awscli
{% endhighlight %}

Une fois installé, configurons notre utilitaire:
{% highlight bash %}
$> aws configure
AWS Access Key ID [None]:
AWS Secret Access Key [None]:
Default region name [None]:
Default output format [None]:
{% endhighlight %}

Vous devez ici remplir les champs avec leur valeur correspondantes.
[lien vers la documentation](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html)

Vous pouvez dès à présent créer un nouveau dossier et effectuer une copie locale de vos buckets:

{% highlight bash %}
$> mkdir buckets-backup
$> cd buckets-backup
$> aws s3 sync s3://mon-bucket .
{% endhighlight %}

Si un message d'erreur en rapport avec une erreur de droit apparait (*AccessDenied*), verifier bien que l'utilisateur associé a votre configuration dispose des droits nécessaire sur le service **S3** de votre compte **AWS**. [Lien vers IAM](https://console.aws.amazon.com/iam/home).

Si le problème persiste, créer un nouvel utilisateur lui attribuant le droit "**AdministratorAccess**" ou "**AmazonS3FullAccess**".

Utiliser ensuite ses identifiants pour reconfigurer **awscli**.
![IAM]({{ site.base_url }}/img/2015/10/IAM.png){: .center-image }

Transfert des buckets vers Microsoft Blob
---

Nous disposons de plusieurs outils pour transférer des fichiers sur Microsoft Blob (powershell, AzCopy, ...)

Nous utiliserons une méthode alternative en utilisant le logiciel gratuit [Cyberduck](https://cyberduck.io/).

Une fois le logiciel installé, cliquer sur le bouton "Connecter" et sélectionner dans le menu déroulant l'option "Windows Azure Storage"
Les informations à saisir se trouve sur votre portail azure.

![Azure account storage]({{ site.base_url }}/img/2015/10/azure-account-storage.png){: .center-image }

![Cyberduck]({{ site.base_url }}/img/2015/10/cyberduck.png){: .center-image }

Le champ "Nom d'utilisateur" correspond au champ "Account Storage Name". Le champ "Mot de passe" est une des clés "Access Keys".

Une fois la connexion établie, il ne vous restera plus qu'a effectuer un "glisser-déposer" dans la fenêtre qui est apparue.

Pour finir, aller sur votre portail et verifier que vos **Containers** (alias buckets) ont bien les droits que vous souhaitez attribuer. 
Les containers sont privés par défaut, si vous désirer les rendre public, changer la règle d'accès du container avec la valeur "Container".

![containers]({{ site.base_url }}/img/2015/10/containers.png){: .center-image }