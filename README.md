# Docker image for ANTLR4

[![Docker Hub](https://img.shields.io/badge/-Docker_Hub-0062cc?style=for-the-badge&logo=Docker&logoColor=white)][docker-hub]

A docker image for ANTLR4 inspired by the [official image][antlr4-docker].

```shell
docker pull alvarofpp/antlr4
```

## How to use

```shell
docker run --rm -v $(pwd):/work alvarofpp/antlr4 -Dlanguage=Go JSON.g4
```

```shell
docker run --rm -v $(pwd):/work alvarofpp/antlr4 -Dlanguage=Go -o src/
```

[antlr4-docker]: https://github.com/antlr/antlr4/tree/master/docker
[docker-hub]: https://hub.docker.com/r/alvarofpp/antlr4
