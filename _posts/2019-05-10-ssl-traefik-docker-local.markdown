---
layout: post
status: publish
published: false
title: SSL Traefik Docker Local 🐳🔐
author:
  display_name: Clément Demily
  login: cdemily
  email: demily.clement@gmail.com
  url: https://clementdemily.github.io/
author_login: cdemily
author_email: demily.clement@gmail.com
author_url: https://clementdemily.github.io/
date: "2019-05-14 08:01:04 +0100"
date_gmt: "2019-05-14 07:01:04 +0100"
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

## SSL

root.cnf

```bash
# OpenSSL configuration for Root CA

[ req ]

prompt             = no
string_mask        = default

# The size of the keys in bits:
default_bits       = 2048
distinguished_name = req_distinguished_name
x509_extensions    = x509_ext

[ req_distinguished_name ]

# Note that the following are in 'reverse order' to what you'd expect to see.

countryName = fr
organizationName = UnisC
commonName = UnisC Root CA

[ x509_ext ]

basicConstraints=critical,CA:true,pathlen:0
keyUsage=critical,keyCertSign,cRLSign
```

server.cnf

```bash
# OpenSSL configuration for end-entity cert

[ req ]

prompt             = no
string_mask        = default

# The size of the keys in bits:
default_bits       = 2048
distinguished_name = req_distinguished_name

x509_extensions    = x509_ext

[ req_distinguished_name ]

# Note that the following are in 'reverse order' to what you'd expect to see.

countryName = fr
organizationName = UnisC
commonName = Certificat Applications UnisC

[ x509_ext ]

keyUsage=critical,digitalSignature,keyAgreement

subjectAltName = @alt_names

# Multiple Alternate Names are possible
[alt_names]
DNS.1 = traefik.test
DNS.2 = portainer.test
DNS.3 = picto-elearning.test
DNS.4 = *.picto-elearning.test
DNS.5 = picto-observatory.test
DNS.6 = *.picto-observatory.test
DNS.7 = picto-dashboard.test
DNS.8 = *.picto-dashboard.test
DNS.9 = picto-audit.test
DNS.10 = *.picto-audit.test
DNS.11 = picto-referential-creator.test
DNS.12 = *.picto-referential-creator.test
DNS.13 = picto-api.test
DNS.14 = *.picto-api.test
DNS.15 = pictoaccess.test
DNS.16 = *.pictoaccess.test
DNS.17 = pictotravel.test
DNS.18 = *.pictotravel.test
DNS.19 = picto-admin.test
DNS.20 = *.picto-admin.test
DNS.21 = unisc-data-collect.test
DNS.22 = *.unisc-data-collect.test
```

## Créer un certificat SSL self-signed

```bash
openssl req -x509 -new -keyout certs/root.key -out certs/root.cer -config certs/conf/root.cnf
openssl req -nodes -new -keyout certs/server.key -out certs/server.csr -config certs/conf/server.cnf
openssl x509 -days 825 -req -in certs/server.csr -CA certs/root.cer -CAkey certs/root.key -set_serial 123 -out certs/server.cer -extfile certs/conf/server.cnf -extensions x509_ext
```

Une fois cette étape passée :

```bash
  open .
```

Vous allez devoir double-cliquer sur le fichier "server.cer". Une fenêtre système s'affichera et vous devrez alors double-cliquer sur l'entrée "Certificat Applications UnisC".

Une fois cela fait, vous devrez cliquer sur la petite flêche "se fier" et changer la valeur du select par "Toujours approuver". Vous devrez ensuite taper votre mot de passe système pour valider.

### Lancer Traefik via docker-compose

Il ne vous reste plus qu'a lancer cette dernière commande :

`docker-compose -f docker-compose-traefik.yml up`

Vous pouvez également executer cette commande en arrière-plan :

`docker-compose -f docker-compose-traefik.yml up -d`

Si vous desirez stoper les containers :

`docker-compose -f docker-compose-traefik.yml down`

### Test

vous pouvez maintenant consulter les adresses suivantes :

- Portainer ( https://portainer.test/#/auth?redirect=portainer.auth )
- Traefik ( https://traefik.test/dashboard/ )

## traefik yaml

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
      # - "$PWD/traefik.toml:/traefik.toml"
      - "./traefik-ssl.toml:/traefik.toml"
      - "./certs/:/certs/"
    restart: unless-stopped
    labels:
      - "traefik.frontend.rule=Host:traefik.test"
      - "traefik.port=8080"
      - "traefik.backend=traefik"
      - "traefik.frontend.entryPoints=http,https"

  portainer:
    image: portainer/portainer
    networks:
      - traefik
    labels:
      - "traefik.frontend.rule=Host:portainer.test"
      - "traefik.port=9000"
      - "traefik.backend=portainer"
      - "traefik.frontend.entryPoints=http,https"
    volumes:
      - "/var/run/docker.sock:/var/run/docker.sock"
      - portainer_data:/data
    restart: unless-stopped
    depends_on:
      - proxy

networks:
  traefik:
    external:
      name: traefik

volumes:
  portainer_data: {}
```

traefik-ssl.toml

```ini
# traefik.toml
################################################################
# Global configuration
################################################################

logLevel = "DEBUG"
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

## Mise en place de traefik et du custom DNS pour les projets

Voici un exemple de docker-compose ( picto-elearning ) :

```yaml
version: "3"
services:
  web:
    networks:
      - traefik
    labels:
      - "traefik.enable=true"
      - "traefik.backend=picto-elearning-web"
      - "traefik.frontend.rule=Host:picto-elearning.test"
      - "traefik.port=26000"
      - "traefik.frontend.entryPoints=http,https"
      - "traefik.docker.network=traefik"

# ...

networks:
  traefik:
    external:
      name: traefik
```

Les labels présentées ici ne sont pas exhaustifs, mais comme vous pouvez le voir on peut préciser un port, un hostname, les entrypoints et le nom du backend.

L'autre clause importante est "network", il faut bien préciser que c'est un external network.
