FROM alpine:3.15

ARG ANTLR_VERSION="4.9.3"
ENV ANTLR_VERSION=$ANTLR_VERSION
ENV CLASSPATH=".:/usr/local/lib/antlr-${ANTLR_VERSION}-complete.jar:$CLASSPATH"

# Install packages
RUN apk --no-cache add curl \
    bash-completion \
    openjdk17

# Install ANTLR
RUN cd /usr/local/lib/ \
    && curl -O https://www.antlr.org/download/antlr-${ANTLR_VERSION}-complete.jar

# Adds shell commands
COPY ./commands/*.sh /usr/bin/
RUN find /usr/bin -type f -name "*.sh" | while read NAME ; do mv "${NAME}" "${NAME%.sh}" ; done

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
