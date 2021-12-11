FROM alpine:3.15

# Set environment variables
ENV HOME=/root
ENV WORKDIR=/app

# Install packages
RUN apk --no-cache add findutils  \
    curl \
    bash-completion \
    git

# Install apps here

# Adds shell commands
COPY ./commands/*.sh /usr/bin/
RUN find /usr/bin -type f -name "*.sh" | while read NAME ; do mv "${NAME}" "${NAME%.sh}" ; done

# Workdir and entrypoint
WORKDIR ${WORKDIR}

ENTRYPOINT ["docker-entrypoint"]
