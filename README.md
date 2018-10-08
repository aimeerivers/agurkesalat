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

Sådan:

    docker-compose up -d

Besøg http://localhost:4444/grid/console om at se dit selenium netværk.

![Selenium netværk med en firefox node og en chrome node](billeder/selenium_hub.png "Selenium netværk med en firefox node og en chrome node")

Her har du skabet et selenium netværk med 3 containers: en selenium hub og 2 selenium nodes, en til firefox browser, og en til chrome browser. Containerne er klar til at køre tests for dig.

Containerne existerer i et netværk, der hedder `agurkesalat_default`.

![Selenium netværk diagram](billeder/selenium_hub_diagram.png "Selenium netværk diagram")

