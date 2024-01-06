FROM ubuntu:20.04

ARG MODULAR_AUTH
ENV MODULAR_AUTH="${MODULAR_AUTH:?未定義です}"

ENV HOME_DIR=/root
ENV MODULAR_HOME="${MODULAR_HOME:-${HOME_DIR}/.modular}"

ENV APP_DIR=/app

# Install required packages
#
# tzdataを先にnoninteractiveでインストールしておかないと、
# 途中でタイムゾーン選択の入力待ちになり止まってしまう。
RUN apt-get update \
    && apt-get upgrade \
    && DEBIAN_FRONTEND=noninteractive apt-get --yes --no-install-recommends install \
    curl \
    libedit-dev \
    python3-venv \
    tzdata \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    ;

# Install modular & mojo
RUN curl https://get.modular.com | bash - \
    && modular clean \
    && modular install mojo \
    ;

# Add environment variables to `.bashrc`
RUN echo export MODULAR_HOME="${MODULAR_HOME}" >> "${HOME_DIR}/.bashrc" \
    && echo export PATH="${MODULAR_HOME}/pkg/packages.modular.com_mojo/bin:${PATH}" >> "${HOME_DIR}/.bashrc"

WORKDIR "${APP_DIR}"

ENTRYPOINT ["/bin/bash"]
