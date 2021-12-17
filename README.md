# Docker image for ANTLR4

[![Docker Hub](https://img.shields.io/badge/-Docker_Hub-0062cc?style=for-the-badge&logo=Docker&logoColor=white)][docker-hub]

A docker image based in Alpine for [ANTLR4][antlr4], inspired by the [official image][antlr4-docker].

```shell
docker pull alvarofpp/antlr4
```

## How to use

Generate files from your grammar:

```shell
docker run --rm -v $(pwd):/work alvarofpp/antlr4 antlr -Dlanguage=Java Expr.g4
```

Compile:

```shell
docker run --rm -v $(pwd):/work alvarofpp/antlr4 javac src/Expr*.java
```

View using the GUI (tested on Ubuntu 20.04.3 LTS):

```shell
docker run --rm -it \
  -e DISPLAY=$(hostname -I | cut -f1 -d' '):0 \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $(pwd)/src:/work alvarofpp/antlr4 grun Expr prog -gui
```

[antlr4]: https://github.com/antlr/antlr4
[antlr4-docker]: https://github.com/antlr/antlr4/tree/master/docker
[docker-hub]: https://hub.docker.com/r/alvarofpp/antlr
