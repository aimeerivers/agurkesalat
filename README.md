agurkesalat
===========

Kom hurtigt i gang med funktionelle tests i Ruby, Cucumber, Selenium og Docker.

![Salat med agurk og andre grøntsager](billeder/agurkesalat.jpg "Salat med agurk og andre grøntsager")

#### Indhold

* [Kom i gang](#kom-i-gang)
* [Start et selenium netværk](#start-et-selenium-netværk)
* [Bygg en container for at køre dine tests](#bygg-en-container-for-at-køre-dine-tests)
* [Kør dine tests indenfor din container](#kør-dine-tests-indenfor-din-container)
* [Skriv nye tests](#skriv-nye-tests)
  - [Når du har brug for en ny gem](#når-du-har-brug-for-en-ny-gem)



Kom i gang
----------

Du skal har brug for [Git](https://git-scm.com/downloads) og [Docker](https://www.docker.com/get-started)

Klon det her repository med git.

    git clone git@github.com:sermoa/agurkesalat.git
    cd agurkesalat



Start et selenium netværk
-------------------------

Vi bruger filen `docker-compose.yml` til at starte 3 Docker containers:

* selenium_hub
* firefox
* chrome

Sådan:

    docker-compose up -d

Besøg http://localhost:4444/grid/console om at se dit selenium netværk.

![Selenium netværk med en firefox node og en chrome node](billeder/selenium_hub.png "Selenium netværk med en firefox node og en chrome node")

Her har du skabet et selenium netværk med 3 containers: en selenium hub og 2 selenium nodes, en til firefox browser, og en til chrome browser. Containerne er klar til at køre tests for dig.

Containerne eksisterer i et netværk, der hedder `agurkesalat_default`.

![Selenium netværk diagram](billeder/selenium_hub_diagram.png "Selenium netværk diagram")

Hvis du vil, kan du tilføje flere nodes af firefox og chrome. Det kan være nyttigt når du vil køre flere tests parallelt.

    docker-compose up -d --scale firefox=3 --scale chrome=3

Nu har du 3 firefox nodes og 3 chrome nodes.

![Selenium netværk med flere nodes](billeder/selenium_hub_flere_nodes.png "Selenium netværk med flere nodes")

![Selenium netværk med flere nodes diagram](billeder/selenium_hub_flere_nodes_diagram.png "Selenium netværk med flere nodes diagram")

Du kan godt se hvor mange docker containers kører på tidspunkt:

    docker container ls

Når du er færdig med netværket, stopper du det sådan:

    docker-compose down



Bygg en container for at køre dine tests
----------------------------------------

Vi bruger filen `Dockerfile` til at bygge en container med Ruby og Cucumber. Vi kan tagge den som `agurkesalat` (et andet navn er også okay, men husk navnet!)

    docker build -t agurkesalat .



Kør dine tests indenfor din container
-------------------------------------

    docker run -t --network agurkesalat_default agurkesalat

Vi kører containeren `agurkesalat` og bruger netværket `agurkesalat_default` som blev skabet før med `docker-compose` kommandoen.

Nu har du en anden container i det samme netværk, som kan tale med din selenium hub. Din selenium hub skal vælge en node (firefox eller chrome) der kan køre dine tests.

![Cucumber container kører tests i netværket](billeder/agurkesalat_diagram.png "Cucumber container kører tests i netværket")



Skriv nye tests
---------------

Normalt kører testerne som blev bygget i containeren. Når du ikke vil bygge kontinuerligt en nye container image, kan du montere en lokale mappe inden containeren sådan:

    docker run -t --network agurkesalat_default --volume `pwd`/features:/arbejde/features agurkesalat



### Når du har brug for en ny gem

Tilføj den til `Gemfile` og kør den her kommando til at opdatere `Gemfile.lock`:

    docker run --rm --volume `pwd`:/arbejde --workdir /arbejde ruby:2.5.1 bundle lock --update

Husk at genbygge din agurkesalat container.

    docker build -t agurkesalat .
