---
layout: post
status: publish
published: true
title: Auto-générer un certificat et configurer Traefik pour utiliser le SSL en Local 🔐
author:
  display_name: Clément Demily
  login: cdemily
  email: demily.clement@gmail.com
  url: https://clementdemily.github.io/
author_login: cdemily
author_email: demily.clement@gmail.com
author_url: https://clementdemily.github.io/
date: "2019-05-14 08:30:00 +0100"
date_gmt: "2019-05-14 08:30:00 +0100"
categories:
  - tutoriel
  - unix
tags:
  - docker
  - traefik
  - ssl
  - mac
comments: []
---

Bonjour à tous ! 👋

Après avoir vu dans un précédent billet comment utiliser **Traefik** avec **Docker** pour avoir des noms de domaines personnalisés, nous allons désormais voir comment auto-générer un certificat puis configurer **Traefik** pour l'utiliser. Une fois cela fait nous pourrons alors accéder a nos applications via **https**.


## Création des fichiers de configuration

Pour générer facilement les fichiers nécessaires, vous aurez besoin de créer ces deux fichiers de configuration.

root.cnf
```bash
[ req ]

prompt             = no
string_mask        = default

default_bits       = 2048
distinguished_name = req_distinguished_name
x509_extensions    = x509_ext

[ req_distinguished_name ]

countryName = fr
organizationName = MyLocalDev
commonName = MyLocalDev Root CA

[ x509_ext ]

basicConstraints=critical,CA:true,pathlen:0
keyUsage=critical,keyCertSign,cRLSign
```

server.cnf

```bash
[ req ]

prompt             = no
string_mask        = default

default_bits       = 2048
distinguished_name = req_distinguished_name

x509_extensions    = x509_ext

[ req_distinguished_name ]

countryName = fr
organizationName = MyLocalDev
commonName = Certificat Applications MyLocalDev

[ x509_ext ]

keyUsage=critical,digitalSignature,keyAgreement

subjectAltName = @alt_names

[ alt_names ]
DNS.1 = traefik.test
```

Quelques indications complémentaires sur **organizationName** et **commonName** : ce sont les informations qui apparaîtrons dans les détails du certificat (lorsque vous l'inspecterez avec votre navigateur).

La section **alt_names** permet de définir la liste des DNS qui seront validés par le certificat. Pour l'exemple, nous utiliserons le DNS "traefik.test". C'est ici qu'il faudra ajouter les noms des domaine que vous voulez ajouter.


## Générer le certificat SSL

Une fois nos fichiers de configuration créés, nous allons utiliser les commandes suivantes :

```bash
openssl req -x509 -new -keyout root.key -out root.cer -config root.cnf
openssl req -nodes -new -keyout server.key -out server.csr -config server.cnf
openssl x509 -days 825 -req -in server.csr -CA root.cer -CAkey root.key -set_serial 123 -out server.cer -extfile server.cnf -extensions x509_ext
```

_à partir d'ici, je vais vous décrire la méthode à suivre sur mac_

Une fois cette étape passée :

```bash
  open .
```

Vous allez devoir double-cliquer sur le fichier "server.cer". Une fenêtre système s'affichera et vous devrez alors double-cliquer sur l'entrée "Certificat Applications MyLocalDev".

Une fois cela fait, vous devrez cliquer sur la petite flêche "se fier" et changer la valeur du select par "Toujours approuver". Vous devrez ensuite taper votre mot de passe système pour valider.

_Voici quelques pistes pour réaliser cette étape sur unix_

- [https://manuals.gfi.com/en/kerio/connect/content/server-configuration/ssl-certificates/adding-trusted-root-certificates-to-the-server-1605.html](https://manuals.gfi.com/en/kerio/connect/content/server-configuration/ssl-certificates/adding-trusted-root-certificates-to-the-server-1605.html)
- [https://unix.stackexchange.com/questions/90450/adding-a-self-signed-certificate-to-the-trusted-list](https://unix.stackexchange.com/questions/90450/adding-a-self-signed-certificate-to-the-trusted-list)

## Mise à jour du fichier docker-compose

traefik-ssl.toml

```ini
defaultEntryPoints = ["https", "http"]

[accessLog]
[traefikLog]

[entryPoints]
  [entryPoints.http]
  address = ":80"
    [entryPoints.http.redirect]
    entryPoint = "https"
  [entryPoints.https]
  address = ":443"
    [entryPoints.https.tls]
      [entryPoints.https.tls.defaultCertificate]
        certFile = "/certs/server.cer"
        keyFile = "/certs/server.key"

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

docker-compose.traefik.yml
```yaml
version: "3"

services:
  proxy:
    image: traefik
    networks:
      - traefik
    ports:
      - "80:80"
      - "443:443"
      - "8080:8080"
    volumes:
      - "/var/run/docker.sock:/var/run/docker.sock"
      - "./traefik-ssl.toml:/traefik.toml"
      - "./certs/:/certs/"
    restart: unless-stopped
    labels:
      - "traefik.frontend.rule=Host:traefik.test"
      - "traefik.frontend.entryPoints=http,https"
      - "traefik.backend=traefik"
      - "traefik.port=8080"

networks:
  traefik:
    external:
      name: traefik
```

Quelques précisions : 
- je pars du principe que les fichiers server.cer et server.key se trouve dans un dossier "certs", à la racine du fichier docker-compose. 
- de la même façon, le fichier traefik-ssl.toml doit se trouver au même niveau que le fichier docker-compose.


## Lancer Traefik via docker-compose

Il ne vous reste plus qu'a lancer cette dernière commande :

`docker-compose -f docker-compose.traefik.yml up`

Vous pouvez maintenant consulter les adresses suivantes :

- Traefik ( [https://traefik.test/](https://traefik.test/) )

Et voilà ! 👏

## Resources et liens utiles

- [https://docs.docker.com/compose/](https://docs.docker.com/compose/)
- [https://docs.traefik.io/configuration/backends/docker](https://docs.traefik.io/configuration/backends/docker)
- [https://traefik.io/](https://traefik.io/)
- [https://support.symantec.com/en_US/article.TECH242030.html](https://support.symantec.com/en_US/article.TECH242030.html)
- [https://clementdemily.github.io/2019/05/06/utiliser-docker-traefik-pour-son-environnement-de-developpement.html](https://clementdemily.github.io/2019/05/06/utiliser-docker-traefik-pour-son-environnement-de-developpement.html)
