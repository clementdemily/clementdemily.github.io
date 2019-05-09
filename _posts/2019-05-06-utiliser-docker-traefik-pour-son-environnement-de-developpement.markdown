---
layout: post
status: publish
published: true
title: Utiliser Docker & Traefik pour son environnement de développement 🐳
author:
  display_name: Clément Demily
  login: cdemily
  email: demily.clement@gmail.com
  url: https://clementdemily.github.io/
author_login: cdemily
author_email: demily.clement@gmail.com
author_url: https://clementdemily.github.io/
date: "2019-05-06 03:01:04 +0100"
date_gmt: "2019-05-06 01:01:04 +0100"
categories:
  - tutoriel
  - unix
tags:
  - docker
  - traefik
  - dnsmasq
  - mac
comments: []
---

Bonjour à tous ! 👋

Nous allons aujourd'hui voir comment utiliser Docker et Traefik afin d'avoir des noms de domaines personnalisés pour nos applications en développement. Pour se faire, nous allons utiliser traefik.

Traefik est un reverse proxy / load balancer. Il dispose de plein de fonctionnalités cool comme l'auto discovery, une configuration simplifiée pour des metrics ou encore une gestion facilité des certificats SSL ( let's encrypt, ACME etc..) ce qui en fait un allié de choix pour pas mal de services d'orchestration de container ( Kubernetes, Mesos ... ).

Nous allons aujourd'hui voir comment on peut faire fonctionner tout ça ensemble.

## Installation et configuration de dnsmasq

Dnsmasq est un soft qui permet de fournir des services DNS. Nous allons le configurer pour qu'il redirige toutes les requêtes HTTP de la forme \*.test vers le localhost.

Installation sur mac ( via brew ) :

```bash
brew install dnsmasq
```

Ajout de la configuration de redirection :

```bash
sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/test'
sudo echo 'address=/.test/127.0.0.1' > $(brew --prefix)/etc/dnsmasq.conf
```

Redémarrer le service :

```bash
sudo launchctl unload -w /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
```

## Installation et configuration de traefik

Voici deux fichiers de configuration nécessaire pour faire fonctionner traefik. J'utilise ici un fichier docker-compose mais il est tout à fait possible de lancer ce container en ligne de commande. Le deuxième fichier inclut la configuration minimale pour faire fonctionner traefik.

Comme vous pouvez le voir, les configurations de routing se fait grace aux labels. Vous retrouverez la liste des directives sur la documentations de traefik ( [https://docs.traefik.io/configuration/backends/docker/#on-containers](https://docs.traefik.io/configuration/backends/docker/#on-containers) )

docker-compose-traefik.yml

```yaml
version: "3"

services:
  proxy:
    image: traefik
    networks:
      - traefik
    ports:
      - "80:80"
      - "8080:8080"
      - "443:443"
    volumes:
      - "/var/run/docker.sock:/var/run/docker.sock"
      - "./traefik.toml:/traefik.toml"
    restart: unless-stopped
    labels:
      - "traefik.frontend.rule=Host:traefik.test"
      - "traefik.port=8080"
      - "traefik.backend=traefik"
      - "traefik.frontend.entryPoints=http"

networks:
  traefik:
    external:
      name: traefik
```

traefik.toml

```ini
defaultEntryPoints = ["http"]

[entryPoints]
  [entryPoints.http]
  address = ":80"

[web]
address = ":8080"
[web.auth.basic]
  users = ["admin:$apr1$o1HmXW0i$wWgVewL1kLu9gaqmMDh6u/"]

[docker]
endpoint = "unix:///var/run/docker.sock"
domain = "test"
watch = true
exposedbydefault = true
```

Vous pouvez dès a présent lancer la commande `docker-compose -f docker-compose-traefik.yml up` pour démarrer le container.
Une fois l'opération terminée, rendez-vous sur votre navigateur à l'adresse suivante : [http://traefik.test](http://traefik.test).

Dans le fichier de configuration traefik.toml un auth basic est configuré ( login: admin, mdp: admin ).

Vous devriez voir après ça le superbe dashboard de traefik ! 🎉🎊

## Utilisation de traefik

Vous allez pouvoir maintenant tester traefik. Pour cela, nous allons utiliser l'image `tutum/hello-world`.

```bash
docker run --network=traefik --label="traefik.enable=true" --label="traefik.frontend.rule=Host:hello-world.test" --label="traefik.backend=hello-world" --label="traefik.port:26000" --label="traefik.frontend.entryPoints=http" -p 26000:80 tutum/hello-world
```

A présent, à l'aide de votre navigateur, rendez-vous sur sur [http://hello-world.test/](http://hello-world.test/)

Et voilà ! 👏

## What's next ?

Pour le prochain article, nous verrons comment générer un certificat SSL afin d'utiliser le HTTPS pour votre environnement de développement.

## Resources et liens utiles

- [https://docs.docker.com/compose/](https://docs.docker.com/compose/)
- [https://docs.traefik.io/configuration/backends/docker](https://docs.traefik.io/configuration/backends/docker)
- [https://traefik.io/](https://traefik.io/)
- [https://wiki.debian.org/HowTo/dnsmasq](https://wiki.debian.org/HowTo/dnsmasq)
