FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    software-properties-common \
    git \
    curl \
    ripgrep \
    && add-apt-repository -y ppa:neovim-ppa/unstable \
    && apt-get update \
    && apt-get install -y neovim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace
