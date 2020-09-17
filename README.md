[![Build Status](https://travis-ci.com/Otus-DevOps-2020-05/etoosamoe_microservices.svg?branch=master)](https://travis-ci.com/Otus-DevOps-2020-05/etoosamoe_microservices)

# etoosamoe's microservices repo

# ДЗ docker-2 (оно же докер-1)

Сегодня я поэкспериментировал с докером, раньше руки до него не доходили.
* Поставил на локальной машинке, поставил на удаленной.
* Поработал с docker-machine

* Собрал свой образ
* Загрузил его в докер-хаб
* Загрузил образ на локальную машинку под WSL2 и он даже запустился

* Собрал прототип инфры

# ДЗ docker-3

_а у меня все образы начали собираться с Step 1, который FROM, а дальше apt-get update.. странно_

Сегодня я молодец:
* загрузил кучу образов в докерхаб
* создал отдельную сеть для приложения
* сделал так, база сохранялась при пересоздании контейнеров с помощью docker volume
* оптимизировал образы, установив alpine

Создать образ на докерхабе

```bash
docker build -t etosamoe/image-name:1.0 ./folder
```

Создать сеть

```bash
docker network create reddit
```

Запустить контейнеры из образов на докерхабе:

```bash
docker run -d --network=reddit --network-alias=post_db --network-alias=comment_db -v reddit_db:/data/db mongo:latest
docker run -d --network=reddit --network-alias=post etosamoe/post:1.0
docker run -d --network=reddit --network-alias=comment etosamoe/comment:1.0
docker run -d --network=reddit -p 9292:9292 etosamoe/ui:2.0
```

# ДЗ docker-4


Сегодня покрутил сети в докере.
Закидывал контейнеры в разные сети, изолировал их друг от друга.

Поменять имя: опция  ``-p`` или ``--project-name NAME`` или переменной окружения ``COMPOSE_PROJECT_NAME``

Чтобы компоуз заработал, пришлось сделать такую штуку: ``export COMPOSE_TLS_VERSION=TLSv1_2``

# ДЗ gitlab-ci-1

 - помучился с разворачиванием докера ансиблом
 - поставил докер руками
 - запустил гитлаб и раннер
 - поигрался с пайплайнами

  Задания со звездочкой отложу на потом, если дойдут руки..
