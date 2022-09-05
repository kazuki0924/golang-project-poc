FROM ubuntu:focal-20220801

# disable interactive dialogue
ENV DEBIAN_FRONTEND noninteractive

RUN set -ex \
  && apt-get update \
  && apt-get -y upgrade \
  && apt-get install -y \
    bash \
    cargo \
    curl \
    fd-find \
    fzf \
    git \
    jq \
    make \
    postgresql \
    postgresql-contrib \
    ripgrep \
    vim \
    wget \
    zip \
  && rm -rf /var/cache/apt

# fd
RUN ln -s "$(which fdfind)" /usr/local/bin/fd

# cargo
RUN echo 'export PATH="${PATH}:${HOME}/.cargo/bin"' >> ~/.bashrc

# sd
RUN cargo install sd

# sops
ENV SOPS_VERSION v3.7.3
RUN wget -O /usr/local/bin/sops https://github.com/mozilla/sops/releases/download/${SOPS_VERSION}/sops-${SOPS_VERSION}.linux.$(dpkg --print-architecture) && chmod +x /usr/local/bin/sops

# yq
ENV YQ_VERSION v4.27.2
RUN wget https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_$(dpkg --print-architecture).tar.gz -O /usr/bin/yq && chmod +x /usr/bin/yq

# dbmate
ENV DBMATE_VERSION v1.15.0
RUN curl -fsSL -o /usr/local/bin/dbmate https://github.com/amacneil/dbmate/releases/download/${DBMATE_VERSION}/dbmate-linux-$(dpkg --print-architecture) && chmod +x /usr/local/bin/dbmate
