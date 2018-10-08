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
