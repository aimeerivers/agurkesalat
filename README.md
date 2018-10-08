# agurkesalat
Kom hurtigt i gang med funktionelle tests i Ruby, Cucumber, Selenium og Docker.

## Kom i gang

Du skal har brug for [Git](https://git-scm.com/downloads) og [Docker](https://www.docker.com/get-started)

Clone det her repository med git.

    git clone git@github.com:sermoa/agurkesalat.git
    cd agurkesalat

## Start et selenium netværk

Vi bruger filen `docker-compose.yml` til at starte 3 Docker containers:

* selenium_hub
* firefox
* chrome

    docker-compose up -d

Besøg http://localhost:4444/grid/console om at se dit selenium netværk.

![Selenium netværk med en firefox node og en chrome node](billeder/selenium_hub.png "Selenium netværk med en firefox node og en chrome node")
