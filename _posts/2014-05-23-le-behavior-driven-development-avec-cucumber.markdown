---
layout: post
status: publish
published: true
title: Le Behavior Driven-Development avec Cucumber
author:
  display_name: Clément Demily
  email: demily.clement@gmail.com
  url: https://clementdemily.github.io/
author_login: cdemily
author_email: demily.clement@gmail.com
author_url: https://clementdemily.github.io/
date: "2014-05-23 12:00:00 +0200"
date_gmt: "2014-05-23 10:00:00 +0200"
categories:
  - tutoriel
  - Ruby
tags:
  - cucumber
  - bdd
  - test
comments: []
---

Aujourd’hui nous allons parler du _Behavior-Driven Development_, plus particulièrement son utilisation dans **RubyOnRails** grâce à la gem **cucumber**.

# C’est quoi le BDD?

le [Behavior-Driven Development](http://www.wikiwand.com/fr/Behavior_Driven_Development) est une méthode agile qui met l’accent sur le travail en collaboration entre des personnes techniques (comme des ingénieurs) avec des personnes non techniques.

La particularité de cette méthode de travail est qu’elle est très "verbeuse": On décrit une fonctionnalité (_feature_) en langage naturel, puis on écrit des scénarios d’acceptation (toujours en langage naturel) pour illustrer celle-ci. Chaque scénario est composé de plusieurs étapes (_steps_) qui commencent toutes par un mot-clé significatif: _Given_, _When_, et _Then_ qui peuvent être liés par le mot-clé _And_.

# Et donc, que fait cucumber dans l’histoire?

[Cucumber](http://cukes.info/) est une gem qui permet de rédiger et d’exécuter ce type de test d’acceptation de manière automatique.

![Logo-cucumber]({{ site.base_url }}/img/2014/05/cucumber-logo.png){: .center-image }

Nous décrivons notre fonctionnalité dans un fichier .feature, puis nous implémentons chaque steps dans un fichier à part.

Tout d’abord, installons **cucumber** et **capybara** via notre gemfile:

{% highlight ruby %}

group :development, :test do
gem 'cucumber-rails', '~> 1.4.1', :require => false
gem 'database_cleaner', '~> 1.2.0'
gem 'capybara', '~> 2.2.1'
end

{% endhighlight %}

Noter que j’utilise **cucumber** dans un projet **rails**, je peux donc directement utiliser la gem **cucumber-rails**. On nous renseigne sur le dépôt github qu’il est fortement recommandé d’installer la gem **database_cleaner**.

Installer les nouvelles gems via la commande suivante:

{% highlight bash %}

bundle install

{% endhighlight %}

Ensuite, vous pouvez exécuter la commande suivante :

{% highlight bash %}

rails g cucumber:install

{% endhighlight %}

Cette commande installeras les fichiers et dossiers nécessaire au fonctionnement de **cucumber**.

En exécutant la commande cucumber vous pourrez lancer les tests d’acceptation que vous aurez préalablement rédigé.

# Notre première feature

Pour illustrer le fonctionnement de cucumber je vais utiliser l’exemple d’un formulaire d’authentification.
Nous partons du postulat que nous avons un formulaire d'authentification fonctionnel et que celui à besoin d'être testé et de figurer dans notre répertoire de tests d'acceptations.

{% highlight ruby %}

Authentication.feature

Feature: Authentication
In order to be authenticated on the website
A visitor
Should use an authentication form

@authentication_form
Scenario: Authentication via sign in form
Given I'm a guest on the sign in page
And I fill in "user_email" with "mymail@mail.com"
And I fill in "user_password" with "mysecretpassword"
When I press "Sign in"
Then I should be authenticate

@authentication_form
Scenario: Authentication attempt via sign in form (password error)
Given I'm a guest on the sign in page
And I fill in "user_email" with "mymail@mail.com"
And I fill in "user_password" with "anotherpassword"
When I press "Sign in"
Then I shouldn't be authenticated

{% endhighlight %}

Comme vous pouvez le voir, on ne croirait pas voir des tests mais bien l'extrait d’un cahier des charges! (En anglais ;) )

Voici le fichier contenant les _steps_ associées a cette _feature_:

{% highlight ruby %}

authentication_steps.rb

Given(/^I'm a guest on the sign in page\$/) do
visit new_user_session_path
end

Given(/^I fill in "(._?)" with "(._?)"\$/) do |field, value|
fill_in field, with: value
end

Given(/^I should be redirect on the Sign up page\$/) do
expect(page).to have_content 'Inscription'
end

When(/^I press "(.\*?)"\$/) do |button|
click_button button
end

Then(/^I should be authenticate\$/) do
expect(page).to have_content 'You are now authenticate'
end

Then(/^I shouldn't be authenticated\$/) do
expect(page).to have_content 'Authentication error'
end

{% endhighlight %}

On peut observer qu’une _step_ n’est composée ici que d’une action élémentaire. Ce n'est pas une règle mais plutôt une bonne pratique. Nous utilisons ici la gem **capybara** pour simuler des événements navigateur comme un clique sur un bouton ou encore le remplissage d'un champs de formulaire.

En lançant la commande suivante:

{% highlight bash %}

cucumber

{% endhighlight %}
Nous devrions voir le résultat de nos tests.

{% highlight bash %}

2 scenarios (0 failed, 2 passed)
10 steps (0 failed, 0 skipped, 10 passed)

{% endhighlight %}

# Pour aller plus loin: les tags et hooks

Un peu à la manière de **rspec**, il est parfois nécessaire d’effectuer des actions précise avant l’execution de nos tests pour les faire fonctionner.

Typiquement, dans le cadre d’une authentification, nous avons besoin d’un utilisateur dans la base de données qui possède l’email et le mot de passe correspondant a notre scénario.

C’est ainsi qu’interviennent les _tags_ et les _hooks_. Ce sont des manières d’indiquer a **cucumber** qu’il faut effectuer certaines actions avant (ou après) l’exécution d’un scénario.

Il suffit de placer un _@_ suivi du nom d’identifier de votre choix. Ici j’ai choisi _@authentication_form_.
Vous pourrez voir où ce place les _tags_ en regardant l'extrait de code du fichier _Authentication.feature_.

Le code de notre _hook_ se placera dans le dossier _support_, contenu dans le dossier _features_, à la racine de notre application.

{% highlight ruby %}

authentication_hooks.rb

Before('@authentication_form') do
FactoryGirl.create(:user, email: "mymail@mail.com", password: "mysecretpassword")
end

{% endhighlight %}

Ici rien de particulier, cela ressembles fortement a la directive _before_, utilisable avec **rspec**. Sachez tout de même qu’il existe d’autres types de block, comme _After_.
