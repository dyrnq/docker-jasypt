ARG BASE_IMAGE
FROM ${BASE_IMAGE}

ARG user=jasypt
ARG group=jasypt
ARG uid=1000
ARG gid=1000
ARG JASYPT_HOME=/opt/jasypt

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.utf8 \
    JASYPT_HOME=${JASYPT_HOME}

RUN set -eux; \
    apt-get clean && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install -yq \
    locales \
    ca-certificates \
    curl \
    openssh-client \
    psmisc \
    procps \
    iproute2 \
    tree \
    libfreetype6-dev \
    fontconfig \
    unzip \
    less \
    xz-utils \
    p7zip-full \
    zip \
    jq \
    && \
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 && \
    groupadd -g ${gid} ${group} && useradd -d "$JASYPT_HOME" -u ${uid} -g ${gid} -m -s /bin/bash ${user}



# jasypt version being bundled in this docker image
ARG JASYPT_VERSION
ENV JASYPT_VERSION ${JASYPT_VERSION:-1.9.3}

RUN set -eux; \
    mkdir -p "${JASYPT_HOME}"; \
    chown -R ${uid}:${gid} ${JASYPT_HOME}; \
    curl --retry 3 -fsSL -o ${JASYPT_HOME}/jasypt-${JASYPT_VERSION}-dist.zip https://github.com/jasypt/jasypt/releases/download/jasypt-${JASYPT_VERSION}/jasypt-${JASYPT_VERSION}-dist.zip; \
    unzip -o ${JASYPT_HOME}/jasypt-${JASYPT_VERSION}-dist.zip -d ${JASYPT_HOME}; \
    mv ${JASYPT_HOME}/jasypt-${JASYPT_VERSION}/* ${JASYPT_HOME}; \
    rm -rf ${JASYPT_HOME}/jasypt-${JASYPT_VERSION}; \
    rm -rf ${JASYPT_HOME}/jasypt-${JASYPT_VERSION}-dist.zip; \
    chown -R ${uid}:${gid} "${JASYPT_HOME}"; \
    chmod +x "${JASYPT_HOME}"/bin/*.sh


COPY rootfs /
USER ${user}
ENV PATH=$PATH:$JASYPT_HOME/bin
WORKDIR $JASYPT_HOME
ENTRYPOINT ["docker-entrypoint.sh"]