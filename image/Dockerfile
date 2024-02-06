FROM alpine:3.19.1

ARG ANTLR_VERSION="4.13.1"
ENV ANTLR_VERSION=$ANTLR_VERSION
ENV CLASSPATH=".:/usr/local/lib/antlr-${ANTLR_VERSION}-complete.jar:$CLASSPATH"

# Install packages
RUN apk --no-cache add curl \
    bash-completion \
    openjdk17 \
    fontconfig \
    ttf-dejavu

# Install ANTLR
RUN curl -O --output-dir /usr/local/lib/ https://www.antlr.org/download/antlr-${ANTLR_VERSION}-complete.jar

# Adds shell commands
COPY ./commands/* /usr/bin/

# Set user
ARG USER=appuser
ARG UID=1000
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "$(pwd)" \
    --no-create-home \
    --uid "${UID}" \
    "${USER}"
USER $UID

# Workdir and entrypoint
WORKDIR /work
ENTRYPOINT []
