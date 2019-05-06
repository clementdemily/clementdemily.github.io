---
layout: post
status: publish
published: true
title: L’Objective-C pour un développeur C++ 1 – Introduction, types et syntaxe
author:
  display_name: Clément Demily
  email: demily.clement@gmail.com
  url: https://clementdemily.github.io/
author_login: cdemily
author_email: demily.clement@gmail.com
author_url: https://clementdemily.github.io/
date: "2014-05-07 22:00:00 +0200"
date_gmt: "2014-05-07 20:00:00 +0200"
categories:
  - tutoriel
  - Objective-C
tags:
  - apple
  - ios
  - cocoa
  - c++
comments: []
---

Je vous propose une approche originale pour appréhender l’Objective-C en me mettant à la place d’un développeur C++.

On va voir dans cette suite de billets les principales différences et ressemblances entre ces deux langages.

## Historique

L’Objective-C, comme le C++ est un langage orienté objet basé sur le C. Il est utilisé par la société NeXT (fondée par Steve Jobs) pour créer l’OS nommé NeXTSTEP. NeXT fut racheté par Apple et l’OS deviendra la base de Mac OS X. Source

Quelques différences au niveau des types du langage

Le type boolean (_bool_ en C++) s’écrit _BOOL_ et il prend les valeurs _YES_ ou _NO_.

Il existe un pointeur générique d’objet: id. (grossomodo l’équivalent du void\* en C++)

nil est préférable a NULL.

{% highlight C++ %}

bool b = true;
bool b = false;

void \*voidPointer = NULL;
{% endhighlight %}

versus

{% highlight Objective-C %}

BOOL b = YES;
BOOL b = NO;

id MyObject = [[NSString alloc] init];
int \*integerPointer = nil;
{% endhighlight %}

## Cocoa

C’est la librairie native utilisée par Apple pour l’Objective-C, on y trouve des classes comme NSString, NSArray, NSLog. On peut y voir une équivalence sur certains points de la STL en C++.

Appels de méthode (envoi de messages)

Comme tout langage objet, vous écrirez des méthodes dans vos classes. Seulement l’Objective-C possède une syntaxe assez particulière pour faire appelle a celles-ci:

prog.cpp
{% highlight C++ %}

MyClass \*my = new MyClass();
my->method();

{% endhighlight %}

versus

prog.m
{% highlight Objective-C %}

MyClass \*my = [[MyClass alloc]init][my method]

{% endhighlight %}

## La gestion de mémoire

Le compilateur de l’Objective-C nous propose une feature plutôt cool: l’Automatic Reference Counting (ARC pour les intimes)

Cette fonctionnalité permet au compilateur de savoir exactement où libérer la mémoire des objets que vous allouez dans votre code.
_CE N’EST PAS UN GARBAGE COLLECTOR!_ Le compilateur sait avec certitude a quel moment votre objet n’est plus utilisé et donc libérer son allocation mémoire en toute sécurité. L’avantage est que vous n’aurez pas à vous souciez de savoir si vous avez bien delete toutes vos resources, le défaut est que vous perdez totalement la main sur la dés-allocation mémoire.

Nous verrons dans un prochain billet la création de classe en Objective-C.
