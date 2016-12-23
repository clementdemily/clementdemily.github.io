---
layout: post
status: publish
published: true
title: L’Objective-C pour un développeur C++ 3 – Les protocols
author:
  display_name: Clément Demily
  email: demily.clement@gmail.com
  url: http://www.clement-demily.fr
author_login: devilslug
author_email: demily.clement@gmail.com
author_url: http://www.clement-demily.fr
date: '2014-05-09 22:00:00 +0200'
date_gmt: '2014-05-09 20:00:00 +0200'
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

J’en ai parlé dans mon dernier billet, le terme *@protocol* défini le contrat que devra remplir une classe qui décide de le suivre. L’équivalent en **C++** est une interface.

Le code
---

MyInterface.h (C++)
{% highlight C++ %}

class InterfaceMyClass
{
    public:
        virtual ~MyInterface() {}
        virtual void myBehavior() = 0;
};
 
{% endhighlight %}

versus

MyClassProtocol.h (Objective-C)
{% highlight Objective-C %}
 
@protocol MyClassProtocol
@required
  - (void) myBehavior;
@optional
  - (void) optionalBehavior;
@end

{% endhighlight %}
 
On peut voir que nous pouvons préciser si les méthodes doivent être obligatoirement implémentée ou non grâce aux annotations *@required* et *@optional*.

Utiliser un protocole
---

Pour hériter d’un protocol il suffit de le préciser dans sa déclaration:

C++
{% highlight C++ %}

#import "InterfaceMyClass.h"
 
class MyClass : InterfaceMyClass 
{
  // ...
}

{% endhighlight %}

versus

Objective-C
{% highlight Objective-C %}

#import "MyClassProtocol.h"
 
@interface MyClass : NSObject <MyClassProtocol>
  // ...
@end

{% endhighlight %}

Il n’y a pas grand chose a dire de plus sur les protocols, si ce n’est que contrairement à l’héritage, vous pouvez choisir d’en respecter plusieurs en même temps.

