---
layout: post
status: publish
published: true
title: Bien configurer Eclipse pour Symfony2
author:
  display_name: Clément Demily
  login: cdemily
  email: demily.clement@gmail.com
  url: https://clementdemily.github.io/
author_login: cdemily
author_email: demily.clement@gmail.com
author_url: https://clementdemily.github.io/
date: "2011-11-04 00:38:24 +0100"
date_gmt: "2011-11-03 22:38:24 +0100"
categories:
  - Tutoriel
tags:
  - Eclipse
  - PHP
  - Symfony2
comments: []
---

Je vous propose dans cet article de configurer Eclipse afin d'avoir un IDE prenant en charge l'autocompletion de twig et Symfony2.

Tout d'abord, il vous faut Eclipse, pas sorcier télécharger sa dernière version sur le site officiel puis installé-le. ( <a title="eclipse" href="http://www.eclipse.org/downloads/">http://www.eclipse.org/downloads/</a> )
Ensuite, lancer-le, aller dans l'onglet "Help", puis dans "Install New Software..."

Arrivé sur la nouvelle fenêtre, appuyer sur "Add..." et ajouter le lien suivant dans le champ "location" : <a title="Symfony-2-Eclipse-Plugin" href="http://pulse00.github.com/Symfony-2-Eclipse-Plugin/" target="_blank">http://pulse00.github.com/Symfony-2-Eclipse-Plugin/</a>
Télécharger les deux plugins qui apparaissent alors.

Il vous faut maintenant un éditeur YAML, voici un autre plugin que vous pouvez obtenir en répétant l'opération précédente a cette adresse-ci : <a title="yedit" href="http://dadacoalition.org/yedit/" target="_blank">http://dadacoalition.org/yedit/</a>

Quelques précisions : pour activer la prise en compte de projet symfony2, ouvrer la vue de gestion de projet, un clique droit sur votre projet et cliquer ensuite sur "Symfony->Add/Remove Symfony Nature", pareil pour Twig. (le logo Sf devrais apparaitre en haut a droite de l'icône de votre projet)

Bonne chance et bon développement !

(PS : j'ai du m'y prendre a plusieurs reprise pour bien faire fonctionner les plugins sur Ubuntu, veuillez prendre Eclipse sur le site officiel et non via les paquets puis exécuté Eclipse avec la commande **sudo**)
