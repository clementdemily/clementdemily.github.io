---
layout: post
status: publish
published: true
title: L'Objective-C pour un développeur C++ 2 – déclaration de classe
author:
  display_name: Clément Demily
  email: demily.clement@gmail.com
  url: https://clementdemily.github.io/
author_login: cdemily
author_email: demily.clement@gmail.com
author_url: https://clementdemily.github.io/
date: "2014-05-08 22:00:00 +0200"
date_gmt: "2014-05-08 20:00:00 +0200"
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

Nous allons voir dans ce billet quelques différences entre la déclaration des classes en Objective-C et en C++.

## Création d'une classe

En **C++** nous avons besoin de deux fichiers pour créer une classe: un fichier header (.h ou .hh) qui contiendra la description de la classe et un fichier d'implémentation (.cpp) qui contiendra le corps des méthodes définies dans le header. Pour l'**Objective-C**, cela est fortement similaire, excepté l'extension du fichier d'implémentation (.m au lieu de .cpp)

MyClass.h (C++)

{% highlight C++ %}

class MyClass : public BaseClass {
private:
int number;
public:
int getNumber() const;
void setNumber(int number);
void otherMethod();
int addNumberAToNumberB(int a, int b);
public:
static int staticMethod();
};

{% endhighlight %}

MyClass.h (Objective-C)

{% highlight Objective-C %}

@inteface MyClass : NSObject
@property int number;

- (void) otherMethod;
- (int) addNumberA: (int)a toNumberB: (int)b;

* (int) staticMethod;
  @end

{% endhighlight %}

Vous pouvez voir quelques différences: Tout d'abord la syntaxe: _@interface_ et _@end_ qui délimite la définition de la classe.

Attention toutefois, _interface_ n'a pas la même signification en **C++**. Son équivalent en **Objective-C** est le _protocol_ que nous verrons plus tard.

@property permet de déclarer une variable d'instance.Les getters et setters des _@property_ sont générés automatiquement. Il est possible de redéfinir le nom des setters/getter, et de préciser si vous ne voulez générer qu'un getter.

Le signe - en **Objective-C** signifie que nous déclarons une méthode d'instance. Le signe +, lui, signifie que nous déclarons une méthode de classe.

Le nom des méthodes avec plusieurs arguments sont scindés en fonction du nombre de ces derniers. Cela peut paraitre assez déroutant mais cela nous force à écrire des noms de méthode très explicite.

Il n'y a pas vraiment de méthode ou attributs privés, en effet tout ce qui est exposé dans l'_@interface_ est public.

Le code privé est donc laissé à la discrétion du développeur dans le fichier d'implémentation.

Comme en **C++**, l'héritage se fait après le nom de la classe suivi des deux points.Il est important de préciser que contrairement au **C++**, avec l'**Objective-C** nous ne pouvons pas faire d'héritages multiple.

## Implémentation

L'implémentation est assez similaire dans les deux langages:

MyClass.cpp
{% highlight C++ %}

#include "MyClass.h"

int MyClass::getNumber() const {
// content
}

void MyClass::setNumber(int number){
// content
}

void MyClass::otherMethod(){
// content
}

int MyClass::addNumberAToNumberB(int a, int b){
// content
}

{% endhighlight %}

MyClass.m
{% highlight Objective-C %}

#import "MyClass.h"

@implementation MyClass

- (void) otherMethod {
  // content
  }
- (int) addNumberA: (int)a toNumberB: (int)b {
  // content
  }

* (int) staticMethod {
  // content
  }
  @end

{% endhighlight %}

La qualification des fonctions est toutefois nécessaire au **C++**, alors qu'en **Objective-C** seul le nom des fonctions est requis.
Le _@implementation_ défini un scope un peu comme un namespace.
